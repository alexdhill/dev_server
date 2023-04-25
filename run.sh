#!/bin/bash

usage()
{
    echo "dev [options]

Valid options:
-p <port number>
-t <docker tag>"
}

launch_container()
{
    local OPTIND
    local port="8443"
    local tag="latest"

    while getopts ":p:t:" flag
    do
        case "$flag" in
            p) port="$OPTARG" ;;
            t) tag="$OPTARG" ;;
            *) usage; exit(-1) ;;
        esac
    done
    shift $(( OPTIND-1 ))

    echo "Running VSCode ($tag) from $(basename $proj_dir) on port $port"

    local proj_dir="$PWD"
    if [[ -n "$1" ]]
        then
            proj_dir="$1"
    fi

    docker run --rm -dp $port:8443 \
        --name "$(basename "$proj_dir")-vsc" \
        -e PUID="$(id -u)" \
        -e GUID="$(id -g)" \
        -v "$proj_dir":/workspace \
        -e DEFAULT_WORKSPACE=/workspace \
        -v ~/.gitconfig:/config/.gitconfig \
        alexdhill/vscode:devel
}
