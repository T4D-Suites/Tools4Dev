 [<<< Back To Readme](../../../../README.md)
<p align="center">
<img src="https://github.com/T4D-Suites/T4D-Ressources/blob/master/LogoT4D.png">
</p>

## Name
<p>Install Tools4Dev script</p>


## Recommandations

Tools4Dev is fully customizable by user and we try to made our code as readable as we can.
You can install Tools4Dev manually or use this method described bellow.
You might have to install dependencies depending on your system.
We recommand you to read at least manual install process without executing it before launching this script to be fully aware on what we will do on your terminal configuration.

   * [Alpine](Alpine.md)
   * [Fedora](Fedora.md)
   * [Linux](Linux.md)
   * [MacOS](MacOS.md)

## Description

This script should be run via curl:
```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/iFeelSmart/Tools4Dev/master/Platforms/install.sh)"; zsh
```


As an alternative, you can first download the install script and run it afterwards:
```
https://raw.githubusercontent.com/iFeelSmart/Tools4Dev/master/Platforms/install.sh
sh install.sh
zsh
```

Some variable on this script can be tweaked by setting them when running the script.
Tools4Dev_PATH=$HOME/.tools4dev sh install.sh
```
sh -c "Tools4Dev_PATH=$HOME/.tools4dev; $(curl -fsSL https://raw.githubusercontent.com/iFeelSmart/Tools4Dev/master/Platforms/install.sh)"; zsh
```


## Available Options
* Tools4Dev_PATH            = Set Tools4Dev install path (default is $HOME/.tools4dev/src)
* INSTALL_ROOT              = On linux system, also create simlink for root user
* CSH                       = Configure zsh to be your default shell
* KEEP_ZSHRC                = if true do not install new zshrc file
* T4D_REMOTE                = set Tools4Dev Remote URL
* T4D_BRANCH                = set Tools4Dev branch to install
* T4D_REPO                  = set Tools4Dev Repo Path
* T4D_MANIFEST              = if not empty and valid, will download manifest file and link to it

