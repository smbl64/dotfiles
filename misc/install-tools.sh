#!/bin/bash

set -eux

# Tools that need to be installed via Homebrew
brew install \
    aria2 \
    automake \
    autorestic \
    awk \
    awscli \
    bash \
    bash-completion@2 \
    bat \
    cmake \
    colima \
    coreutils \
    curl \
    deno \
    direnv \
    docker \
    docker-buildx \
    docker-completion \
    docker-compose \
    doctl \
    eza \
    fd \
    fx \
    fzf \
    gh \
    git \
    go \
    hashicorp/tap/terraform \
    helm \
    htop \
    hugo \
    hyperfine \
    iperf \
    iperf3 \
    jq \
    just \
    kubernetes-cli \
    luarocks \
    m-cli \
    massren \
    media-info \
    mise \
    moreutils \
    mplayer \
    mtr \
    neovim \
    ollama \
    pandoc \
    poppler \
    pv \
    rclone \
    restic \
    ripgrep \
    rust-analyzer \
    scc \
    shellcheck \
    shfmt \
    sqlite \
    starship \
    tinygo-org/tools/tinygo \
    tmux \
    tree \
    tree-sitter \
    universal-ctags \
    vim \
    watch \
    watchexec \
    wget \
    wrk \
    yarn \
    yq

# Tools that need to be installed via "go install"
go install github.com/nao1215/gup@latest
go install github.com/natesales/q@latest

# Tools that need to be installed via "cargo install"
cargo install --locked \
  flamegraph \
  humble-cli \
  trippy # A network diagnostics tool


# Others
curl -fsSL https://bun.sh/install | bash
