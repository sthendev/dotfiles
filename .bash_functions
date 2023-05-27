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
