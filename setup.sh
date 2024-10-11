#!/usr/bin/env bash

banner() {
    green="\033[92m"
    red="\033[91m"
    white="\033[97m"
    reset="\033[0m"
    cyan="\033[36m"

    echo -e "${white} +-----------------------------------------------------------------+"
    echo -e "${white} |${green} ██████╗ ██╗  ██╗ █████╗ ███╗   ██╗████████╗ ██████╗ ███╗   ███╗${white} |"
    echo -e "${white} |${green} ██╔══██╗██║  ██║██╔══██╗████╗  ██║╚══██╔══╝██╔═══██╗████╗ ████║${white} |"
    echo -e "${white} |${green} ██████╔╝███████║███████║██╔██╗ ██║   ██║   ██║   ██║██╔████╔██║${white} |"
    echo -e "${white} |${green} ██╔═══╝ ██╔══██║██╔══██║██║╚██╗██║   ██║   ██║   ██║██║╚██╔╝██║${white} |"
    echo -e "${white} |${green} ██║     ██║  ██║██║  ██║██║ ╚████║   ██║   ╚██████╔╝██║ ╚═╝ ██║${white} |"
    echo -e "${white} |${green} ╚═╝     ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝   ╚═╝    ╚═════╝ ╚═╝     ╚═╝${white} |"
    echo -e "${white} +-----------------------------------------------------------------+"
    echo -e "${white} |${green}PHANTOM TOOL - A simple tool to clone websites and download files${white}|"
    echo -e "${white} +-----------------------------------------------------------------+"
}

main() {
    local path_align
    banner

    if [[ -d /data/data/com.termux/files/usr ]]; then
        path_align="/data/data/com.termux/files/usr/bin"
    elif [[ -d /usr/bin ]]; then
        path_align="/usr/bin"
    else
        echo "${white} [${red}+${white}]${red}Error : Required directory not found."
        exit 1
    fi

    if [[ -d /usr/bin ]]; then
        if [[ $(id -u) -ne 0 ]]; then
            echo -e "${white} [${red}+${white}]${red} Error : This script must be run as root."
            exit 1
        fi
    fi

    mv bin/phantom "$path_align"
    
    if [[ -f "$path_align/phantom" ]]; then
        chmod +x "$path_align/phantom"
        pip install mirrormate

        if [[ $? -eq 0 ]]; then
            echo -e "${white} [${green}+${white}]${green} mirrormate installed successfully!${reset}"
        else
            echo -e "${white} [${red}+${white}]${red} Error : Failed to install mirrormate.${reset}"
            exit 1
        fi
        sleep 3
        clear
        banner
    else
        echo "${white} [${red}+${white}]${red}You can't run this tool like a command line. Please try again."
    fi 
}

main
