#!/bin/bash

function source_if_exists()
{
    if [ -f "$1" ]; then
        source "$1"
    fi
}

function swap()
{
    local TMPFILE=tmp.$$
    mv "$1" $TMPFILE && mv "$2" "$1" && mv $TMPFILE "$2"
}

function background()
{
    "$@" 2>&1 > /dev/null &
}

function cmake-config-release()
{
    cmake -S. -Bbuild "$@"
}

function cmake-config-debug()
{
    cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Debug -DCMAKE_EXPORT_COMPILE_COMMANDS=ON "$@"
}

function cmake-build()
{
    cmake --build build "$@"
}

function cmake-test()
{
    verbose=0
    while getopts v flag
    do
        case  "${flag}" in
            v) verbose=1;;
        esac
    done
    shift $((OPTIND - 1))

    extra_args=()
    (( verbose == 1 )) && extra_args+=('--rerun-failed' '--output-on-failure')

    ctest --test-dir build "${extra_args[@]}" "$@"
}

function cmake-run()
{
    APP=$1;shift
    build/apps/$APP "$@"
}

function format-tmux-window()
{
    IFS=':' read -r INDEX NAME FLAGS <<< "$1"

    PRE='['
    POST=']'

    if [[ $FLAGS =~ 'Z' ]]; then
        PRE="${PRE}[ "
        POST=" ]${POST}"
    else
        PRE="${PRE}  "
        POST="  ${POST}"
    fi

    echo "${PRE}${INDEX}:${NAME}${POST}"
}
