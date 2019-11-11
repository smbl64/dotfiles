#!/bin/bash

if [[ ! $(brew bundle check) ]]; then
  echo "Restoring homebrew packages from backup"
  brew bundle install
fi
