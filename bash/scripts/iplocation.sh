#!/bin/bash
set -eu

if [ "$#" -ne 1 ]; then
    echo "No domain is specified"
    exit 1
fi

dig +short "$1" | xargs -I X curl -s https://ipinfo.io/X | jq
