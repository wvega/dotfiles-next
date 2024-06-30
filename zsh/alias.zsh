#!/usr/bin/env zsh

#
# Git
#

gb() {
    # get the last argument on the list
    eval last=\${$#}

    branch=$(echo "${last}" | awk '{print tolower($0)}')

    git checkout -b ${branch}
    git commit --allow-empty -m "${branch}"
}

gc() {
    git commit $@
}

gca() {
    git commit --amend $@
}

#
# WP-CLI
#

wp-save() {
    wp db export $(dirname $(wp config path))/snapshots/$1.sql
}

wp-load() {
    wp db import $(dirname $(wp config path))/snapshots/$1.sql
}

wp-snapshots() {
    ls -G $(dirname $(wp config path))/snapshots
}

#
# Composer
#

# Execute binaries from Composer's vendor directory.
function vendor() {
    vendor/bin/$1 "${@:2}"
}
