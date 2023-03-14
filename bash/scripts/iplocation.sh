#!/bin/bash
set -eu

function print_usage() {
    echo ""
    echo "Usage:"
    echo "   $(basename $0) <domain or IP>"
}

if [[ "$#" -ne 1 ]]; then
    print_usage
    exit 1
fi

# Is it an IP or a domain?
if [[ "$1" =~ ^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$ ]]; then
    curl -s "https://ipinfo.io/$1" | jq
else 
    # Use dig to get IP addresses
    dig +short "$1" | xargs -I X curl -s https://ipinfo.io/X | jq
fi

