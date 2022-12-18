if [ -z $1 ]; then
    echo "No domain is specified"
    exit 1
fi

dig +noall +answer "$1" ANY
