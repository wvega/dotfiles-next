#!/bin/bash
# vim: set syntax=bash

export PATH=$PWD/.dotfiles:$PATH

accept-xcode-license

setup-homebrew homebrew/Brewfile

source macos/defaults.sh
source iterm2/defaults.sh
