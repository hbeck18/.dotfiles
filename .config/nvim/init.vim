" Specify a directory for plugins:A
call plug#begin('~/.config/nvim/plugged')

" Simpler code folding in Python:
Plug 'tmhedberg/SimpylFold', { 'for': ['python']}

" Syntax highlighting
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}, { 'for': ['python']}

" color scheme
Plug 'joshdick/onedark.vim'
Plug 'drewtempelmeyer/palenight.vim'

" status bar at bottom
Plug 'itchyny/lightline.vim'

" NerdTree file tree
Plug 'preservim/nerdtree'

" coc
Plug 'neoclide/coc.nvim', {'branch': 'release'}, { 'for': ['python']}

" better comments
Plug 'preservim/nerdcommenter'

" fuzzy search
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'pbogut/fzf-mru.vim'

" auto brackets
Plug 'tmsvg/pear-tree'
Plug 'junegunn/rainbow_parentheses.vim'

" Indent line
Plug 'Yggdroot/indentLine', { 'for': ['python']}

" tmux integration
Plug 'christoomey/vim-tmux-navigator'

" git 
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Better python navigation
Plug 'jeetsukumaran/vim-pythonsense', { 'for': ['python']}

" Linting
Plug 'neomake/neomake'

" python docstring
Plug 'heavenshell/vim-pydocstring', { 'do': 'make install' }

" vim slime --> sends code to ipython console
Plug 'jpalardy/vim-slime', { 'for': ['python']}
Plug 'hanschen/vim-ipython-cell', { 'for': ['python']}

" shows mapped leader keys
Plug 'liuchengxu/vim-which-key'

" smooth scrolling
Plug 'psliwka/vim-smoothie'

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
Plug 'junegunn/goyo.vim', {'for': ['markdown', 'tex']}
Plug 'reedes/vim-pencil', {'for': ['markdown', 'tex']}
Plug 'rhysd/vim-grammarous', {'for': ['markdown', 'tex']}

" Latex stuff
Plug 'lervag/vimtex', {'for': ['tex']}
Plug 'SirVer/ultisnips', {'for': ['tex']}
Plug 'honza/vim-snippets', {'for': ['tex']}

" better search
Plug 'rhysd/clever-f.vim'

" better indentation
Plug 'michaeljsmith/vim-indent-object'

" Undo tree
Plug 'mbbill/undotree'

" Substitution
Plug 'svermeulen/vim-subversive'

" Initialize plugin system
call plug#end()

" Some basic stuff
" --> python highlighting,
" --> changing leader key to <,>
let python_highlight_all=1
if has('mac')
    let g:python3_host_prog=expand('~/anaconda3/envs/neovim/bin/python3.8')
else
    let g:python3_host_prog=expand('~/anaconda3/envs/neovim/bin/python3.8')
endif
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
:set number relativenumber
set encoding=utf-8
set cursorline
set scrolloff=10
map <C-S> :setlocal spell! spelllang=en_us<CR>
" -----
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
      \             [ 'cocstatus', 'currentfunction', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'cocstatus': 'coc#status',
      \   'currentfunction': 'CocCurrentFunction',
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



" --- Rainbow brackets ---
"  -----
"  -----
let g:rainbow#max_level = 16
let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['{', '}']]
autocmd FileType * RainbowParentheses




" ==============================
" ==============================
" PYTHON =======================
" ==============================
" ==============================

" --- SimpylFold
let g:SimpylFold_docstring_preview = 1


" --- Neomake syntax highlighting ---
let g:neomake_python_flake8_maker = {
    \ 'args': ['--ignore=E501,W503,E402,E116,E203,W391',  '--format=default'],
    \ 'errorformat':
        \ '%E%f:%l: could not compile,%-Z%p^,' .
        \ '%A%f:%l:%c: %t%n %m,' .
        \ '%A%f:%l: %t%n %m,' .
        \ '%-G%.%#',
    \ }
let g:neomake_python_enabled_makers = ['flake8']
call neomake#configure#automake('nw', 500)


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
set updatetime=150

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

" " Use `[g` and `]g` to navigate diagnostics
" " Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
" nmap <silent> [g <Plug>(coc-diagnostic-prev)
" nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <sid>show_documentation()<cr>
function! s:show_documentation()
  if index(['vim', 'help'], &filetype) >= 0
    execute 'help ' . expand('<cword>')
  elseif &filetype ==# 'tex'
    VimtexDocPackage
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

let g:coc_global_extensions = [
      \ 'coc-vimtex',
      \ 'coc-python',
      \ 'coc-json',
      \ 'coc-yaml',
      \ 'coc-yank'
      \]


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
                \ 'rounded': v:true } }
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
let g:indentLine_faster     = 1

" pythonsense
let g:is_pythonsense_suppress_motion_keymaps = 1
let g:is_pythonsense_alternate_motion_keymaps = 1

" pear_tree (auto brackets)
let g:pear_tree_smart_openers = 1
let g:pear_tree_smart_closers = 1
let g:pear_tree_smart_backspace = 1
" Automatically map <BS>, <CR>, and <Esc>
let g:pear_tree_map_special_keys = 1
" Default mappings:
imap <BS> <Plug>(PearTreeBackspace)
imap <CR> <Plug>(PearTreeExpand)
imap <Esc> <Plug>(PearTreeFinishExpansion)


" python docstring
let g:pydocstring_formatter = 'google'
nmap <silent> <C-P> <Plug>(pydocstring)


" " ----- vim-slime settings -----
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
nnoremap <F5> :IPythonCellRun<CR>

" map <Leader>R to run script and time the execution
nnoremap <F6> :IPythonCellRunTime<CR>

" map <Leader>c to execute the current cell
nmap <leader>s <Plug>SlimeSendCell

" map <Leader>C to execute the current cell and jump to the next cell
nnoremap <Leader>S :IPythonCellExecuteCellJump<CR>

" map <Leader>l to clear IPython screen
nnoremap <Leader>0 :IPythonCellClear<CR>

" map <Leader>x to close all Matplotlib figure windows
nnoremap <Leader>y :IPythonCellClose<CR>

" map [c and ]c to jump to the previous and next cell header
nnoremap [c :IPythonCellPrevCell<CR>
nnoremap ]c :IPythonCellNextCell<CR>

" map <Leader>p to run the previous command
nnoremap <Leader>p :IPythonCellPrevCommand<CR>

" map <Leader>d to start debug mode
nnoremap <F7> :SlimeSend1 %debug<CR>

" map <Leader>q to exit debug mode or IPython
nnoremap <Leader>q :SlimeSend1 exit<CR>


" Vim whichkey
nnoremap <silent> <leader> :WhichKey ','<CR>


" .md note taking
set conceallevel=0
let g:vim_markdown_conceal = 0
let g:tex_conceal = ""
let g:goyo_width = 100
let g:vim_markdown_math = 1
let g:vim_markdown_frontmatter = 1
map <leader>x ^rx: <Esc>:r! date +" [\%d.\%m.\%y \%H:\%M]"<ENTER>kJA<Esc>$
map <leader>d :r! date +" [\%d.\%m.\%y \%H:\%M]"<ENTER>kJA<Esc>$
let g:pencil#wrapModeDefault = 'soft'   " default is 'hard'
augroup pencil
  autocmd!
  autocmd FileType markdown,mkd call pencil#init()
  autocmd FileType tex call pencil#init()
  " autocmd FileType text         call pencil#init({'wrap': 'hard'})
augroup END


" latex
augroup VimCompletesMeTex
   autocmd!
   autocmd FileType tex
       \ let b:vcm_omni_pattern = g:vimtex#re#neocomplete
augroup END
if has('mac')
    let g:vimtex_view_method = 'skim'
elseif has('win32') || (has('unix') && exists('$WSLENV'))
    let g:vimtex_view_general_viewer = 'sumatraPDF'
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
      \ 'split_pos' : 'full',
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
