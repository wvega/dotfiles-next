#!/usr/bin/env bash
# vim: set syntax=bash

export PATH=$PWD/.dotfiles:$PATH

accept-xcode-license

setup-homebrew homebrew/Brewfile

./macos/defaults.sh
./iterm2/defaults.sh
./vim/setup.sh
