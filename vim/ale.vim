" disable ALE language server features that coc.nvim already provides
let g:ale_disable_lsp = 1

let g:ale_history_log_output = 0
let g:ale_completion_enabled = 0
let g:ale_fix_on_save = 1

let g:ale_php_cs_fixer_executable = 'php-cs-fixer-safe'
let g:ale_php_cs_fixer_use_global = 1

let g:ale_linters = {
\    'php': ['php', 'phpcs'],
\}

let g:ale_fixers = {
\    'php': ['php_cs_fixer'],
\}
