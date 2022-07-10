#!/bin/sh

cargo install \
    bunyan \        # log formatter
    cargo-audit \
    cargo-cache \
    cargo-edit \
    cargo-expand \
    cargo-outdated \
    cargo-script \
    cargo-tarpaulin \
    cargo-udeps \
    cargo-watch

rustup component add \
    rustfmt \
    clippy
