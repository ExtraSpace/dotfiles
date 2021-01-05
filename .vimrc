so ~/.vim/plugins.vim

" GUI Settings -------------
set guifont=Hack\ 14
set guioptions=-m
set guioptions=-T
set guioptions=-r

" Interface Options ----------
vnoremap <leader>y "+y
map <leader>P "+P
set number relativenumber
set nu rnu
set wildmenu
set cursorline
set mouse=a
set title
set path=+**
set t_Co=256

" Change color Scheme --------
colorscheme gruvbox
set background=dark
let g:gruvbox_italic=1
let g:gruvbox_bold=1
let g:gruvbox_contrast_dark='medium'
let g:gruvbox_contrast_light='hard'

" Change the leader ------------
let mapleader=","

" Indentation Options --------------
set autoindent 
set expandtab 
set smarttab 
set shiftwidth=2 
set softtabstop=2
set tabstop=2 

" Search Options ---------------
set hlsearch
set incsearch
set smartcase

" Rendering Options --------------
set encoding=utf-8
set linebreak
syntax enable
set wrap

" VimGrep bindings -----------
nmap <silent> <C-N> :cn<CR>zv
nmap <silent> <C-P> :cp<CR>zv

" Folding Options ----------
set foldnestmax=3
set foldmethod=indent
set nofoldenable
let javascript_fold=1     " Javascript
let r_syntax_folding=1    " R
let sh_fold_enabled=1     " sh
let g:vim_markdown_folding_level=6
let g:vim_markdown_frontmatter=1
let g:vim_markdown_toml_frontmatter=1
let g:vim_markdown_new_item_indent=2
let g:pandoc#folding#fold_yaml=1

" Powerline status bar ------------
set laststatus=2
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#buffer_nr_show=1
let g:airline#extensions#branch#enabled=1

" Binding for nerdtree ----------
autocmd VimEnter * wincmd p
map <leader>f :NERDTreeToggle<CR>
let NERDTreeMinimalUI=1
let NERDTreeDirArrows=1
autocmd bufenter * if (winnr("$")==1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeIgnore=['node_module*', '\.cache']
nnoremap <silent> <Leader>v :NERDTreeFind<CR>


" Ranger Setup ---------
map <leader>r :Ranger<CR>
let g:NERDTreeHijackNetrw=0
let g:ranger_replace_netrw=1
let g:ranger_map_keys=0
let g:ranger_command_override='ranger --cmd "set show_hidden=true"'

" Emmet redefine in all modes ----------
let g:user_emmet_mode='a'

" Easy Align Setup ---------------
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" REPL Settings ----------------
nnoremap <leader>R :REPLToggle<Cr>
autocmd Filetype python nnoremap <C-F12> <Esc>:REPLDebugStopAtCurrentLine<Cr>
autocmd Filetype python nnoremap <C-F10> <Esc>:REPLPDBN<Cr>
autocmd Filetype python nnoremap <C-F11> <Esc>:REPLPDBS<Cr>
let g:repl_program={
		\ 'python': 'ipython',
		\ 'default': 'tmux',
		\ 'r': 'R',
		\ 'vim': 'vim -e'}
let g:repl_console_name='RimalayaREPL'

" Formatters ---------------
au FileType javascript setlocal formatprg=prettier
au FileType javascript.jsx setlocal formatprg=prettier
au FileType typescript setlocal formatprg=prettier\ --parser\ typescript
au FileType html setlocal formatprg=js-beautify\ --type\ html
au FileType scss setlocal formatprg=prettier\ --parser\ css
au FileType css setlocal formatprg=prettier\ --parser\ css

let g:vim_jsx_pretty_colorful_config=1
let g:vim_jsx_pretty_template_tags=['html', 'jsx']

" Snippet Configuration ---------------------
let g:UltiSnipsSnippetDirectories=["UltiSnips"]
let g:UltiSnipsExpandTrigger="<TAB>"
let g:UltiSnipsJumpForwardTrigger="<C-n>"
let g:UltiSnipsJumpBackwardTrigger="<C-p>"
nnoremap <leader>es :UltiSnipsEdit<CR>

" LaTeX Configuration ----------------------
filetype plugin on
filetype indent on
let g:vimtex_quickfix_mode=0
let g:tex_conceal='abdmg'
set conceallevel=1
hi Conceal ctermbg=none
let g:Tex_DefaultTargetFormat='pdf'
let g:Tex_CompileRule_pdf = 'latexmk -pdf'
let g:TCLevel=4
let g:tex_flavor='latex'
let g:Tex_GotoError=0

" Easily moving between windows --------------
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l
nnoremap <C-H> <C-W>h

" Fuzzy Find Settings --------------
nnoremap <silent> <leader><leader> :Files<CR>
let g:fzf_preview_window='right:60%'
let g:fzf_buffers_jump=1
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'
" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)
" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-l> <plug>(fzf-complete-line)

" Custom shell script ----------------------------
" Rmarkdown build
" map <F5> :!R -e 'rmarkdown::render("%:t")'<CR><CR>

" Build using Makefile
nnoremap <F5> :w <CR> :!make <CR><CR>
map <F6> :w <CR> :!make NAME="%:t"<CR><CR> :!xdg-open "%:t:r.pdf"&<CR><CR>

