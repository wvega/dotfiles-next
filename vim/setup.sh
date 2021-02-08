#!/usr/bin/env bash
# vim: set syntax=bash

directory=$(dirname $(realpath $0))

if [[ ! -f "$directory/vimrc" ]]; then
    echo "The Vim setup script couldn't find the vimrc file in ${directory}."
    return 1 2>/dev/null || exit 1
fi

# create required directories
mkdir -p $HOME/.vim/bundle

# install Vundle
if [[ ! -d "$HOME/.vim/bundle/Vundle.vim" ]]; then
    echo "Installing Vundle plugin"
    git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
fi

# symlink auxiliary configuration files
for file in "${directory}"/*.vim; do
    symlink "${file}" "${HOME}/.vim/$(basename $file)"
done

# symlink snippets directory
symlink "${directory}/UltiSnips" $HOME/.vim/UltiSnips
symlink "${directory}/coc-settings.json" "${HOME}/.vim/coc-settings.json"

symlink "${directory}/vimrc" $HOME/.vim/vimrc
symlink "${directory}/gvimrc" $HOME/.vim/gvimrc
