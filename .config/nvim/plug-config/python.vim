" ================================
" --- Python ---
" ================================
" ================================


let python_highlight_all=1
let g:python3_host_prog=expand('~/anaconda3/envs/neovim/bin/python3.8')

" indentLine
let g:indentLine_first_char = '|'
let g:indentLine_char = '|'
let g:indentLine_showFirstIndentLevel = 1
let g:indentLine_faster     = 1

" linting
let g:ale_linters = {
\   'python': ['flake8'],
\}
let g:ale_python_flake8_options = '--ignore=E501,W503,E402,E116,E203,W391'

function! LinterStatus() abort
    let l:counts = ale#statusline#Count(bufnr(''))
    let l:all_errors = l:counts.error + l:counts.style_error
    let l:all_non_errors = l:counts.total - l:all_errors
    return l:counts.total == 0 ? 'OK' : printf(
        \   '%d? %d? ',
        \   all_non_errors,
        \   all_errors
        \)
endfunction
set statusline+=%=
set statusline+=\ %{LinterStatus()}
