#!/usr/bin/env bash
# vim: set syntax=bash

set -euo pipefail

directory=$(dirname "$(realpath "$0")")
root=$(dirname "${directory}")

# Link with the helper from this checkout. Same approach as the root setup.sh.
export PATH="${root}/.dotfiles:${PATH}"

case "$(uname -s)" in
    Darwin) os=macos ;;
    Linux)  os=linux ;;
    *)      os=none ;;
esac

mkdir -p "${HOME}/.ssh/config.d"

# The user's SSH config is machine-local. Add the Include block once.
config="${HOME}/.ssh/config"

touch "${config}"

if ! grep -qxF '# BEGIN dotfiles' "${config}"; then
    if [[ -s "${config}" ]]; then
        printf '\n' >> "${config}"
    fi

    printf '# BEGIN dotfiles\nInclude config.d/*.config\n# END dotfiles\n' >> "${config}"
fi

shopt -s nullglob

# Shared configuration files first, then the files for this OS.
for file in "${directory}"/config.d/*.config "${directory}/${os}"/config.d/*.config; do
    symlink "${file}" "${HOME}/.ssh/config.d/$(basename "$file")"
done

# Private configuration files
for file in "${root}"/private/ssh/config.d/*.config; do
    symlink "${file}" "${HOME}/.ssh/config.d/$(basename "$file")"
done

# Remove links whose target no longer exists, for example after a rename.
for link in "${HOME}/.ssh/config.d"/*; do
    if [[ -L "${link}" && ! -e "${link}" ]]; then
        echo "Removing stale link ${link}"
        rm -f "${link}"
    fi
done
