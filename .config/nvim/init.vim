runtime! debian.vim

set t_Co=256
set background=dark

" This color scheme is great for dark backgrounds
colorscheme desert256
" colorscheme solarized

" pathogen load
filetype off
call pathogen#infect()
call pathogen#helptags()

" enable syntax coloring if available
if has("syntax")
  syntax on
endif

" Make Vim jump to the last position when reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Have Vim load indentation rules and plugins
" according to the detected filetype.
if has("autocmd")
  filetype plugin indent on
endif

au BufRead,BufNewFile *.wiki set filetype=mediawiki
au BufRead,BufNewFile *.yml,*.yaml set filetype=yaml
"au BufRead,BufNewFile *.tap set filetype=tap

" persistent undo!
set undodir=~/.config/nvim/undodir
set undofile


set showmatch		" Show matching brackets.
set mouse=a		    " Enable mouse usage (all modes) Much more useful if
                    " xterm_clipboard is compiled in
                    " (it's not if you use vim-tiny, the default debian
                    " version)
set tabstop=4       " Make <TAB> equivalent to 4 space
set expandtab       " Expand <TAB>s to spaces
set autoindent      " Automatically indent code
set shiftwidth=4    " Number of spaces for each indent level
set hlsearch        " highlight search terms
set backspace=indent,eol,start "make backspace work properly

set noincsearch

set completeopt=menuone,longest,preview

" Removes whitespace before saving
autocmd BufWritePre *.py :%s/\s\+$//e
autocmd BufWritePre *.vue :%s/\s\+$//e
autocmd BufWritePre *.js :%s/\s\+$//e

" Removes whitespace at EOF
autocmd BufWritePre *.py :%s/\($\n\s*\)\+\%$//e


set wildmode=longest:full
set wildmenu
set wildignore=*.o,*.pyc,*~,*.beam

let g:Grep_Default_Options = '-R'


" Probe options
let g:probe_use_wildignore = 1
let g:probe_mappings = {'accept_tab': '<enter>'}
let g:probe_use_gitignore = 1

"" Folding
set foldmethod=indent
set foldnestmax=2       " don't nest more than 2 folds
set foldlevel=10        " start with all folds open


" status line
set laststatus=2
set title
set statusline=%{fugitive#statusline()}\ %<%f%h%m%r%=%-14.(%l,%c%V%)\ %P


" display the syntax highlighting groups for the item under the cursor
map <F8> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
            \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
            \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>


set switchbuf=usetab,newtab

if has('nvim')
    " neovim terminal emulator: remap 'exit mode' to ESC
    :tnoremap <Esc> <C-\><C-n>
    " make escape work better
    set timeout
    set ttimeoutlen=0
endif

" deoplete
let g:deoplete#enable_at_startup = 1

" neomake
"let g:neomake_python_enabled_makers = ['flake8', 'pylint']
let g:neomake_python_enabled_makers = ['flake8']
let g:neomake_go_enabled_makers = ['go', 'govet']

autocmd! BufWritePost * Neomake


" word wrap
" set wrap
" set textwidth=79

autocmd! BufWritePost .nvimrc source $MYVIMRC

map <silent> <Leader>ts "=strftime("%Y-%m-%d %I:%M")<CR>P

set colorcolumn=80
highlight ColorColumn ctermbg=DarkGrey

" tagbar
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
    \ }

nmap <F8> :TagbarToggle<CR>

" vim-go
let g:go_oracle_scope="gitlab.spgear.lab.emc.com/dolphin/go-mongo-proxy"
" open test/implementation file in a vsplit instead of the same window
let g:go_alternate_mode = "vsplit"
let g:go_fmt_command = "goimports"
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_term_enabled = 1

au FileType go nmap <Leader>dt <Plug>(go-def-tab)


" Allow saving files as sudo in a non-privledged vim session
cmap w!! w !sudo tee > /dev/null %


" vim-argwrap
let g:argwrap_tail_comma = 1
nnoremap <silent> <leader>a :ArgWrap<CR>

" Support Format-Flowed in email (mutt).
"autocmd FileType mail setlocal fo+=aw tw=72

" deoplete-go
let g:deoplete#sources#go#gocode_binary = '/localhome/campbr9/go/bin/gocode'

" only indent html 2 spaces
autocmd FileType html setlocal shiftwidth=2 tabstop=2
autocmd FileType gohtmltmpl setlocal shiftwidth=2 tabstop=2
autocmd FileType yaml setlocal shiftwidth=2 tabstop=2
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2
autocmd FileType vue.html.javascript.css setlocal shiftwidth=2 tabstop=2


let g:markdown_composer_autostart = 0


" vimwiki
"
let g:vimwiki_list = [
  \ {'path': '~/.vimwiki', 'path_html': '~/public_html/', 
  \  'maxhi': 1, 'auto_tags': 1},
  \ {'path': '~/.vimwiki.md', 'maxhi': 1, 'auto_tags': 1,
  \  'syntax': 'markdown', 'ext': '.wiki.md'}
  \  ]
let g:vimwiki_global_ext = 0

" insert a timestamp with F3
map <F3> :r! date +"\%Y-\%m-\%d \%H:\%M:\%S"<ESC>0==j
map <F4> :r! date +"\%Y-\%m-\%d"<ESC>0=j

" Automatically commit to git repo on write.
autocmd! BufWritePost ~/.vimwiki/* !cd ~/.vimwiki/; git add "%";git commit -q -m "Auto commit of %:t." "%"; git push -q origin

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor
endif

" bind F (for find) to grep word under cursor
nnoremap F :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
