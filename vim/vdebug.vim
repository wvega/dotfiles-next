if ! exists('g:vdebug_options')
    let g:vdebug_options = { 'path_maps': {} }
endif

let g:vdebug_options['break_on_open'] = 0
let g:vdebug_options['on_close'] = 'detach'

" Use the compact window layout.
let g:vdebug_options['watch_window_style'] = 'compact'


if ! exists('g:vdebug_features')
    let g:vdebug_features = {}
endif

" Max number of array or object children to initially retrieve.
let g:vdebug_features['max_children'] = 128


if ! exists('g:vdebug_keymap')
    let g:vdebug_keymap = {}
endif

let g:vdebug_keymap['run'] = '<F8>'
let g:vdebug_keymap['step_over'] = '<F9>'
let g:vdebug_keymap['step_into'] = '<D-F9>'
let g:vdebug_keymap['step_out'] = '<F7>'
let g:vdebug_keymap['close'] = '<F5>'
let g:vdebug_keymap['detach'] = '<F6>'
let g:vdebug_keymap['run_to_cursor'] = '<D-F8>'
let g:vdebug_keymap['set_breakpoint'] = '<F10>'
let g:vdebug_keymap['get_context'] = '<F11>'
let g:vdebug_keymap['eval_under_cursor'] = '<F12>'

" " Need to set as empty for this to work with Vagrant boxes.
" " http://www.mediacurrent.com/blog/debug-drupal-php-vim-vdebug
" let g:vdebug_options['server'] = ""
