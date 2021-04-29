" Taken from https://github.com/stevenbarragan/dotfiles/commit/956c0ed4df7741e51dc9e45835373af392992aea#diff-5b9090f966f7d307f3ea913cd151ad36
if executable('rg')
    let g:ctrlp_user_command = 'rg --files --smart-case --hidden --follow %s'
    let g:ctrlp_use_caching = 0
endif

let g:ctrlp_root_markers = ['.git', '.vim', '.ctrlp']
let g:ctrlp_by_filename = 1
let g:ctrlp_show_hidden = 1
let g:ctrlp_open_multiple_files = '2vjr'
let g:ctrlp_lazy_update = 200
let g:ctrlp_match_window = 'max:20,results:20'

let g:ctrlp_funky_matchtype = 'path'
let g:ctrlp_funky_syntax_highlight = 1
