#!/bin/sh

set -eu

cargo install \
    bacon \
    bunyan \
    cargo-audit \
    cargo-cache \
    cargo-edit \
    cargo-expand \
    cargo-nextest \
    cargo-outdated \
    cargo-script \
    cargo-tarpaulin \
    cargo-udeps \
    cargo-update \
    cargo-watch \
    cross \
    grcov

rustup component add \
    rustfmt \
    clippy \
    llvm-tools-preview
