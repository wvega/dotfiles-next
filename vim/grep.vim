"Use RipGrep for lightning fast Gsearch command
if executable('rg')
    set grepprg=rg\ --vimgrep\ --no-heading\ --hidden
    set grepformat=%f:%l:%c:%m,%f:%l:%m
    let g:grep_cmd_opts = '--line-number'
endif
