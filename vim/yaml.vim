" https://lornajane.net/posts/2018/vim-settings-for-working-with-yaml

au! BufNewFile,BufReadPost *.{yaml,yml} set filetype=yaml syntax=on
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
