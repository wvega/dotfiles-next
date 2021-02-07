#!/usr/bin/env bash
# vim: set syntax=bash

directory=$(dirname $(realpath $0))

mkdir -p "${HOME}/.myzsh"

# symlink auxiliary configuration files
for file in "${directory}"/*.zsh; do
    symlink "${file}" "${HOME}/.myzsh/$(basename $file)"
done

symlink "${directory}/zshrc" "${HOME}/.zshrc"
