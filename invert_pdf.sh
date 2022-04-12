#!/usr/bin/env bash

function invert(){
    output=$2
    if [[ $1 == $2 ]]
    then
        directory=$(dirname "$1")
        fullname=$(basename -- "$1")
        extension="${fullname#*.}"
        filename="${fullname%%.*}"

        output=$directory\/$filename\_inv.$extension
        # echo 'extension' $extension
        # echo 'filename' $filename
        # echo 'directory' $directory
        # echo $output
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
    if [[ $# -gt 1 ]]
    then
        invert $1 $2
    else
        invert $1 $1
    fi
fi
