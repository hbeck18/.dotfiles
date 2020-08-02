" Specify a directory for plugins:A
call plug#begin('~/.config/nvim/plugged')

" Simpler code folding in Python:
Plug 'tmhedberg/SimpylFold', { 'for': ['python']}

" Syntax highlighting
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins', 'for': ['python']}

" color scheme
Plug 'joshdick/onedark.vim'
Plug 'drewtempelmeyer/palenight.vim'

" status bar at bottom
Plug 'itchyny/lightline.vim'

" coc
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" vista
Plug 'liuchengxu/vista.vim', { 'for': ['python']}

" better comments
Plug 'preservim/nerdcommenter'

" fuzzy search
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'pbogut/fzf-mru.vim'

" auto brackets
Plug 'tmsvg/pear-tree'
Plug 'tpope/vim-surround'
Plug 'junegunn/rainbow_parentheses.vim'

" Indent line
Plug 'Yggdroot/indentLine', { 'for': ['python']}

" tmux integration
Plug 'christoomey/vim-tmux-navigator'

" git 
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" vim slime --> sends code to ipython console
Plug 'jpalardy/vim-slime', { 'for': ['python']}
Plug 'hanschen/vim-ipython-cell', { 'for': ['python']}

" shows mapped leader keys
Plug 'liuchengxu/vim-which-key'

" make copy of current vim session
Plug 'tpope/vim-obsession'
Plug 'dhruvasagar/vim-prosession'

" better autocompletion
Plug 'ajh17/vimcompletesme'

" Markdown stuff
Plug 'godlygeek/tabular', {'for': ['markdown']}
Plug 'plasticboy/vim-markdown', {'for': ['markdown', 'vim-plug']}
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'vim-voom/voom', {'for': ['markdown']}

" Markdown+tex
Plug 'junegunn/goyo.vim', {'for': ['markdown', 'tex', 'text']}
Plug 'reedes/vim-pencil', {'for': ['markdown', 'tex', 'text']}
Plug 'rhysd/vim-grammarous', {'for': ['markdown', 'tex', 'text']}

" Latex stuff
Plug 'lervag/vimtex', {'for': ['tex']}
Plug 'SirVer/ultisnips', {'for': ['tex']}
Plug 'honza/vim-snippets', {'for': ['tex']}

" better search
Plug 'rhysd/clever-f.vim'

" better indentation
Plug 'michaeljsmith/vim-indent-object'

" Better yanking/substition
Plug 'svermeulen/vim-subversive'
Plug 'svermeulen/vim-yoink'

" easy motion
Plug 'easymotion/vim-easymotion'

" linting
" Plug 'neomake/neomake'
" Plug 'mkalinski/vim-lightline_neomake'
Plug 'dense-analysis/ale', { 'for': ['python']}
Plug 'maximbaz/lightline-ale', { 'for': ['python']}

" undo tree
Plug 'mbbill/undotree'

" devicons
Plug 'ryanoasis/vim-devicons'

" Initialize plugin system
call plug#end()

" ======================================
" --- basic input ---
" ======================================
" ======================================
" --> changing leader key to <,>
syntax on
let mapleader = ","  " changes leader key.
let maplocalleader = "\\"
" basic settings
set clipboard=unnamed " adds system-wide clipboard
set undofile
" set nobackup
" set nowritebackup
set noswapfile
set shiftwidth=4
set foldlevel=99
set expandtab
set tabstop=4
set softtabstop=4
set nowrap
set hidden
set number relativenumber
set encoding=UTF-8
set fileencodings=utf-8
set guifont=Fira\ Code
set cursorline
set scrolloff=10
set updatetime=300
set foldmethod=manual
map <C-S> :setlocal spell! spelllang=en_us<CR>
" -----
"  -----
nnoremap <Leader><space> za
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <CR> o<Esc>
nnoremap <Leader>rf :checkt<CR>


" --- color scheme ---
set background=dark
colorscheme palenight
if (has("termguicolors"))
    set termguicolors
    hi LineNr ctermbg=NONE guibg=NONE
endif


" --- NerdCommenter ---
"  -----
"  -----
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
let g:NERDTrimTrailingWhitespace = 1
nnoremap <Leader>t :call NERDComment('Toggle', 'Toggle')<CR>


" --- Rainbow brackets ---
"  -----
"  -----
let g:rainbow#max_level = 16
let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['{', '}']]
autocmd FileType * RainbowParentheses


" --- Neomake syntax highlighting ---
" let g:neomake_python_flake8_maker = {
    " \ 'args': ['--ignore=E501,W503,E402,E116,E203,W391',  '--format=default'],
    " \ 'errorformat':
        " \ '%E%f:%l: could not compile,%-Z%p^,' .
        " \ '%A%f:%l:%c: %t%n %m,' .
        " \ '%A%f:%l: %t%n %m,' .
        " \ '%-G%.%#',
    " \ }
" let g:neomake_python_enabled_makers = ['flake8']
" call neomake#configure#automake('nw', 500)


" pear_tree (auto brackets)
let g:pear_tree_smart_openers = 0
let g:pear_tree_smart_closers = 0
let g:pear_tree_smart_backspace = 0
" Automatically map <BS>, <CR>, and <Esc>
let g:pear_tree_map_special_keys = 1
" Default mappings:
imap <BS> <Plug>(PearTreeBackspace)
imap <CR> <Plug>(PearTreeExpand)
imap <Esc> <Plug>(PearTreeFinishExpansion)


" Vim whichkey
nnoremap <silent> <leader> :WhichKey ','<CR>
nnoremap <silent> <Localleader> :WhichKey '\'<CR>


" ultisnippets
let g:UltiSnipsExpandTrigger       = "<C-j>"
let g:UltiSnipsJumpForwardTrigger  = "<C-j>"
let g:UltiSnipsJumpBackwardTrigger = "<C-k>"


" clever F
let g:clever_f_across_no_line    = 1
let g:clever_f_fix_key_direction = 1
let g:clever_f_timeout_ms        = 3000


" undo tree
let g:undotree_HighlightChangedWithSign = 0
let g:undotree_WindowLayout             = 4
let g:undotree_SetFocusWhenToggle       = 1
nnoremap <Leader>u :UndotreeToggle<CR>


" subversive
" s for substitute
nmap s <plug>(SubversiveSubstitute)
nmap ss <plug>(SubversiveSubstituteLine)
nmap S <plug>(SubversiveSubstituteToEndOfLine)
xmap s <plug>(SubversiveSubstitute)
xmap p <plug>(SubversiveSubstitute)
xmap P <plug>(SubversiveSubstitute)
" yoink history
nmap <c-n> <plug>(YoinkPostPasteSwapBack)
nmap <c-p> <plug>(YoinkPostPasteSwapForward)
nmap p <plug>(YoinkPaste_p)
nmap P <plug>(YoinkPaste_P)





" ======================================
" --- plugins ---
" ======================================
" ======================================
source $HOME/.config/nvim/plug-config/lsp.vim
source $HOME/.config/nvim/plug-config/python.vim
source $HOME/.config/nvim/plug-config/slime.vim
source $HOME/.config/nvim/plug-config/fzf.vim
source $HOME/.config/nvim/plug-config/md.vim
source $HOME/.config/nvim/plug-config/tex.vim
source $HOME/.config/nvim/plug-config/statusline.vim


