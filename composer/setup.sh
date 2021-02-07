#!/usr/bin/env bash
# vim: set syntax=bash

directory=$(dirname $(realpath $0))

if ! { which composer >/dev/null 2>&1; }; then
    echo "Installing Composer 1"
    curl -sS https://getcomposer.org/installer | php -- --1 --install-dir=/usr/local/bin --filename=composer
fi

symlink "${directory}/composer.json" "${HOME}/.composer/composer.json"
symlink "${directory}/composer.lock" "${HOME}/.composer/composer.lock"
