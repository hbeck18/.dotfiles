" Specify a directory for plugins:
call plug#begin('~/.config/nvim/plugged')

" Syntax highlighting
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins', 'for': ['python']}

" color scheme
Plug 'drewtempelmeyer/palenight.vim'

" status bar at bottom
Plug 'itchyny/lightline.vim'

" coc
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'psf/black'

" vista
Plug 'liuchengxu/vista.vim', { 'for': ['python']}

" better comments
Plug 'preservim/nerdcommenter'

" fuzzy search
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" auto brackets
Plug 'tmsvg/pear-tree'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'junegunn/rainbow_parentheses.vim'

" Indent line
Plug 'Yggdroot/indentLine', { 'for': ['python']}

" tmux integration
Plug 'christoomey/vim-tmux-navigator'

" git 
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

" Better yanking/substition
Plug 'svermeulen/vim-subversive'
Plug 'svermeulen/vim-yoink'

" easy motion
Plug 'easymotion/vim-easymotion'

" linting
Plug 'dense-analysis/ale', { 'for': ['python']}
Plug 'maximbaz/lightline-ale', { 'for': ['python']}

" undo tree
Plug 'mbbill/undotree'

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
" nnoremap <CR> o<Esc>
nnoremap <Leader>rf :checkt<CR>


" ===============================================
" --- Statusline ---
" ===============================================
" ===============================================

function! LightlineMode()
  return &filetype ==# 'vista' ? 'VISTA' :
        \ &filetype ==# 'fzf' ? 'FZF' :
        \ lightline#mode()
endfunction
function! NearestMethodOrFunction() abort
  return get(b:, 'vista_nearest_method_or_function', '')
endfunction
let g:lightline#ale#indicator_checking = "\uf110"
let g:lightline#ale#indicator_infos = "\uf129"
let g:lightline#ale#indicator_warnings = "\uf071"
let g:lightline#ale#indicator_errors = "\uf05e"
let g:lightline#ale#indicator_ok = "\uf00c"

let g:lightline = {}
let g:lightline.colorscheme = 'palenight'
let g:lightline.component_expand = {
      \  'linter_checking': 'lightline#ale#checking',
      \  'linter_infos': 'lightline#ale#infos',
      \  'linter_warnings': 'lightline#ale#warnings',
      \  'linter_errors': 'lightline#ale#errors',
      \  'linter_ok': 'lightline#ale#ok',
      \ }
let g:lightline.component_function = {
    \ 'cocstatus': 'coc#status',
    \ 'mode': 'LightlineMode',
    \ 'method': 'NearestMethodOrFunction',
    \ }
let g:lightline.component_type = {
      \     'linter_checking': 'right',
      \     'linter_infos': 'right',
      \     'linter_warnings': 'warning',
      \     'linter_errors': 'error',
      \     'linter_ok': 'right',
      \ }
let g:lightline.active = { 
    \ 'left': [ [ 'mode' ], 
    \          ['cocstatus', 'method', 'filename', 'modified' ] ],
    \ 'right': [ [ 'lineinfo' ], 
    \            [ 'percent' ], 
    \            [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_infos', 'linter_ok' ] ]
    \ }
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


" --- Pear Tree

let g:pear_tree_smart_openers = 1
let g:pear_tree_smart_closers = 1
let g:pear_tree_smart_backspace = 1

" --- Rainbow brackets ---
"  -----
"  -----
let g:rainbow#max_level = 16
let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['{', '}']]
autocmd FileType * RainbowParentheses


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









" ============================================
" --- Latex ---
" ============================================
" ============================================
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
" let g:vimtex_echo_verbose_input = 0









" =====================================
" --- Markdown ---
" =====================================
" =====================================

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


" voom settings
let g:voom_default_mode = "pandoc"
let g:voom_tree_placement = "top"








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






" ==========================================
" --- coc config ---
" ==========================================
" ==========================================
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

" Introduce function text object
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')
" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

let g:coc_global_extensions = [
	  \ 'coc-jedi',
      \ 'coc-vimtex',
      \ 'coc-json',
      \ 'coc-yaml',
      \ 'coc-yank',
      \ 'coc-explorer',
      \ 'coc-snippets',
      \ 'coc-sh',
      \ 'coc-diagnostic'
      \]
      " \ 'coc-pyright',
      " \ 'coc-python',
      " \ 'coc-jedi',

" =============== coc yank ============================
nnoremap <silent> <Leader>y  :<C-u>CocList -A --normal yank<cr>


" =============== coc explorer ============================
autocmd BufEnter * if (winnr("$") == 1 && &filetype == 'coc-explorer') | q | endif
nmap <Leader>n :CocCommand explorer<CR>
nmap <space>ef :CocCommand explorer --preset floating<CR>





" ===================== coc snippets ============================
" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)
" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)
" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'
" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'
" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)" Snippets
" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)
" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)
" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'
" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'
" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
let g:coc_snippet_next = '<tab>'



" Vista ================================
let g:vista_default_executive = 'ctags'
let g:vista_executive_for = {
  \ 'python': 'coc',
  \ }
" To enable fzf's preview window set g:vista_fzf_preview.
" The elements of g:vista_fzf_preview will be passed as arguments to fzf#vim#with_preview()
let g:vista_fzf_preview = ['right:50%']
let g:vista#renderer#enable_icon = 1
let g:vista#renderer#icons = {
\   "function": "\uf794",
\   "variable": "\uf71b",
\  }
" key mapping.
nnoremap <Leader>v :Vista coc<CR>







" ================================
" --- Python ---
" ================================
" ================================
let python_highlight_all=1
let g:python3_host_prog=expand('~/anaconda3/envs/neovim/bin/python3.8')
autocmd FileType python setlocal indentkeys-=<:>
autocmd FileType python setlocal indentkeys-=:
autocmd BufWritePre *.py execute ':Black'

" indentLine
let g:indentLine_first_char = '|'
let g:indentLine_char = '|'
let g:indentLine_showFirstIndentLevel = 1
let g:indentLine_faster     = 1

" linting
let g:ale_linters = {
\   'python': ['flake8', 'mypy'],
\}
let g:ale_python_flake8_options = '--ignore=E501,W503,E402,E116,E203,W391'

" function! LinterStatus() abort
    " let l:counts = ale#statusline#Count(bufnr(''))
    " let l:all_errors = l:counts.error + l:counts.style_error
    " let l:all_non_errors = l:counts.total - l:all_errors
    " return l:counts.total == 0 ? 'OK' : printf(
        " \   '%d? %d? ',
        " \   all_non_errors,
        " \   all_errors
        " \)
" endfunction
" set statusline+=%=
" set statusline+=\ %{LinterStatus()}





" =============================================
" --- fzf -------------------------------------
" =============================================
" =============================================
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
                \ 'width': 0.8,
                \ 'height': 0.6,
                \ 'highlight': 'Comment',
                \ 'rounded': v:true } }
else
    let g:fzf_layout = { "window": "silent botright 16split enew" }
endif
" fzf file fuzzy search that respects .gitignore
" If in git directory, show only files that are committed, staged, or unstaged
" else use regular :Files
nnoremap <expr> <Leader>F (len(system('git rev-parse')) ? ':Files' : ':GFiles --exclude-standard --others --cached')."\<cr>"





map <silent><Leader>G :call setbufvar(winbufnr(popup_atcursor(systemlist("cd " . shellescape(fnamemodify(resolve(expand('%:p')), ":h")) . " && git log --no-merges -n 1 -L " . shellescape(line("v") . "," . line(".") . ":" . resolve(expand("%:p")))), { "padding": [1,1,1,1], "pos": "botleft", "wrap": 0 })), "&filetype", "git")<CR>
