#!/usr/bin/env bash
# vim: set syntax=bash

export PATH=$PWD/.dotfiles:$PATH

accept-xcode-license

setup-homebrew homebrew/Brewfile

./macos/defaults.sh
./iterm2/defaults.sh

if ! { which node >/dev/null 2>&1; }; then
    echo ""
    echo "We can setup Vim because coc.nvim requires Node.js and is not installed."
    echo ""
    echo "Please visit https://nodejs.org/ and download the latest LTS version."
    exit 1
fi

./vim/setup.sh
./composer/setup.sh
./zsh/setup.sh
