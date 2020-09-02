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

" python
let python_highlight_all=1
let g:python3_host_prog=expand('~/anaconda3/envs/neovim/bin/python3.8')
autocmd FileType python setlocal indentkeys-=<:>
autocmd FileType python setlocal indentkeys-=:

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
nnoremap <silent> <Leader>v :Vista finder<CR>



" ==============================================================
" --- LSP Settings ---
" ==============================================================
:lua << EOF
  local nvim_lsp = require('nvim_lsp')
  vim.lsp.set_log_level("debug")

  local on_attach = function(_, bufnr)
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
    require'diagnostic'.on_attach()

    -- Mappings.
    -- local opts = { noremap=true, silent=true }
    -- vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    -- vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
    -- vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
    -- vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wr', '<cmd>lua im.lsp.buf.remove_workspace_folder()<CR>', opts)
    -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wl', '<cmd>lua vim.lsp.buf.list_workspace_folders()<CR>', opts)
    -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    -- vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>e', '<cmd>lua vim.lsp.util.show_line_diagnostics()<CR>', opts)
  end

  local servers = {'jedi_language_server'}
  for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup {
      on_attach = on_attach,
    }
  end
EOF

" mappings
nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> K <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> <C-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> g0 <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> <leader>rn vim.lsp.buf.rename()<CR>

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

" --- diagnostics
" delay when inserting text
let g:diagnostic_insert_delay = 1
function! OpenErrors()
    :OpenDiagnostic
    :wincmd p  " leave focus on quickfix list
    botright cwindow
endfunction
nnoremap <leader>e :call OpenErrors()<CR>
let g:diagnostic_enable_virtual_text = 1




" ==============================================================
" --- Treesitter ---
" ==============================================================
set foldmethod=expr
set foldlevel=99
set foldexpr=nvim_treesitter#foldexpr()
nnoremap <Leader>rt :write \| edit \| TSBufEnable highlight<CR>
lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "python",     -- one of "all", "language", or a list of languages
  highlight = {
    enable = true,              -- false will disable the whole extension
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  },
  refactor = {
    smart_rename = {
      enable = true,
      keymaps = {
        smart_rename = "gr",
      },
    },
    navigation = {
      enable = true,
      keymaps = {
        goto_definition_lsp_fallback = "gd",
      },
    },
  },
  textobjects = {
    move = {
      enable = true,
      goto_next_start = {
        ["]m"] = "@function.outer",
        ["]]"] = "@class.outer",
      },
      goto_next_end = {
        ["]M"] = "@function.outer",
        ["]["] = "@class.outer",
      },
      goto_previous_start = {
        ["[m"] = "@function.outer",
        ["[["] = "@class.outer",
      },
      goto_previous_end = {
        ["[M"] = "@function.outer",
        ["[]"] = "@class.outer",
      },
    },
  },
}
EOF
