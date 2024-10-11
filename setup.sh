#!/usr/bin/env bash

main() {
    local path_align
    if [[ -d /data/data/com.termux/files/usr ]]; then
        path_align="/data/data/com.termux/files/usr/bin"
    elif [[ -d /usr/bin ]]; then
        path_align="/usr/bin"
    else
        echo "Error: Required directory not found."
        exit 1
    fi

    if [[ -d /usr/bin ]]; then
        if [[ $(id -u) -ne 0 ]]; then
            echo "Error: This script must be run as root."
            exit 1
        fi
    fi

    mv bin/phantom "$path_align"
    
    if [[ -f "$path_align/phantom" ]]; then
        chmod +x "$path_align/phantom"
    else
        echo "You can't run this tool like a command line. Please try again."
    fi 
}

main
