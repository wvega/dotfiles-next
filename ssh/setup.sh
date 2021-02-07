#!/usr/bin/env bash
# vim: set syntax=bash

directory=$(dirname $(realpath $0))

mkdir -p "${HOME}/.ssh/config.d"

# # symlink public configuration files
# for file in "${directory}"/config.d/*.config; do
#     symlink "${file}" "${HOME}/.ssh/config.d/$(basename $file)"
# done

# symlink private configuration files
for file in "$(dirname $directory)"/private/ssh/config.d/*.config; do
    symlink "${file}" "${HOME}/.ssh/config.d/$(basename $file)"
done

symlink "${directory}/config" "${HOME}/.ssh/config"
