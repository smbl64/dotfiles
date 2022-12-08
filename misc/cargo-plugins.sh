#!/bin/sh

set -eu

cargo install \
    bacon \
    bunyan \
    cargo-audit \
    cargo-cache \
    cargo-criterion \
    cargo-edit \
    cargo-expand \
    cargo-nextest \
    cargo-outdated \
    cargo-script \
    cargo-show-asm \
    cargo-tarpaulin \
    cargo-udeps \
    cargo-update \
    cargo-watch \
    cross \
    flamegraph \
    grcov

rustup component add \
    rustfmt \
    clippy \
    llvm-tools-preview
