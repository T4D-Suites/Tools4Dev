 [<<< Back To Readme](../../../../README.md)
 <p align="center">
     <img src="https://github.com/T4D-Suites/T4D-Ressources/blob/master/LogoT4D.png">
 </p>

 **Welcome to Tools4Dev !**

 Tools4Dev is a Command Line Tools that will help you to dynamicaly define 
 a custom development process and deploy it all among your team. 



## Name
<p>MacOS</p>


## Dependencies
```
brew install git-lfs zsh jq coreutils
git-lfs install
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


## Zsh insecure folders
you might have an error during loading that tells you 
```
zsh compinit: insecure directories, run compaudit for list.
```
This can be fixed by using following command
```
compaudit | xargs chmod g-w
```


## Clone Deps
```
wks clone
```


## Documentation
```
t4dDoc
``** 

