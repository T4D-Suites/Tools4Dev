#!/usr/bin/env ruby

require 'base64'
require 'digest'
require 'openssl'

# Author: @thesubtlety
# Decrypts Jenkins 2 encrypted strings, code change introduced around Jenkins ver 2.44
# Based off work by juyeong, https://gist.github.com/juyeong/081379bd1ddb3754ed51ab8b8e535f7c and 
# https://gist.github.com/thesubtlety/e7d26891227f0b68b9d5db1ea9870c62

# refer to
# https://github.com/jenkinsci/jenkins/blob/master/core/src/main/java/hudson/util/Secret.java
# https://github.com/jenkinsci/jenkins/blob/master/core/src/main/java/jenkins/security/ApiTokenProperty.java

def decrypt_key(master_key, hudson_secret_key)
  hashed_master_key = Digest::SHA256.digest(master_key)[0..15]
  intermediate = OpenSSL::Cipher.new('AES-128-ECB')
  intermediate.decrypt
  intermediate.key = hashed_master_key

  salted_final = intermediate.update(hudson_secret_key) + intermediate.final
  raise 'no magic key in a' unless salted_final.include?('::::MAGIC::::')
  salted_final[0..15]
end

def try_decrypt(encrypted,key)
  encrypted_text = Base64.decode64(encrypted).bytes

  iv_length = ((encrypted_text[1] & 0xff) << 24) | ((encrypted_text[2] & 0xff) << 16) | ((encrypted_text[3] & 0xff) << 8) | (encrypted_text[4] & 0xff)
  data_length = ((encrypted_text[5] & 0xff) << 24) | ((encrypted_text[6] & 0xff) << 16) | ((encrypted_text[7] & 0xff) << 8) | (encrypted_text[8] & 0xff)
  if encrypted_text.length != (1 + 8 + iv_length + data_length)
    abort 'invalid encrypted string'
  end
  iv = encrypted_text[9..(9 + iv_length)].pack('C*')[0..15]
  code = encrypted_text[(9 + iv_length)..encrypted_text.length].pack('C*').force_encoding('UTF-8')

  cipher = OpenSSL::Cipher.new('AES-128-CBC')
  cipher.decrypt
  cipher.key = key
  cipher.iv = iv

  text = cipher.update(code) + cipher.final
  if text.length == 32 #Guessing API token
    text = Digest::MD5.new.update(text).hexdigest
  end
  text
end

def main(filename, input)
  abort "usage: #{filename} <master.key> <hudson.util.Secret> encryptedText" unless input.length == 3

  master_key = File.read(input[0])
  hudson_secret_key = File.read(input[1])
  key = decrypt_key(master_key, hudson_secret_key)

#   usernames, passwords = [],[]
#   credfile = File.read(input[2])
#   credfile.scan(/<username>(.*?)<\/username>/) { |e| usernames << e.join(",") }
#   credfile.scan(/<password>(.*?)<\/password>/) { |e| passwords << e.join(",") }
#   creds = usernames.zip(passwords)
#   creds.each do |e|
    puts "#{try_decrypt(input[2],key)}"
#   end
end

if __FILE__ == $0
  main(__FILE__, ARGV)
end
