" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
    Plugin      'bfontaine/Brewfile.vim'
    Plugin      'VundleVim/Vundle.vim'
    Plugin 'dense-analysis/ale'
    " 2019-02-20 - Temporarily use fork of base16-vim which fixes an issue with
    " Vim 8.1.0887 and newer. When a change is landed, then revert back to
    " canonical repo.
    "
    " Issue https://github.com/chriskempson/base16-vim/issues/197
    " Pull Request https://github.com/chriskempson/base16-vim/pull/198
    Plugin   'chriskempson/base16-vim'
    Plugin       'neoclide/coc.nvim'                " :call coc#util#install() after installing
    Plugin       'ctrlpvim/ctrlp.vim'
    Plugin      'tacahiroy/ctrlp-funky'
    Plugin           'dyng/ctrlsf.vim'
    Plugin   'editorconfig/editorconfig-vim'
    " Plugin       'Yggdroot/indentLine'
    " Plugin                'matchit.zip'
    " Plugin      'NLKNguyen/papercolor-theme'
    Plugin   'StanAngeloff/php.vim'
    " Plugin       'phpactor/phpactor' " Run composer install --no-dev -o on ~/.vim/bundle/phpactor
    " Plugin       'ervandew/supertab'
    " Plugin  'vim-syntastic/syntastic'

    " See transcript from http://vimcasts.org/episodes/aligning-text-with-tabular-vim/
    Plugin      'godlygeek/tabular'                 " must be included before plasticboy/vim-markdown
    Plugin         'tomtom/tcomment_vim'
    Plugin         'SirVer/ultisnips'
    Plugin         'joonty/vdebug'
    Plugin         'kchmck/vim-coffee-script'
    Plugin          'tpope/vim-fugitive'            " Git wrapper for Vim.
    Plugin       'airblade/vim-gitgutter'
    Plugin        'thaerkh/vim-indentguides'
    Plugin       'pangloss/vim-javascript'
    Plugin            'mxw/vim-jsx'
    Plugin          'mtdl9/vim-log-highlighting'
    " Plugin     'plasticboy/vim-markdown'
    Plugin        'amadeus/vim-mjml'
    Plugin       'pbrisbin/vim-mkdir'
    Plugin          'tpope/vim-rhubarb'
    Plugin        'jremmen/vim-ripgrep'
    Plugin       'justinmk/vim-sneak'
    " Plugin          'mrk21/yaml-vim'

    " Causes all trailing  whitespace characters to be highlighted.
    " Slows down Vim significantly probably related to https://github.com/vim/vim/issues/2584
    " Plugin       'ntpeters/vim-better-whitespace' 

    " Plugin     'shawncplus/phpcomplete.vim'
    " Plugin       'junegunn/seoul256.vim'
    " Plugin          'dim13/smyck.vim'
    " Plugin     'nightsense/snow'
    " Plugin    'vim-airline/vim-airline'
    " Plugin    'vim-airline/vim-airline-themes'
    " Plugin          'tpope/vim-rhubarb' " GitHub extensions for fugitive.vim.
    " Plugin 'ludovicchabant/vim-gutentags'
    " Plugin           'elzr/vim-json'
    " Plugin     'groenewege/vim-less'
    " Plugin           'rakr/vim-one'
    " Plugin          'mhinz/vim-signify'
    " Plugin  'HenryNewcomer/vim-theme-papaya'
call vundle#end()

filetype plugin indent on
