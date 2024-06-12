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
        autorestic \
        bat \
        curl \
        fd \
        fzf \
        git \
        go \
        helm \
        just \
        kubernetes-cli \
        mise \
        neovim \
        rclone \
        restic \
        ripgrep \
        rust-analyzer \
        sqlite \
        tmux \
        universal-ctags \
        vim
} > $LOG_FILE 2>&1
