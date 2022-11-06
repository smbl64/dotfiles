#!/bin/sh

set -eu

LOG_FILE=crontab-brew-log.txt

# Path to homebrew on Intel and M1 Macs
export PATH="$PATH:/usr/local/bin:/opt/homebrew/bin"

{
    date
    brew update

    echo "-------------------------------"

    # Always try to automatically upgrade these
    brew upgrade \
        bat \
        fd \
        git \
        go \
        helm \
        kubernetes-cli \
        neovim \
        pyenv \
        ripgrep \
        rust-analyzer \
        tmux \
        vim
} > $LOG_FILE 2>&1
