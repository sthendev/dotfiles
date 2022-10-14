#!/bin/bash

function echoerr { echo $@ 1>&2; }

function get-patch {
    if [ -d patches ]; then
        wget -P patches $@
    else
        echoerr "missing directory: patches"
        return 1
    fi
}
