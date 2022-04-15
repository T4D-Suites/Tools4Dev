[<<< Back To Readme](../../../../README.md)
<p align="center">
    <img src="https://github.com/T4D-Suites/T4D-Ressources/blob/master/LogoT4D.png">
</p>

# _t4dCheckFile

## Synopsis
<p>check if file exist then return normalized output</p>


## Definition
<p>

if file exist will execute _t4dCheckSucceeded & return 0
if file does not exist will execute _t4dCheckFailed & return 1
</p>


## Example
<p>

* _t4dCheckFile $WS_ROOT/project.env              

>  check if file project.env exist in $WS_ROOT


</p>



# _t4dCheckVariable

## Synopsis
<p>check if variable is not empty</p>


## Definition
<p>

if variable is not empty will execute _t4dCheckSucceeded & return 0
if variable is empty will execute _t4dCheckFailed & return 1
</p>


## Example
<p>

* _t4dCheckVariable $WS_ROOT            

>  check if variable $WS_ROOT is not empty


</p>



# _t4dCheckFunction

## Synopsis
<p>check if sended argument is an actual defined shell function</p>


## Definition
<p>

if type contains "shell function" will return 0
if not, return 1

This function will allways return empty result. It can only be used by parsing $?
</p>


## Example
<p>

* _t4dCheckFunction wks              

>  return 0


</p>



# _t4dCheckFolder

## Synopsis
<p>check if current folder exist then return normalized output</p>


## Definition
<p>


If sended argument is an actual folder and exist, will execute _t4dCheckSucceeded then return 0
If sended argument is not a folder OR does not exist OR could not be found, will execute _t4dCheckFailed then return 1
</p>


## Example
<p>

* _t4dCheckFolder $WS_ROOT              

>  check if $WS_ROOT folder exist


</p>



# _t4dCheckFolderIsNotEmpty

## Synopsis
<p>if sended folder exist, send normalized output depending on his content</p>


## Definition
<p>


If folder exist, ls his content including hidden files. send normalized output depending on his content:
1. Folder exist and not empty           - execute _t4dCheckSucceeded and return 0
2. Folder exist and seems to be empty   - execute _t4dCheckWarning and return 0
3. Folder does not exist                - execute _t4dCheckFailed and return 1
</p>


## Example
<p>

* _t4dCheckFolderIsNotEmpty $WS_ROOT            

>  check if WS_ROOT is not empty


</p>



# _t4dCheckSymLink

## Synopsis
<p>read current symlink target and check if folder/file exist</p>


## Definition
<p>

Read sended argument, then check if folder or file exist. Send normalize output depending on the result
1. If simlink is good and folder or file exist, execute _t4dCheckSucceeded then return 0
2. If simlink is empty and sended argument seems to be an existing file/folder, execute _t4dCheckWarning and return 0
3. All other result (simlink empty and or folder/file not existing) execute _t4dCheckFailed and return 1
</p>


## Example
<p>

* _t4dCheckSymLink $WS_ROOT/Users           

>  Check if Users folder is currently a good symlink and his target exist


</p>



# _t4dCheckEnv

## Synopsis
<p>Check variable's values</p>


## Definition
<p>

Compare Variable sent in arg1 with value send in arg2.
{Text}
Sending normalized output depending on result
1. If arg2 is empty and var's data is not empty - execute _t4dCheckSucceeded then return 0
2. If var's data match with arg2 - execute _t4dCheckSucceeded then return 0
3. If var's doesn't match value but is not empty - execute _t4dCheckWarning then return 0
4. If var's data is empty - execute _t4dCheckFailed and return 1
</p>


## Example
<p>

* _t4dCheckEnv HOME $HOME            

>  check if HOME and verify that is content is $HOME


* _t4dCheckEnv HOME                  

>  check if HOME is set and not empty


</p>



# _t4dCheckVersion

## Synopsis
<p>check Tools4Dev version with sended and send normalized output</p>


## Definition
<p>

Check tools4dev version and return normalized output depending on result
Please see _t4dCheckBinaryVersion documentation to see exact output
</p>


## Example
<p>

* _t4dCheckVersion 5.0.0              

>  Check Tools4Dev version to verify that current t4d version is up-to-date


</p>



# _t4dCheckPackage

## Synopsis
<p>Check for package installed on fedora only</p>



# _t4dCheckBinary

## Synopsis
<p>DEPRECATED - see _t4dCheckCommand</p>


## Definition
<p>

Use **which** to check if sended arg is an actual binary present in PATH or if path-to-bin is correct

Sending normalized output depending on result
1. If result is not empty - execute _t4dCheckSucceeded then return 0
2. If result is empty - execute _t4dCheckFailed then return 1
</p>


## Example
<p>

* _t4dCheckBinary git              

>  Check if git is a binary and his dirname present in PATH


* _t4dCheckBinary /usr/bin/git     

>  Check if /usr/bin/git is valid


</p>



# _t4dCheckCommand

## Synopsis
<p>check if command exist</p>


## Definition
<p>

Use **which** to check if sended arg is an actual binary present in PATH or if path-to-bin is correct

Sending normalized output depending on result
1. If result is not empty - execute _t4dCheckSucceeded then return 0
2. If result is empty - execute _t4dCheckFailed then return 1
</p>


## Example
<p>

* _t4dCheckCommand git              

>  Check if git is a binary and his dirname present in PATH


* _t4dCheckCommand /usr/bin/git     

>  Check if /usr/bin/git is valid


</p>



# _t4dCheckBinaryVersion

## Synopsis
<p>Utilitary that compare binary version and send normalized output</p>


## Definition
<p>

First argument is pure syntax, it's what user will see


It will send normalized output depending on version's diff
1. Major ( BinaryParsedVersion <  Version) - execute _t4dCheckFailed then return 1
2. Major ( BinaryParsedVersion >  Version) - execute _t4dCheckInfo then return 0
3. Minor ( BinaryParsedVersion >  Version) - execute _t4dCheckSucceeded then return 0
4. Minor ( BinaryParsedVersion <  Version) - execute _t4dCheckWarning then return 2
5. Patch ( BinaryParsedVersion >  Version) - execute _t4dCheckSucceeded then return 0
6. Patch ( BinaryParsedVersion <  Version) - execute _t4dCheckWarning then return 3
</p>


## Usage
_t4dCheckBinaryVersion <Name> <BinaryParsedVersion> <Version>


## Example
<p>

* _t4dCheckBinaryVersion clang "$(clang -v 2>&1 | grep clang | cut -d ' ' -f4)" "9.0.0"         

>  Check if clang version is newer than 9.0.0


* _t4dCheckBinaryVersion git "$(git --version 2>&1 | cut -d ' ' -f3)" "2.0.0"                   

>  Check if git version is newer than 2.0.0


</p>



# _t4dCheckOSXApp

## Synopsis
<p>check for OSX app installed</p>



