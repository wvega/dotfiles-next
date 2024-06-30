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

gcm() {
    git c -m $@
}

gp() {
    git pure
}

gs() {
    git status $@
}

lf() {
    branch=$(git rev-parse --abbrev-ref HEAD)
    git checkout $(git symbolic-ref refs/remotes/origin/HEAD | sed 's@^refs/remotes/origin/@@')
    git branch -d "${branch}"
}

#
# LS
#
l() {
    exa $@
}

#
# MacVim
#

e() {
    mvim $@
}

#
# PHP
#
phpv() {
    $(brew --cellar php@$1)/$(brew list --versions php@$1 | tr ' ' '\n' | sort -h | tail -1)/bin/php "${@:2}"
}

php7.3() {
    phpv 7.3 "$@"
}

composer7.3() {
    php7.3 /usr/local/bin/composer "$@"
}

php7.4() {
    phpv 7.4 "$@"
}

composer7.4() {
    php7.4 /usr/local/bin/composer "$@"
}

php8.0() {
    phpv 8.0 "$@"
}

composer8.0() {
    php8.0 /usr/local/bin/composer "$@"
}

php8.1() {
    phpv 8.1 "$@"
}

composer8.1() {
    php8.1 /usr/local/bin/composer "$@"
}

php8.2() {
    phpv 8.2 "$@"
}

composer8.2() {
    php8.2 /usr/local/bin/composer "$@"
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
