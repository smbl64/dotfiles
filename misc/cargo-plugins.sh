#!/bin/sh

cargo install \
    cargo-audit \
    cargo-cache \
    cargo-edit \
    cargo-expand \
    cargo-script \
    cargo-tarpaulin \
    cargo-udeps \
    cargo-watch

rustup component add \
    rustfmt \
    clippy
