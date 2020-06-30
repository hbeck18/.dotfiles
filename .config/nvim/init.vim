" Specify a directory for plugins:A
call plug#begin('~/.config/nvim/plugged')

" Simpler code folding in Python:
Plug 'tmhedberg/SimpylFold'

" proper indentation
Plug 'Vimjas/vim-python-pep8-indent'

" Syntax highlighting
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}

" color scheme
" Plug 'joshdick/onedark.vim'
Plug 'drewtempelmeyer/palenight.vim'

" status bar at bottom
Plug 'itchyny/lightline.vim'

" NerdTree file tree
Plug 'preservim/nerdtree'

" coc
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" better comments
Plug 'preservim/nerdcommenter'

" fuzzy search
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'pbogut/fzf-mru.vim'

" auto brackets
Plug 'tmsvg/pear-tree'
Plug 'junegunn/rainbow_parentheses.vim'

" Show colors
Plug 'norcalli/nvim-colorizer.lua'

" Indent line
Plug 'Yggdroot/indentLine'


" Better python navigation
Plug 'jeetsukumaran/vim-pythonsense'

" Linting
Plug 'neomake/neomake'

" python docstring
Plug 'heavenshell/vim-pydocstring', { 'do': 'make install' }

" vim slime --> sends code to ipython console
Plug 'jpalardy/vim-slime'

Plug 'liuchengxu/vim-which-key'

" make copy of current vim session
Plug 'tpope/vim-obsession'
Plug 'dhruvasagar/vim-prosession'



" Initialize plugin system
call plug#end()

" Some basic stuff
" --> python highlighting,
" --> changing leader key to <,>
let python_highlight_all=1
if has('mac')
    let g:python3_host_prog=expand('~/opt/anaconda3/envs/neovim/bin/python3.8')
else
    let g:python3_host_prog=expand('~/anaconda3/envs/neovim/bin/python3.8')
endif
syntax on
let mapleader = ","  " changes leader key.
" basic settings
set clipboard=unnamed " adds system-wide clipboard
set undofile
" set nobackup
" set nowritebackup
" set noswapfile
set shiftwidth=4
set expandtab
set tabstop=4
set softtabstop=4
set nowrap
set hidden
" relative row numbers
:set number relativenumber
" Enable folding
set foldmethod=indent
set foldlevel=99
" Use UTF-8 encoding:
set encoding=utf-8
set cursorline
" When scrolling, keep cursor 5 lines away from screen border
set scrolloff=10
"  -----
"  -----
nnoremap <Leader><space> za
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <CR> o<Esc>
nnoremap <S-CR> O<Esc>





" --- color scheme ---
let g:lightline = {
      \ 'colorscheme': 'palenight',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'cocstatus', 'currentfunction', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'cocstatus': 'coc#status',
      \   'currentfunction': 'CocCurrentFunction',
      \   'method': 'NearestMethodOrFunction'
      \ },
      \ 'separator': { 'left': '|', 'right': '|'},
      \ 'subseparator': { 'left': '|', 'right': '|'}
      \ }
set background=dark
colorscheme palenight
" checks if your terminal has 24-bit color support ::: comment if working on
" OSX terminal
if (has("termguicolors"))
    set termguicolors
    hi LineNr ctermbg=NONE guibg=NONE
endif





" --- Neomake syntax highlighting ---
let g:neomake_python_flake8_maker = {
    \ 'args': ['--ignore=E501,W503,E402,E116,E203',  '--format=default'],
    \ 'errorformat':
        \ '%E%f:%l: could not compile,%-Z%p^,' .
        \ '%A%f:%l:%c: %t%n %m,' .
        \ '%A%f:%l: %t%n %m,' .
        \ '%-G%.%#',
    \ }
let g:neomake_python_enabled_makers = ['flake8']
call neomake#configure#automake('nw', 500)







" --- Nerdtree Settings ---
"  -------
"  -------
let NERDTreeIgnore=['\.pyc$', '__pycache__'] "ignore files in NERDTree
" enable line numbers
let NERDTreeShowLineNumbers=1
autocmd FileType nerdtree setlocal relativenumber
let NERDTreeShowHidden = 1
let g:NERDTreeHighlightFolders = 1
let g:NERDTreeHighlightFoldersFullName = 1
let g:NERDTreeHighlightFolders = 1
let g:NERDTreeHighlightFoldersFullName = 1
nnoremap <Leader>n : NERDTreeToggle<cr>




" --- NerdCommenter ---
"  -----
"  -----
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
let g:NERDTrimTrailingWhitespace = 1
nnoremap <Leader>t :call NERDComment('Toggle', 'Toggle')<CR>



" --- coc config ---
"  -----
"  -----
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <Leader>c coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
" nmap <silent> gy <Plug>(coc-type-definition)
" nmap <silent> gi <Plug>(coc-implementation)
" nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>


" --- Rainbow brackets ---
"  -----
"  -----
let g:rainbow#max_level = 16
let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['{', '}']]

autocmd FileType * RainbowParentheses



" --- fzf ---
"  -----
"  -----
if has("nvim")
    " Escape inside a FZF terminal window should exit the terminal window
    " rather than going into the terminal's normal mode.
    autocmd FileType fzf tnoremap <buffer> <Esc> <Esc>
endif
nnoremap <silent> <Leader>f :Files<CR>
nnoremap <silent> <Leader>g :GFiles<CR>
nnoremap <silent> <Leader>b :Buffers<CR>
nnoremap <Leader>h :History<CR>
nnoremap <Leader>rg :Rg<Space>
nnoremap <silent> <Leader>m :FZFMru<CR>
" searches word under the cursor.
noremap <Leader>d :exe ':Ag ' . expand('<cword>')<CR>
" display fzf in floating window
if has('nvim-0.4.0') || has("patch-8.2.0191")
    let g:fzf_layout = { 'window': {
                \ 'width': 0.9,
                \ 'height': 0.7,
                \ 'highlight': 'Comment',
                \ 'rounded': v:false } }
else
    let g:fzf_layout = { "window": "silent botright 16split enew" }
endif
" fzf file fuzzy search that respects .gitignore
" If in git directory, show only files that are committed, staged, or unstaged
" else use regular :Files
nnoremap <expr> <Leader>F (len(system('git rev-parse')) ? ':Files' : ':GFiles --exclude-standard --others --cached')."\<cr>"



" indentLine
let g:indentLine_first_char = '|'
let g:indentLine_char = '|'
let g:indentLine_showFirstIndentLevel = 1


" pythonsense
let g:is_pythonsense_suppress_motion_keymaps = 1
let g:is_pythonsense_alternate_motion_keymaps = 1
let g:pear_tree_smart_openers = 1
let g:pear_tree_smart_closers = 1
let g:pear_tree_smart_backspace = 1



" python docstring
let g:pydocstring_formatter = 'google'
nmap <silent> <Leader>d <Plug>(pydocstring)



" ----- vim-slime settings -----
let g:slime_target = "neovim"
let g:slime_paste_file = "$HOME/.slime_paste"
let g:slime_python_ipython = 1

let g:slime_no_mappings = 1
xmap <c-c> <Plug>SlimeRegionSend
nmap <c-c> <Plug>SlimeParagraphSend
nmap <Leader>a :%SlimeSend<cr>

let g:slime_cell_delimiter = "# %%"
nmap <leader>s <Plug>SlimeSendCell



" Vim whichkey
nnoremap <silent> <leader> :WhichKey ','<CR>



" === TMUX-like behavior ===
" Maps ESC to exit terminal's insert mode
set splitbelow
set splitright
if has('nvim')
tnoremap <Esc> <C-\><C-n>
endif

" Maps ctrl-b + c to open a new tab window
nnoremap <C-a>c :tabnew +terminal<CR>
tnoremap <C-a>c <C-\><C-n>:tabnew +terminal<CR>

nnoremap <C-a>- :sp <Bar> term<CR>
tnoremap <C-a>- <C-\><C-n>:sp <Bar> term<CR>

nnoremap <C-a><Bar> :vs <Bar> term<CR>
tnoremap <C-a><Bar> <C-\><C-n>:vs <Bar> term<cr>

augroup neovim_terminal
    autocmd!

    " Enter Terminal-mode (insert) automatically
    autocmd TermOpen * startinsert

    " Disables number lines on terminal buffers
    autocmd TermOpen * :set nonumber norelativenumber
augroup END
