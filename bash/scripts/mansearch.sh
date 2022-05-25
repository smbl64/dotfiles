#!/bin/sh

if [[ $# -eq 0 ]]; then
    script_name=`basename "$0"`
    echo "USAGE:"
    echo "    $script_name COMMAND-NAME OPTION-TO-SEARCH"
    echo
    echo "Search in the man pages for a certain option. This will look for the exact match."
    echo 
    echo "EXAMPLE:"
    echo "   $script_name curl --data"
    exit 1
fi

set -eu

man "$1"| col -b | rg -A 8 "^\s+$2"
