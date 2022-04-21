#!/bin/sh

cargo install \
    cargo-tarpaulin \
    cargo-edit \
    cargo-expand \
    cargo-watch \
    cargo-audit \
    cargo-udeps \
    cargo-cache

rustup component add \
    rustfmt \
    clippy
