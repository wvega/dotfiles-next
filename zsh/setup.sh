#!/usr/bin/env bash
# vim: set syntax=bash

directory=$(dirname $(realpath $0))

mkdir -p "${HOME}/.myzsh"

# symlink auxiliary configuration files
for file in "${directory}"/*.zsh; do
    symlink "${file}" "${HOME}/.myzsh/$(basename $file)"
done

symlink "${directory}/zshrc" "${HOME}/.zshrc"

# Set appropriate permissions for directories that contain completion functions.
# zsh's compinit refuses to load completions from group- or world-writable
# directories, so make sure the completion directories are owner-writable only.
#
# This matters on macOS, where Homebrew installs the zsh completion directories
# user-writable (and sometimes group-writable). On Linux those directories are
# system-owned and already secure, so we skip anything the current user doesn't own.
if command -v brew >/dev/null 2>&1; then
    zsh_share="$(brew --prefix)/share/zsh"
elif [[ -d /usr/share/zsh ]]; then
    zsh_share="/usr/share/zsh"
fi

if [[ -n "${zsh_share}" && -d "${zsh_share}" && -O "${zsh_share}" ]]; then
    chmod -R 755 "${zsh_share}"
    [[ -d "${zsh_share}/site-functions" ]] && chmod -R 755 "${zsh_share}/site-functions"
fi
