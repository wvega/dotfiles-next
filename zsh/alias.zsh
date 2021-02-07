#!/usr/bin/env zsh

wp-save() {
    wp db export $(dirname $(wp config path))/snapshots/$1.sql
}

wp-load() {
    wp db import $(dirname $(wp config path))/snapshots/$1.sql
}

wp-snapshots() {
    ls $(dirname $(wp config path))/snapshots
}

# Execute binaries from Composer's vendor directory.
function vendor() {
    vendor/bin/$1 "${@:2}"
}
