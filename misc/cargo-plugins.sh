#!/bin/sh

set -eu

cargo install \
    bacon \
    bunyan \
    cargo-audit \
    cargo-cache \
    cargo-edit \
    cargo-expand \
    cargo-outdated \
    cargo-script \
    cargo-tarpaulin \
    cargo-udeps \
    cargo-watch \
    cross \
    grcov

rustup component add \
    rustfmt \
    clippy \
    llvm-tools-preview
