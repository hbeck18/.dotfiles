" =========================================
" --- Slime ---
" =========================================
" =========================================


let g:slime_target = "tmux"
let g:slime_paste_file = "$HOME/.slime_paste"
let g:slime_python_ipython = 1

let g:slime_no_mappings = 1
xmap <c-c> <Plug>SlimeRegionSend
nmap <c-c> <Plug>SlimeParagraphSend
nmap <Leader>a :%SlimeSend<cr>

let g:slime_cell_delimiter = "# %%"

" --- ipython cell settings
" map <Leader>s to start IPython
nnoremap <Leader>i :SlimeSend1 ipython --matplotlib<CR>

" map <Leader>Q to restart ipython
nnoremap <Leader>I :IPythonCellRestart<CR>

" map <F5> to save and run script
" nnoremap <F5> :IPythonCellRun<CR>
nnorema <F5> :exe "!tmux send -t 2 '\\%run -t " . expand("%") . "' Enter "<CR>

" map <Leader>c to execute the current cell
nmap <leader>s <Plug>SlimeSendCell

" map <Leader>C to execute the current cell and jump to the next cell
nnoremap <Leader>S :IPythonCellExecuteCellJump<CR>

" map <Leader>l to clear IPython screen
nnoremap <Leader>0 :IPythonCellClear<CR>

" map [c and ]c to jump to the previous and next cell header
nnoremap [c :IPythonCellPrevCell<CR>
nnoremap ]c :IPythonCellNextCell<CR>

" map <Leader>p to run the previous command
nnoremap <Leader>p :IPythonCellPrevCommand<CR>

" map <Leader>d to start debug mode
nnoremap <F6> :SlimeSend1 %debug<CR>

" map <Leader>q to exit debug mode or IPython
nnoremap <Leader>q :SlimeSend1 exit<CR>
