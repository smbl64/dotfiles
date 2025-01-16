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
        age \
        autorestic \
        awscli \
        bat \
        carapace \
        curl \
        dart \
        eza \
        eza \
        fd \
        fzf \
        git \
        go \
        gup \
        helix \
        helm \
        hexyl \
        hurl \
        just \
        kubernetes-cli \
        mise \
        neovim \
        nmap \
        node \
        ollama \
        pandoc \
        pv \
        rclone \
        restic \
        ripgrep \
        rsync \
        ruff \
        rust-analyzer \
        sass \
        sqlite \
        starship \
        terraform \
        tmux \
        tree-sitter \
        trippy \
        universal-ctags \
        uv \
        vale \
        vault \
        vim \
        watchexec \
        watchexec \
        xh 
} > $LOG_FILE 2>&1
