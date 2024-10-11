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
    if [[ $(id -u) -ne 0 ]]; then
        echo "Error : This script must be run as root."
        exit 1
    fi 
}

main
