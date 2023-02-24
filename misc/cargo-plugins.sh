#!/bin/sh

set -eu

# Cargo plugins and other useful tools that
# can be installed with cargo.
cargo install \
    bacon \
    bunyan \
    cargo-audit \
    cargo-cache \
    cargo-criterion \
    cargo-dist \
    cargo-edit \
    cargo-expand \
    cargo-nextest \
    cargo-outdated \
    cargo-release \
    cargo-script \
    cargo-show-asm \
    cargo-tarpaulin \
    cargo-udeps \
    cargo-update \
    cargo-watch \
    cross \
    flamegraph \
    grcov \
    rtx-cli \
    sccache \
    tree-sitter-cli

rustup component add \
    rustfmt \
    clippy \
    llvm-tools-preview
