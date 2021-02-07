#!/usr/bin/env bash
# vim: set syntax=bash

if ! { which composer >/dev/null 2>&1; }; then
    echo "Installing Composer 1"
    curl -sS https://getcomposer.org/installer | php -- --1 --install-dir=/usr/local/bin --filename=composer
fi
