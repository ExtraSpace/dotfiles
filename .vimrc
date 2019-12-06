so ~/.vim/plugins.vim
colorscheme gruvbox

" Copy and paste to system clipboard
vnoremap <D-c> "+y
map <D-v> "+P

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Enable Hybrid Line Number  by default
set number relativenumber

" Settings for markdown for folding
let g:vim_markdown_folding_level = 6
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_toml_frontmatter = 1
let g:vim_markdown_new_item_indent = 2

" Fold frontmatter in Rmarkdown file
let g:pandoc#folding#fold_yaml = 1

" Fold R-scripts files
let r_syntax_folding = 1

" Color name (:help cterm-colors) or ANSI code
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240

" Color name (:help gui-colors) or RGB color
let g:limelight_conceal_guifg = 'DarkGray'
let g:limelight_conceal_guifg = '#777777'

" Default: 0.5
let g:limelight_default_coefficient = 0.7

" Number of preceding/following paragraphs to include (default: 0)
let g:limelight_paragraph_span = 1

" Beginning/end of paragraph
"   When there's no empty line between the paragraphs
"   and each paragraph starts with indentation
let g:limelight_bop = '^\s'
let g:limelight_eop = '\ze\n^\s'

" Highlighting priority (default: 10)
"   Set it to -1 not to overrule hlsearch
let g:limelight_priority = -1

" Change the leader key to ,
let mapleader = ","

set guifont=Source\ Code\ Pro:h16

" REPL Settings
nnoremap <leader>R :REPLToggle<Cr>
autocmd Filetype python nnoremap <C-F12> <Esc>:REPLDebugStopAtCurrentLine<Cr>
autocmd Filetype python nnoremap <C-F10> <Esc>:REPLPDBN<Cr>
autocmd Filetype python nnoremap <C-F11> <Esc>:REPLPDBS<Cr>
let g:repl_program = {
		\ 'python': 'ipython',
		\ 'default': 'zsh',
		\ 'r': 'R',
		\ 'vim': 'vim -e'}
let g:repl_console_name = 'RimalayaREPL'

" Customize Nerd Tree
" Automatically Open
autocmd VimEnter *  NERDTree
autocmd VimEnter * wincmd p
nnoremap <Leader>f :NERDTreeToggle<Enter>
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
 
" Formatters
au FileType javascript setlocal formatprg=prettier
au FileType javascript.jsx setlocal formatprg=prettier
au FileType typescript setlocal formatprg=prettier\ --parser\ typescript
au FileType html setlocal formatprg=js-beautify\ --type\ html
au FileType scss setlocal formatprg=prettier\ --parser\ css
au FileType css setlocal formatprg=prettier\ --parser\ css

nnoremap <F5> mzgggqG`z
