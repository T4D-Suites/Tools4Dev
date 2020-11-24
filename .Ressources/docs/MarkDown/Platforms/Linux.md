 [<<< Back To Readme](../../../../README.md)
 <p align="center">
     <img src="https://github.com/T4D-Suites/T4D-Ressources/blob/master/LogoT4D.png">
 </p>

 **Welcome to Tools4Dev !**

 Tools4Dev is a Command Line Tools that will help you to dynamicaly define 
 a custom development process and deploy it all among your team. 



## Name
<p>Linux</p>


## Dependencies
```
APT
which git-lfs || sudo apt-get install -y git-lfs
which zsh || sudo apt-get install -y zsh
sudo apt-get install -y util-linux python python3-selinux patch jq
```
OR
```
DNF
which git-lfs || sudo dnf install -y git-lfs
which zsh || sudo dnf install -y zsh
sudo dnf install -y util-linux-user python libselinux-python patch jq
```


## Root Folder
```
mkdir -p $HOME/.tools4dev
cd $HOME/.tools4dev
```


## Clone Tools4Dev
```
git clone {URL} src
cd src
```


## Install Zshrc
Please choose One:

* If you already have Oh-My-ZSH and don't want to override your current .zshrc file
```
./t4d install append
zsh
```
* If doesn't care
```
./t4d install
zsh
```


## Clone Deps
```
cd .
wks clone
```


## Documentation
```
t4dDoc
``` 

