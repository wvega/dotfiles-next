let g:currentmode={
      \ 'n'      : 'Normal',
      \ 'no'     : 'N·Operator Pending',
      \ 'v'      : 'Visual',
      \ 'V'      : 'V·Line',
      \ "\<C-V>" : 'V·Block',
      \ 's'      : 'Select',
      \ 'S'      : 'S·Line',
      \ "\<C-S>" : 'S·Block',
      \ 'i'      : 'Insert',
      \ 'R'      : 'Replace',
      \ 'Rv'     : 'V·Replace',
      \ 'c'      : 'Command',
      \ 'cv'     : 'Vim Ex',
      \ 'ce'     : 'Ex',
      \ 'r'      : 'Prompt',
      \ 'rm'     : 'More',
      \ 'r?'     : 'Confirm',
      \ '!'      : 'Shell',
      \ 't'      : 'Terminal'
      \}

function! GetCurrentMode(m)
    let l:mode = toupper(get(g:currentmode, mode(), ''))

    if (mode() =~# '\v(n|no)')
        let l:currentmode = 'n'
    elseif (mode() =~# '\v(v|V)' || mode() ==# "\<C-V>" || mode() ==# 't')
        let l:currentmode = 'v'
    elseif (mode() ==# 'i')
        let l:currentmode = 'i'
    else
        let l:currentmode = '*'
    endif

    if (l:currentmode ==# a:m)
        return '  ' . l:mode . ' '
    endif

    return ''
endfunction

set statusline=
" set statusline+=%#%{ChangeStatuslineColor()}#
set statusline+=%#Normal#%{GetCurrentMode('n')}
set statusline+=%#DiffAdd#%{GetCurrentMode('i')}
set statusline+=%#DiffText#%{GetCurrentMode('v')}
set statusline+=%#Normal#%{GetCurrentMode('*')}
set statusline+=%#PmenuSel#
set statusline+=%([%R%M]%)
set statusline+=%(\ [%n]\ %.50f\ %)
set statusline+=%=
set statusline+=%y
set statusline+=%(\ %p%%\ %l:\ %c\ %)
set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
