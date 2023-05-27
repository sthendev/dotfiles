#!/bin/bash

function swap()
{
    local TMPFILE=tmp.$$
    mv "$1" $TMPFILE && mv "$2" "$1" && mv $TMPFILE "$2"
}

function background()
{
    "$@" 2>&1 > /dev/null &
}
