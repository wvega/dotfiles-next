#!/usr/bin/env bash
# vim: set syntax=bash

directory=$(dirname $(realpath $0))

mkdir -p "${HOME}/.git.d"

# symlink public configuration files
for file in "$(dirname $directory)"/git/git.d/*.gitconfig; do
    symlink "${file}" "${HOME}/.git.d/$(basename $file)"
done

# symlink private configuration files
for file in "$(dirname $directory)"/private/git/git.d/*.gitconfig; do
    symlink "${file}" "${HOME}/.git.d/$(basename $file)"
done

symlink "${directory}/gitconfig" "${HOME}/.gitconfig"
symlink "${directory}/gitignore" "${HOME}/.gitignore"
