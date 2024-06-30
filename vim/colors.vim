function! EnableSyntax()
    syntax on

    call matchadd('Error', ' ')             " Highlight "space" characters entered with Alt+Space on macOS

    highlight IncSearch term=reverse ctermfg=10 ctermbg=9 gui=bold guifg=#f0f0f1 guibg=#d75f00
    highlight Search term=reverse ctermfg=10 ctermbg=3 gui=bold guifg=Black guibg=#ffb650
    highlight Conceal guifg=#dddddd
    highlight SpecialKey guifg=#dddddd

    highlight LineNr guifg=#00819c guibg=#f0f0f0
    " phpInclude is linked to PreProc
    highlight PreProc guifg=#7928a1
    highlight phpUseNamespaceSeparator guifg=#8b008b
    highlight phpUseNamespaceSeparator guifg=#870c25
    highlight phpUseAlias guifg=#7d314c
    " phpType is linked to Type
    highlight Type guifg=#7928a1
    highlight String guifg=#00894d
    highlight phpClass guifg=#c40100
    highlight phpStorageClass guifg=#c40100
    highlight StorageClass guifg=#c40100
    highlight phpClassNamespaceSeparator guifg=#870c25
    highlight phpFunction guifg=#1f3a93
    highlight phpMethod guifg=#1f3a93
    highlight phpDocTags guifg=#bf6f8c
    highlight phpDocParam guifg=#c40100
    highlight phpDocParam guifg=#777777
    highlight phpDocIdentifier guifg=#ca1243
    highlight phpDocIdentifier guifg=#ca5b78

    " define colors for Vdebug
    highlight DbgCurrentLine guibg=#ce8ee2 guifg=#000000
    highlight DbgCurrentSign guibg=#ce8ee2 guifg=#000000
    highlight DbgBreakptLine guibg=#ffb650 guifg=#220b38
    highlight DbgBreakptSign guibg=#ffb650 guifg=#220b38
    highlight DbgDisabledLine guibg=#d6b586 guifg=#000036
    highlight DbgDisabledSign guibg=#d6b586 guifg=#000036
    " highlight DbgCurrentStackPositionSign
    " highlight DbgCurrentStackPositionLine

    " define colors for coc-list
    " highlight CocListHighlight gui=bold guifg=Black guibg=LightGray
endfunction

if has('gui_running')
    function! TurnLightsOn()
        " colorscheme base16-tomorrow
        " colorscheme base16-gruvbox-light-soft
        " colorscheme base16-harmonic-light
        colorscheme base16-one-light

        call EnableSyntax()
    endfunction

    function! TurnLightsOff()
        " colorscheme base16-default-dark
        " colorscheme base16-snazzy
        " colorscheme base16-phd
        " colorscheme base16-tomorrow-night
        " colorscheme base16-twilight
        " colorscheme base16-darktooth
        " colorscheme base16-classic-dark
        " colorscheme base16-gruvbox-dark-hard
        colorscheme base16-onedark

        call EnableSyntax()

        highlight Comment guifg=#7a8090
    endfunction
else
    function! TurnLightsOn()
        set termguicolors
        colorscheme base16-one-light
        " colorscheme PaperColor
        set background=light

        call EnableSyntax()
    endfunction

    function! TurnLightsOff()
        set termguicolors
        colorscheme base16-onedark
        " colorscheme PaperColor
        set background=dark

        call EnableSyntax()
    endfunction
endif
