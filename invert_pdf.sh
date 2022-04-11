#!/bin/bash

function invert(){
    echo "Inverting '$1' to '$2' ---------------------------------------------"

    gs -o $2    \
       -sDEVICE=pdfwrite  \
       -c "{1 exch sub}{1 exch sub}{1 exch sub}{1 exch sub} setcolortransfer" \
       -f $1

}

if [[ $# -eq 0 ]]
then
    echo "I need to receive an input file"
    exit 1
fi

if [[ -d $1 ]]
then
    echo "Directory given"
    for file in $1*.pdf
    do
        invert $file $file
    done
else
    output=$1
    if [[ $# -gt 1 ]]
    then
        output=$2
    fi
    invert $1 $ouput
fi
