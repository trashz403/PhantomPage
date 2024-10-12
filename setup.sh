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

check_wget() {
    if ! command -v wget &> /dev/null; then
        echo -e "${white} [${red}+${white}]${red} Error: wget is not installed. Please install wget manually and try again.${reset}"
        exit 1
    fi
}

install_dependencies() {
    echo -e "${white} [${green}+${white}]${green} Installing dependencies...${reset}"
    
    if ! command -v pip &> /dev/null; then
        echo -e "${white} [${red}+${white}]${red} Error: pip is not installed. Please install pip first.${reset}"
        exit 1
    fi

    pip install mirrormate
    if [[ $? -eq 0 ]]; then
        echo -e "${white} [${green}+${white}]${green} mirrormate installed successfully!${reset}"
    else
        echo -e "${white} [${red}+${white}]${red} Error: Failed to install mirrormate.${reset}"
        exit 1
    fi

    pip install validlink
    if [[ $? -eq 0 ]]; then
        echo -e "${white} [${green}+${white}]${green} validlink installed successfully!${reset}"
    else
        echo -e "${white} [${red}+${white}]${red} Error: Failed to install validlink.${reset}"
        exit 1
    fi
}

main() {
    local path_align
    banner

    check_wget

    if [[ -d /data/data/com.termux/files/usr ]]; then
        path_align="/data/data/com.termux/files/usr/bin"
    elif [[ -d /usr/bin ]]; then
        path_align="/usr/bin"
    else
        echo -e "${white} [${red}+${white}]${red} Error: Required directory not found.${reset}"
        exit 1
    fi

    if [[ -d /usr/bin ]] && [[ $(id -u) -ne 0 ]]; then
        echo -e "${white} [${red}+${white}]${red} Error: This script must be run as root.${reset}"
        exit 1
    fi

    mv bin/phantom "$path_align"
    
    if [[ -f "$path_align/phantom" ]]; then
        chmod +x "$path_align/phantom"
        install_dependencies
        sleep 3
        clear
        banner
    else
        echo -e "${white} [${red}+${white}]${red} You can't run this tool like a command line. Please try again.${reset}"
        exit 1
    fi 
}

main
