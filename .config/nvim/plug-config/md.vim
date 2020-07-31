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
