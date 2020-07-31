" ============================================
" --- Latex ---
" ============================================
" ============================================

augroup VimCompletesMeTex
   autocmd!
   autocmd FileType tex
       \ let b:vcm_omni_pattern = g:vimtex#re#neocomplete
augroup END
if has('mac')
    let g:vimtex_view_method = 'skim'
elseif has('win32')
    let g:vimtex_view_general_viewer = 'sumatraPDF'
    let g:vimtex_view_general_options = '-reuse-instance @pdf'
    let g:vimtex_view_general_options_latexmk = '-reuse-instance'
elseif (has('unix') && exists('$WSLENV'))
    let g:vimtex_view_general_viewer = 'zathura'
    let g:vimtex_view_general_options = '-reuse-instance @pdf'
    let g:vimtex_view_general_options_latexmk = '-reuse-instance'
endif
let g:tex_stylish = 1
let g:vimtex_compiler_progname = 'nvr'
let g:tex_conceal = ''
let g:tex_flavor = 'latex'
let g:tex_isk='48-57,a-z,A-Z,192-255,:'
let g:vimtex_fold_enabled = 1
let g:vimtex_fold_types = {
      \ 'markers' : {'enabled': 0},
      \ 'sections' : {'parse_levels': 1},
      \}
let g:vimtex_format_enabled = 1
let g:vimtex_view_automatic = 1
let g:vimtex_view_forward_search_on_start = 0
let g:vimtex_toc_config = {
      \ 'split_pos' : 'left',
      \ 'mode' : 2,
      \ 'fold_enable' : 1,
      \ 'hotkeys_enabled' : 1,
      \ 'hotkeys_leader' : '',
      \ 'refresh_always' : 0,
      \}
let g:vimtex_quickfix_open_on_warning = 0
let g:vimtex_quickfix_autoclose_after_keystrokes = 3
let g:vimtex_imaps_enabled = 1
let g:vimtex_complete_img_use_tail = 1
let g:vimtex_complete_bib = {
      \ 'simple' : 1,
      \ 'menu_fmt' : '@year, @author_short, @title',
      \}
let g:vimtex_echo_verbose_input = 0
