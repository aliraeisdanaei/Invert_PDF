#!/bin/bash

function invert(){
    output=$2
    if [[ $1 -eq $2 ]]
    then
        output=inv_$2
    fi
    echo "Inverting '$1' to '$output' ---------------------------------------------"

    gs -o $output    \
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
    output=$1_inv
    if [[ $# -gt 1 ]]
    then
        output=$2
    fi
    invert $1 $ouput
fi
