" relative path  (src/foo.txt)
nnoremap <leader>cr :let @*=fnamemodify(expand("%"),":.")<CR>
" absolute path  (/something/src/foo.txt)
nnoremap <leader>cp :let @*=expand("%:p")<CR>
" filename       (foo.txt)
nnoremap <leader>cf :let @*=expand("%:t")<CR>
" directory name (/something/src)
nnoremap <leader>cd :let @*=expand("%:p:h")<CR>
" open current directory on netrw
nnoremap <leader>ed :execute 'e ' . expand("%:p:h")<CR>

nnoremap <leader>ev :e $MYVIMRC<CR>
nnoremap <leader>sv :so $MYVIMRC<CR>

nnoremap <leader>g :silent grep ""<Left>
" nnoremap <leader>f :silent grep "function <C-R><C-W>"
" nnoremap <leader>c :silent grep "class <C-R><C-W>"

nnoremap <leader>tt :!vendor/bin/phpunit --colors=never --stop-on-failure<CR>
nnoremap <leader>tf :!vendor/bin/phpunit --colors=never --stop-on-failure "%"<CR>

" Switch between dark and light background
" nnoremap <leader>light :set bg=light<CR>
"" nnoremap <leader>dark :set bg=dark<CR>
nnoremap <leader>on :call TurnLightsOn()<CR>
nnoremap <leader>off :call TurnLightsOff()<CR>

" clean highlight search
nnoremap <Esc><Esc> :noh<CR>:<backspace>
nnoremap ,. :noh<CR>:<backspace>

" Use ¡ to jump to the line and column of the given mark
nnoremap ¡ `

nnoremap <D-p> :CtrlPBuffer<CR>
nnoremap <D-u> :CtrlPMRU<CR>
nnoremap <D-P> :CtrlP<CR>
" nnoremap <D-r> :CtrlPFunky<CR>
" nnoremap <D-R> :execute 'CtrlPFunky ' . expand('<cword>')<CR>
nnoremap <D-e> :CtrlPTag<CR>
nnoremap <D-E> :CtrlPBufTag<CR>

" Uses v:count1 to capture the [count] entered before the mapping. See h: v:count.
nnoremap <M-S-Left> :<C-U>exec v:count1 . "cp"<CR>zz
nnoremap <M-S-Right> :<C-U>exec v:count1 . "cn"<CR>zz
nnoremap <M-S-Up> :botright cw<CR>
nnoremap <M-S-Down> :ccl<CR>

" Navigate between windows
nnoremap <M-D-Up> <C-w>k
nnoremap <M-D-Down> <C-w>j
nnoremap <M-D-Left> <C-w>h
nnoremap <M-D-Right> <C-w>l
nnoremap <D-1> <C-w>t
nnoremap <D-2> 2<C-w>w
nnoremap <D-3> 3<C-w>w
nnoremap <D-4> 4<C-w>w
nnoremap <D-5> 5<C-w>w
nnoremap <D-6> 6<C-w>w
nnoremap <D-7> 7<C-w>w
nnoremap <D-8> 8<C-w>w
nnoremap <D-9> 9<C-w>w
nnoremap <D-0> <C-w>b
nnoremap + 4<C-w>>
nnoremap - 4<C-w><
nnoremap _ 4<C-w>-
nnoremap = 4<C-w>+

" Type two , as replacement for hitting the <Esc> to exit Insert mode
inoremap ,, <Esc>
