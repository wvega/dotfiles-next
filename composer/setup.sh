#!/usr/bin/env bash
# vim: set syntax=bash

directory=$(dirname $(realpath $0))

if ! { which composer >/dev/null 2>&1; }; then
    echo "Installing Composer 1"
    curl -sS https://getcomposer.org/installer | php -- --1 --install-dir=/usr/local/bin --filename=composer
fi

symlink "${directory}/composer.json" "${HOME}/.composer/composer.json"
symlink "${directory}/composer.lock" "${HOME}/.composer/composer.lock"

if [[ "0" == $(php -r "echo version_compare(PHP_VERSION, '8', '>=') ? 0 : 1;") ]]; then
    echo "Setting PHP 7.4 as the default version"
    brew unlink php
    brew link php@7.4
fi
