let g:coc_global_extensions = [
    \ 'coc-json',
    \ 'coc-phpls',
    \ 'coc-ultisnips',
\]

" the following was initially copied from https://github.com/neoclide/coc.nvim#example-vim-configuration

set hidden

set nobackup      " some servers have issues with backup files
set nowritebackup

" set cmdheight=2   " more space for displaying messages

set signcolumn=yes " always show the signcolumn to prevent the text from
                   " shifting each time diagnostics appear/become resolved

" use TAB to trigger completion with characters ahead and navigate.
inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>" : <SID>check_back_space() ? "\<TAB>" : coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" returns true if the cursor is on the first column or the previous character
" is a whitespace character or \
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" use <c-space> to trigger completion
inoremap <silent><expr> <C-Space> coc#refresh()

" make <CR> auto-select the first completion item and notify coc.vim to format on enter
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" use `[g` and `]g` to navigate diagnostics
" use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" go to code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Show commands.
nnoremap <silent><nowait> <leader>c  :<C-u>CocList commands<cr>
" Show all diagnostics.
nnoremap <silent><nowait> <leader>a  :<C-u>CocList diagnostics<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <D-r> :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <D-R> :<C-u>CocList -I symbols<cr>
