#!/usr/bin/env bash

#
# Source: https://gist.github.com/cweagans/2f78c906d081532efbc9606009545e0f
#

# Get the name of the command that we're running and shift it off of the args list.
cmd=$1
shift 1

# Make sure we have a place to store the data.
[ -d "/tmp/cache_store" ] || mkdir /tmp/cache_store
[ -d "/tmp/cache_store/${cmd}" ] || mkdir /tmp/cache_store/${cmd}

# Delete cache files older than 3 hours.
find /tmp/cache_store -mindepth 1 -mmin +180 -delete

# Generate a cache filename.
filename=$(echo -n "$cmd $@" | shasum | awk '{print $1}')

# If the file doesn't exist, run the requested command to generate a new cache entry.
if [ ! -f "/tmp/cache_store/${cmd}/${filename}" ] || [ "$CACHE_FORCE_EXEC" == "true" ]; then
    eval "${cmd} $@" > /tmp/cache_store/${cmd}/${filename}

    # If the command wasn't successful, delete the cache entry and exit with the
    # same exit code.
    exitcode="$?"
    if [ "$exitcode" != 0 ]; then
        rm /tmp/cache_store/${cmd}/${filename}
        exit $exitcode
    fi
fi

# Either way, the contents of the cache file are now valid.
cat /tmp/cache_store/${cmd}/${filename}
