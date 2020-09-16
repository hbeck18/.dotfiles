" Specify a directory for plugins:
call plug#begin('~/.config/nvim/plugged')

Plug 'christoomey/vim-tmux-navigator'  " tmux/vim integration (jump between splits from tmux/vim)
Plug 'drewtempelmeyer/palenight.vim'  " color scheme
Plug 'rakr/vim-one'  " color scheme
Plug 'tpope/vim-commentary'  " comments
Plug 'liuchengxu/vim-which-key'  " which key

" substitution/yanks
Plug 'svermeulen/vim-subversive'
Plug 'svermeulen/vim-yoink'
Plug 'machakann/vim-highlightedyank'

" better parantheses
Plug 'frazrepo/vim-rainbow'
Plug 'tpope/vim-surround'
Plug 'tmsvg/pear-tree'
Plug 'tpope/vim-repeat'

" better search
Plug 'rhysd/clever-f.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" lsp
Plug 'neovim/nvim-lsp'
Plug 'liuchengxu/vista.vim'
Plug 'nvim-lua/completion-nvim'
Plug 'nvim-lua/diagnostic-nvim'
Plug 'nvim-lua/lsp-status.nvim'

" linting/fixing
Plug 'neomake/neomake'
Plug 'psf/black', { 'branch': 'stable' }

" snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets', {'for': ['tex']}

" Latex
Plug 'lervag/vimtex', {'for': ['tex']}

" statusbar
Plug 'itchyny/lightline.vim'
Plug 'sinetoami/lightline-neomake'

" tree sitter
Plug 'nvim-treesitter/nvim-treesitter'

" file explorer
Plug 'kyazdani42/nvim-tree.lua'
Plug 'kyazdani42/nvim-web-devicons'

" undo tree
Plug 'mbbill/undotree'

" slime
Plug 'jpalardy/vim-slime', { 'for': ['python']}
Plug 'hanschen/vim-ipython-cell', { 'for': ['python']}

" smooth scrolling
Plug 'psliwka/vim-smoothie'

" workspace
Plug 'thaerkh/vim-workspace'

" Initialize plugin system
call plug#end()


" ==============================================================
" --- Basics ---
" ==============================================================
syntax on
let mapleader = ","
let maplocalleader = "\\"
set clipboard=unnamedplus  " adds system-wide clipboard
set nowrap  " no wrap
set number relativenumber  " line numbers
set signcolumn=number  " sign column/number column merged into one
set shiftwidth=4
set expandtab  " make spaces out of tabs
set tabstop=4  " tabs
set softtabstop=4
set cursorline  " fill line at cursor
set scrolloff=10  " always keep 10 lines at bot/top of screen
set hidden
set wrapscan " begin search from top of file when nothing is found anymore
" set mouse=a  " mouse support
set shortmess+=c  " shorter messages
set updatetime=200  " shorter update times
nnoremap <Leader><space> za
set regexpengine=1  " for speed
" nnoremap <Leader>m :marks<CR>  
" reload all buffer
nnoremap <Leader>rf :checkt<CR>

" larger history
set viminfo=%,<800,'10,/50,:100
"           | |    |   |   + command-line history saved
"           | |    |   + search history saved
"           | |    + files marks saved
"           | + lines saved each register (old name for <, vi6.2)
"           + save/restore buffer list
" use swap files only for crash insurance, do not block.
set history=1000  

" backup/swap files/undo file
set undofile
set undodir^=~/.nvim/undo/
set undolevels=1000000  " max number of undos
set undoreload=1000000
set nobackup
set noswapfile
set directory^=~/.nvim/swap/
" protect against crash-during-write
set writebackup
" but do not persist backup after successful write
set nobackup
" use rename-and-write-new method whenever safe
set backupcopy=auto
" consolidate the writebackups -- not a big
" deal either way, since they usually get deleted
set backupdir^=~/.nvim/backup/
set autoread
set wildmenu
set wildmode=list:full,full

" file encoding
set encoding=UTF-8
set fileencoding=utf-8

" switch between windows.
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" word wrap navigation (text files)
nnoremap <expr> k v:count == 0 ? 'gk' : 'k'
nnoremap <expr> j v:count == 0 ? 'gj' : 'j'

" spell check
map <C-S> :setlocal spell! spelllang=en_us<CR>

" Remap escape to leave terminal mode
augroup Terminal
  au TermOpen * tnoremap <buffer> <Esc> <c-\><c-n>
augroup end

" better f/F searching
let g:clever_f_across_no_line    = 1
let g:clever_f_fix_key_direction = 1
let g:clever_f_timeout_ms        = 3000

" Make sure Vim returns to the same line when you reopen a file.
augroup line_return
  au!
  au BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \     execute 'normal! g`"zvzz' |
    \ endif
augroup END

" toggle quickfix/location lists
function! GetBufferList()
  redir =>buflist
  silent! ls!
  redir END
  return buflist
endfunction
function! ToggleList(bufname, pfx)
  let buflist = GetBufferList()
  for bufnum in map(filter(split(buflist, '\n'), 'v:val =~ "'.a:bufname.'"'), 'str2nr(matchstr(v:val, "\\d\\+"))')
    if bufwinnr(bufnum) != -1
      exec(a:pfx.'close')
      return
    endif
  endfor
  if a:pfx == 'l' && len(getloclist(0)) == 0
      echohl ErrorMsg
      echo "Location List is Empty."
      return
  endif
  let winnr = winnr()
  exec(a:pfx.'open')
  if winnr() != winnr
    wincmd p
  endif
endfunction

nmap <silent> <leader>l :call ToggleList("Location List", 'l')<CR>
nmap <silent> <leader>q  :call ToggleList("Quickfix List", 'c')<CR>


" highlight yanked region.
augroup LuaHighlight
  autocmd!
  autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank("IncSearch", 2000)
augroup END


" ==============================================================
" --- Colorscheme ---
" ==============================================================
set background=dark
colorscheme palenight
if (has("termguicolors"))
    set termguicolors
    hi LineNr ctermbg=NONE guibg=NONE
endif


" ==============================================================
" --- Statusline ---
" ==============================================================
let g:lightline = {}
let g:lightline.colorscheme = 'palenight'

let g:lightline.component_expand = {
  \ 'neomake_infos': 'lightline#neomake#infos',
  \ 'neomake_warnings': 'lightline#neomake#warnings',
  \ 'neomake_errors': 'lightline#neomake#errors',
  \ 'neomake_ok': 'lightline#neomake#ok',
\}

let g:lightline.active = { 
  \ 'left': [['mode'],  ['filename', 'modified']],
  \ 'right': [['lineinfo'], ['percent'], ['neomake_warnings', 'neomake_errors', 
  \            'neomake_infos', 'neomake_ok']],
\}

let g:lightline.component_type = {
  \ 'neomake_warnings': 'warning',
  \ 'neomake_errors': 'error',
  \ 'neomake_ok': 'left',
\}

" set statusline=
" set statusline+=%#LCursor#
" set statusline+=\ %f
" set statusline+=%=
" set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
" set statusline+=\[%{&fileformat}\]
" set statusline+=\ ---
" set statusline+=\ %l:%c
" set statusline+=\ %p%%


" ==============================================================
" --- fzf ---
" ==============================================================
let g:fzf_layout = { 'window': {
            \ 'width': 0.9,
            \ 'height': 0.5,
            \ 'highlight': 'Comment',
            \ 'rounded': v:true } }
command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

" mappings
nnoremap <silent> <Leader>f :Files<CR>
nnoremap <silent> <Leader>g :GFiles<CR>
nnoremap <silent> <Leader>b :Buffers<CR>
nnoremap <Leader>h :History<CR>
nnoremap <Leader>rg :Rg<Space>
nnoremap <Leader>m :Marks<Space><CR>
" searches word under the cursor.
noremap <Leader>d :exe ':Ag ' . expand('<cword>')<CR>

let g:fzf_colors = {'bg+': ['bg', 'Normal']}

" command history
let g:fzf_history_dir = '~/.local/share/fzf-history'
autocmd! FileType fzf tnoremap <buffer> <esc> <c-c>


" ==============================================================
" --- Undo tree ---
" ==============================================================
" undo tree
let g:undotree_HighlightChangedWithSign = 0
let g:undotree_WindowLayout             = 4
let g:undotree_SetFocusWhenToggle       = 1
nnoremap <Leader>u :UndotreeToggle<CR>


" ==============================================================
" --- Workspaces ---
" ==============================================================
nnoremap <leader>t :ToggleWorkspace<CR>
let g:workspace_persist_undo_history = 1  " enabled = 1 (default), disabled = 0
let g:workspace_undodir='.undodir'


" ==============================================================
" --- Better Brackets ---
" ==============================================================
let g:rainbow_active = 1
let g:pear_tree_smart_openers = 1
let g:pear_tree_smart_closers = 1
let g:pear_tree_smart_backspace = 1


" ==============================================================
" --- File Explorer ---
" ==============================================================
let g:lua_tree_side = 'right' "left by default
let g:lua_tree_width = 40 "30 by default
let g:lua_tree_ignore = [ '.git', 'node_modules', '.cache' ] "empty by default
let g:lua_tree_auto_open = 0 "0 by default, opens the tree when typing `vim $DIR` or `vim`
let g:lua_tree_auto_close = 1 "0 by default, closes the tree when it's the last window
let g:lua_tree_follow = 1 "0 by default, this option allows the cursor to be updated when entering a buffer
let g:lua_tree_indent_markers = 1 "0 by default, this option shows indent markers when folders are open
let g:lua_tree_hide_dotfiles = 1 "0 by default, this option hides files and folders starting with a dot `.`
let g:lua_tree_git_hl = 1 "0 by default, will enable file highlight for git attributes (can be used without the icons).
let g:lua_tree_root_folder_modifier = ':~' "This is the default. See :help filename-modifiers for more options
let g:lua_tree_tab_open = 1 "0 by default, will open the tree when entering a new tab and the tree was previously open
let g:lua_tree_show_icons = {
    \ 'git': 1,
    \ 'folders': 1,
    \ 'files': 1,
    \}

nnoremap <Leader>n :LuaTreeToggle<CR>
nnoremap <leader>r :LuaTreeRefresh<CR>


" ==============================================================
" --- Which key ---
" ==============================================================
nnoremap <silent> <leader> :WhichKey ','<CR>
nnoremap <silent> <Localleader> :WhichKey '\'<CR>


" ==============================================================
" --- General Python ---
" ==============================================================
let python_highlight_all=1
let g:python3_host_prog=expand('~/anaconda3/envs/neovim/bin/python3.8')
autocmd FileType python setlocal indentkeys-=<:>
autocmd FileType python setlocal indentkeys-=:


" ==============================================================
" --- Linting/fixing ---
" ==============================================================
let g:neomake_python_flake8_maker = {
    \ 'args': ['--ignore=E501,W503,E402,E116,E203,W391,E741'],
    \}
let g:neomake_python_enabled_makers = ['flake8']
call neomake#configure#automake('nrwi', 250)

autocmd BufWritePre *.py execute ':Black'
let g:black_linelength = 100


" ==============================================================
" --- Slime ---
" ==============================================================
let g:slime_target = "tmux"
" let g:slime_default_config = {"socket_name": "default", "target_pane": "2"}
let g:slime_default_config = {"socket_name": get(split($TMUX, ","), 0), "target_pane": ":.2"}
let g:slime_paste_file = "$HOME/.slime_paste"
let g:slime_python_ipython = 1
let g:slime_no_mappings = 1
let g:slime_cell_delimiter = "# %%"

" --- ipython cell settings
command EscapeTmux execute "!tmux send-keys -t 2 Escape BSpace"
xmap <c-c> <Plug>SlimeRegionSend \| gv \|<Esc>
nmap <c-c> <Plug>SlimeParagraphSend
nmap <Leader>a :EscapeTmux<CR> \| :%SlimeSend<cr>
" map <Leader>s to start IPython
nnoremap <Leader>i :EscapeTmux<CR> \| :SlimeSend1 ipython --matplotlib<CR>
" map <Leader>Q to restart ipython
nnoremap <Leader>I :EscapeTmux<CR> \| :IPythonCellRestart<CR>
" map <F5> to save and run script
" nnoremap <F5> :IPythonCellRun<CR>
nnorema <F5> :EscapeTmux<CR> \| :exe "!tmux send -t 2 '\\%run -t " . expand("%") . "' Enter "<CR>
" map <Leader>c to execute the current cell
nmap <leader>s :EscapeTmux<CR> \| <Plug>SlimeSendCell
" map <Leader>C to execute the current cell and jump to the next cell
nnoremap <Leader>S :EscapeTmux<CR> \| :IPythonCellExecuteCellJump<CR>
" map <Leader>l to clear IPython screen
" nnoremap <Leader>0 :EscapeTmux<CR> \| :IPythonCellClear<CR>
" map [c and ]c to jump to the previous and next cell header
nnoremap [c :IPythonCellPrevCell<CR>
nnoremap ]c :IPythonCellNextCell<CR>
" map <Leader>p to run the previous command
nnoremap <Leader>p :IPythonCellPrevCommand<CR>
" map <Leader>d to start debug mode
nnoremap <F6> :EscapeTmux<CR> \| :SlimeSend1 %debug<CR>
" map <Leader>q to exit debug mode or IPython
nnoremap <Leader>q :EscapeTmux<CR> \| :SlimeSend1 exit<CR>


" ==============================================================
" --- Substitution/Yank history ---
" ==============================================================
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
let g:yoinkIncludeDeleteOperations = 1
let g:yoinkSyncSystemClipboardOnFocus = 1

nnoremap <silent> <Leader>y  :Yanks<CR>


" ==============================================================
" --- Vista ---
" ==============================================================
let g:vista_default_executive = 'nvim_lsp'
" let g:vista_ignore_kinds = ["Variable"]
autocmd FileType python nnoremap <buffer> <silent> <Leader>v :Vista finder<CR>


" ==============================================================
" --- LSP Settings ---
" ==============================================================
lua require 'lsp'

" --- LSP Completion ---
" ==============================================================
autocmd BufEnter * lua require'completion'.on_attach()

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

" tab as completion trigger
function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction
inoremap <silent><expr> <TAB>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ completion#trigger_completion()

" more robust enter confirmation
let g:completion_confirm_key = ""
imap <expr> <cr>  pumvisible() ? complete_info()["selected"] != "-1" ?
                 \ "\<Plug>(completion_confirm_completion)"  : "\<c-e>\<CR>" :  "\<CR>"

let g:completion_auto_change_source = 1
let g:completion_matching_strategy_list = ['exact', 'fuzzy', 'substring', 'all']

" Chain completion list
let g:completion_chain_complete_list = {
            \ 'default' : {
            \   'default': [
            \       {'complete_items': ['lsp', 'snippet']},
            \       {'mode': '<c-p>'},
            \       {'mode': '<c-n>'}],
            \   'comment': [],
            \   'string' : [{'complete_items': ['path']}]}}

" snippet support
let g:completion_enable_snippet = 'UltiSnips'
let g:UltiSnipsExpandTrigger = '<c-j>'

" ignore case when completing
let g:completion_matching_ignore_case = 1

" --- LSP Diagnostics ---
" ==============================================================
" delay when inserting text
let g:diagnostic_insert_delay = 1
" function! OpenErrors()
"     :OpenDiagnostic
"     :wincmd p  " leave focus on quickfix list
"     botright cwindow
" endfunction
" nnoremap <leader>e :call OpenErrors()<CR>
let g:diagnostic_enable_virtual_text = 1


" ==============================================================
" --- TreeSitter ---
" ==============================================================
set foldmethod=expr
set foldlevel=99
set foldexpr=nvim_treesitter#foldexpr()
nnoremap <Leader>rt :write \| edit \| TSBufEnable highlight<CR>
lua require 'treesitter'


" ==============================================================
" --- Latex ---
" ==============================================================
" let g:vimtex_view_method = 'zathura'
" let g:vimtex_compiler_progname = 'nvr'
" let g:tex_flavor = "latex"
augroup VimCompletesMeTex
   autocmd!
   autocmd FileType tex
       \ let b:vcm_omni_pattern = g:vimtex#re#neocomplete
augroup END
if has('mac')
    let g:vimtex_view_method = 'skim'
elseif has('win32')
    let g:vimtex_view_method = 'sumatrapdf'
    let g:vimtex_view_general_options = '-reuse-instance @pdf'
    let g:vimtex_view_general_options_latexmk = '-reuse-instance'
elseif has('unix')
    let g:vimtex_view_method = 'zathura'
endif
let g:vimtex_compiler_progname = 'nvr'
let g:tex_flavor = "latex"
let g:tex_stylish = 1
let g:tex_conceal = ''
let g:tex_isk='48-57,a-z,A-Z,192-255,:'
" let g:vimtex_fold_enabled = 1
" let g:vimtex_fold_types = {
      " \ 'markers' : {'enabled': 0},
      " \ 'sections' : {'parse_levels': 1},
      " \}
" let g:vimtex_format_enabled = 1
" let g:vimtex_view_automatic = 1
" let g:vimtex_toc_config = {
      " \ 'split_pos' : 'left',
      " \ 'mode' : 2,
      " \ 'fold_enable' : 1,
      " \ 'hotkeys_enabled' : 1,
      " \ 'hotkeys_leader' : '',
      " \ 'refresh_always' : 0,
      " \}
let g:vimtex_quickfix_open_on_warning = 0
let g:vimtex_quickfix_autoclose_after_keystrokes = 3
let g:vimtex_imaps_enabled = 1
let g:vimtex_complete_img_use_tail = 1
let g:vimtex_complete_bib = {
      \ 'simple' : 1,
      \ 'menu_fmt' : '@year, @author_short, @title',
      \}
" let g:vimtex_echo_verbose_input = 0
