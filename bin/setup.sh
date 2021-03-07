#!/usr/bin/env bash
# vim: set syntax=bash

directory=$(dirname $(realpath $0))

mkdir -p "${HOME}/bin"

# install WP-CLI
if [[ ! -f /usr/local/bin/wp ]]; then
    echo "Installing WP-CLI"
    curl --output /usr/local/bin/wp https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
    chmod +x /usr/local/bin/wp
fi

# install wpv
if [[ ! -f "${HOME}/bin/wpv" ]]; then
    echo "Installing wpv"
    curl --output "${HOME}/bin/wpv" https://raw.githubusercontent.com/smilingrobots/wpv/master/wpv.sh
    chmod u+x "${HOME}/bin/wpv"
fi

symlink "$(which symlink)" "${HOME}/bin/symlink"

symlink "${directory}/bin/php-cs-fixer-safe" "${HOME}/bin/php-cs-fixer-safe"
