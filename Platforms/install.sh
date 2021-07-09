#!/bin/sh
#### MODULE HEADER BLOC
# Generated From $Tools4Dev_PATH/Templates/function.env
# This documentation will be read and compile for man usage, MarkDown file and shell documentation
# v1.2
#
#   - Name:
#       Install Tools4Dev script
###
#   - Description:
#       This script should be run via curl:
#           sh -c "$(curl -fsSL https://raw.githubusercontent.com/iFeelSmart/Tools4Dev/master/Platforms/install.sh)"; zsh
#
#       As an alternative, you can first download the install script and run it afterwards:
#           https://raw.githubusercontent.com/iFeelSmart/Tools4Dev/master/Platforms/install.sh
#           sh install.sh
#           zsh
#
#       Some variable on this script can be tweaked by setting them when running the script.
#           Tools4Dev_PATH=$HOME/.tools4dev sh install.sh
#           sh -c "Tools4Dev_PATH=$HOME/.tools4dev; $(curl -fsSL https://raw.githubusercontent.com/iFeelSmart/Tools4Dev/master/Platforms/install.sh)"; zsh
#
###
#   - Available Options:
#       * Tools4Dev_PATH            = Set Tools4Dev install path (default is $HOME/.tools4dev/src)
#       * INSTALL_ROOT              = On linux system, also create simlink for root user
#       * CSH                       = Configure zsh to be your default shell
#       * KEEP_ZSHRC                = if true do not install new zshrc file
#       * T4D_REMOTE                = set Tools4Dev Remote URL
#       * T4D_CLONE_ARGS            = transfert args to wks clone
#       * T4D_NATIVE                = set to false if you don't want t4d to be natively loaded
#       * T4D_BRANCH                = set Tools4Dev branch to install
#       * T4D_REPO                  = set Tools4Dev Repo Path
#       * T4D_MANIFEST              = if not empty and valid, will download manifest file and link to it
#       
#
###
#   - Error Code:
#       402
###
#   - Supported Platform:
#       * OSX ( 10.12.6 or higher )
#       * Fedora ( 25 or higher )
###
#   - Author(s):
#       - Quentin NIO
#
###
#### HEADER BLOC ####
############################
set -e

plog="\033[1;36m[LOG] \033[m"
psucceed="\033[1;32m[SUCCEED] \033[m"
pinfo="\033[1;35m[INFO]\033[m"
pskip="\033[1;35m[SKIPPED]\033[m"
perror="\033[1;31m [ERROR]\033[m"
pwarning="\033[1;33m [WARNING]\033[m"

#Testing echo statement to allow color management in output and avoid "-e" at beginning on line
if [[ "$(echo -e toto)" == "toto" ]]; then
    alias echo='echo -e'
fi

_t4dDebugLog(){
    echo "$(printf "%-4s" ' ')$1 ${@:2}"
}

_t4dCheckCommand(){
    local _return=0
    for _command in $(echo $@); do
        if [[ "$(command -v $_command 2> /dev/null)" == "" ]]; then
            _t4dDebugLog $perror "command $_command not found"
            _return=1
        fi
    done
    return $_return
}
############################
_t4dCheckCommand zsh git git-lfs jq chsh curl
if [[ "$(uname -s)" == "Darwin" ]]; then
    _t4dCheckCommand gdate
fi
############################

T4D_REMOTE="${T4D_REMOTE:-"https://github.com/T4D-Suites/"}"
T4D_BRANCH="${T4D_BRANCH:-main}"
T4D_CLONE_ARGS="${T4D_CLONE_ARGS}"
T4D_REPO="${T4D_REPO:-"Tools4Dev.git"}"
T4D_MANIFEST="${T4D_MANIFEST:-"https://raw.githubusercontent.com/T4D-Suites/T4D-Team-Default/main/manifest.xml"}"
T4D_ROOT_PATH="${T4D_ROOT_PATH:-"$HOME/.tools4dev"}"
Tools4Dev_PATH="${T4D_ROOT_PATH}/src"
INSTALL_ROOT="${INSTALL_ROOT:-false}"
T4D_NATIVE="${T4D_NATIVE:-true}"
CSH="${CSH:-true}"
KEEP_ZSHRC="${KEEP_ZSHRC:-false}"
ZSH_PATH="$(command -v zsh || true)"


install_tools4dev(){

    _t4dDebugLog $plog "Tools4Dev Installation"
    mkdir -p $Tools4Dev_PATH
    cd $T4D_ROOT_PATH
    git clone -b ${T4D_BRANCH} "${T4D_REMOTE}${T4D_REPO}" "$(basename $Tools4Dev_PATH)" && _t4dDebugLog $psucceed "Repository Cloned"
    if [[ -e "$HOME/.t4d-$USER-backup.env" ]]; then
        _t4dDebugLog $plog "Restoring t4d-$USER-backup file"
        cp "$HOME/.t4d-$USER-backup.env" "$Tools4Dev_PATH/.$USER.env"
    fi
}

config_shell(){

    _t4dDebugLog $pinfo "Request sudo rights to change default $1 shell -> $ZSH_PATH"
    sudo chsh -s "$ZSH_PATH" $1 && _t4dDebugLog $psucceed "Default shell ( $1 ) -> $ZSH_PATH"

}

config_zshrc(){
    local _prefix
    local _path="${1:-$HOME}"

    if [[ -e "$_path/.zshrc" ]]; then
        _t4dDebugLog $plog "Creating $_path/.zshrc file backup in $T4D_ROOT_PATH/.zshrc_"
        cp -f "$_path/.zshrc" "$T4D_ROOT_PATH/.zshrc_"
    fi

    if [[ "$KEEP_ZSHRC" == "false" ]]; then
        _t4dDebugLog $plog "Zshrc Setup"
        cat "$Tools4Dev_PATH/Templates/zshrc.env" | sed "s|<T4D_ROOT_PATH>|$T4D_ROOT_PATH|g" \
                                                  | sed "s|<T4D_NATIVE>|$T4D_NATIVE|g" \
                                                  | sed "s|<ZSH_PATH>|$ZSH_PATH|g" > "$_path/.zshrc" \
                                                 && _t4dDebugLog $psucceed "$Tools4Dev_PATH/Templates/zshrc.env copied in ${_path}/.zshrc "
    else
        if [[ "$(cat ${_path}/.zshrc | grep '#Tools4Dev')" != "" ]]; then
            _t4dDebugLog $pskip "Tools4Dev setup detected in $_path/.zshrc"
        else
            _t4dDebugLog $plog "Zshrc Setup ( Oh-My-Zsh Compatible )"
            ( cat "$Tools4Dev_PATH/Templates/zshrc.env" | grep -v '^#!' \
                                                        | sed "s|<T4D_ROOT_PATH>|$T4D_ROOT_PATH|g" \
                                                        | sed "s|<T4D_NATIVE>|$T4D_NATIVE|g" \
                                                        | sed "s|<ZSH_PATH>|$ZSH_PATH|g"  >> "${_path}/.zshrc" ) && _t4dDebugLog $psucceed "$Tools4Dev_PATH/Templates/zshrc.env added at the end of $_path/.zshrc"
        fi
    fi
}

config_root(){
    _t4dDebugLog $plog "Configuring Tools4Dev for root user, it will require sudo rights. Press enter to continue" && read
    local _simLink="/root/.tools4dev"

    if [[ -d "/root" ]]; then
        config_shell root
        _t4dDebugLog $pinfo "Request sudo rights to create simlink $_simLink -> $T4D_ROOT_PATH, press enter to continue" && read
        sudo ln -sfn $T4D_ROOT_PATH $_simLink && _t4dDebugLog $psucceed "$_simLink -> $T4D_ROOT_PATH"
        if [[ ! -e "/root/.zshrc" ]]; then
             _t4dDebugLog $pinfo "Request sudo rights to install .zshrc for root user, press enter to continue" && read
            sudo cat "$Tools4Dev_PATH/Templates/zshrc.env"  | sed "s|<T4D_ROOT_PATH>|/root/.tools4dev|g" \
                                                            | sed "s|<T4D_NATIVE>|$T4D_NATIVE|g" \
                                                            | sed "s|<ZSH_PATH>|$ZSH_PATH|g" | sudo tee "/root/.zshrc" > /dev/null \
                                                            && _t4dDebugLog $psucceed "$Tools4Dev_PATH/Templates/zshrc.env copied in /root/.zshrc "
        fi
    else
        _t4dDebugLog $pskip "/root does not exist"
    fi
}

wks_clone(){
    if [[ "$T4D_MANIFEST" != "" ]]; then
        if [[ -e "$T4D_MANIFEST" ]]; then
            _t4dDebugLog $plog "Using $T4D_MANIFEST as manifest.xml"
            cp -f "$T4D_MANIFEST" "$Tools4Dev_PATH/manifest.xml"
        elif [[ "$(echo $T4D_MANIFEST | grep '^http')" != "" ]]; then
            _t4dDebugLog $plog "Downloading $T4D_MANIFEST as manifest.xml"
            curl -fsSl "$T4D_MANIFEST" > "$Tools4Dev_PATH/manifest.xml"
        else
            _t4dDebugLog $pwarning "Unknown type of manifest.xml file - $T4D_MANIFEST -"
        fi
        cd $Tools4Dev_PATH
        zsh -c "$Tools4Dev_PATH/t4d wks clone $(echo $T4D_CLONE_ARGS)"
    fi
}

logo(){

    echo "\033[1;32m            _____            _     _  _     ___           \033[m"
    echo "\033[1;32m           /__   \___   ___ | |___| || |   /   \_____   __\033[m"
    echo "\033[1;32m             / /\/ _ \ / _ \| / __| || |_ / /\ / _ \ \ / /\033[m"
    echo "\033[1;32m            / / | (_) | (_) | \__ \__   _/ /_//  __/\ V / \033[m"
    echo "\033[1;32m            \/   \___/ \___/|_|___/  |_|/___ / \___| \_/  \033[m"
    echo ""

}

main(){
    logo

    if [[ ! -d "$T4D_ROOT_PATH" ]]; then
        install_tools4dev
    else
        _t4dDebugLog $pskip "Folder $T4D_ROOT_PATH already exist"
        return 1
    fi
    
    if [[ "$KEEP_ZSHRC"   == "false" ]]; then    config_zshrc $HOME; fi
    if [[ "$CSH"          == "true"  ]]; then    config_shell $USER; fi
    if [[ "$INSTALL_ROOT" == "true"  ]]; then    config_root; fi

    wks_clone
}

main "$@"
