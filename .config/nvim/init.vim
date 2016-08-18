runtime! debian.vim

set t_Co=256
set background=light

" This color scheme is great for dark backgrounds
colorscheme desert
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

" enable python omnicomplete
"autocmd FileType python set omnifunc=pythoncomplete#Complete
"let g:SuperTabDefaultCompletionType = "context"

set completeopt=menuone,longest,preview

" Enable pylint checking (requires pylint.vim plugin in ~/.vim/compiler/
" By default, this opens a 'Quick Fix' window  with pylint violations every time the buffer is written
"autocmd FileType python compiler pylint

" highlight lines over 120 characters
"highlight OverLength ctermbg=red ctermfg=white guibg=#592929
"match OverLength /\%>121v.\+/

" Removes whitespace before saving
autocmd BufWritePre * :%s/\s\+$//e

" Removes whitespace at EOF
autocmd BufWritePre *.py :%s/\($\n\s*\)\+\%$//e

" F3 will automatically open the corresponding unit test module
nmap <F3> :VipyutVSplit<cr>
" don't run pylint on write
" let g:pylint_onwrite = 0

" F4 will automatically run pylint
" nmap <F4> :Pylint<CR>

map <F5> :mksession! ~/.vim_session <cr> " Quick write session with F5
map <F6> :source ~/.vim_session <cr>     " And load session with F6

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

" How do I do this!
":PyProj ~/.chimera.vim
"

" status line
set laststatus=2
set title
set statusline=%{fugitive#statusline()}\ %<%f%h%m%r%=%-14.(%l,%c%V%)\ %P


" python-mode
let g:pymode_paths = ['$HOME/git/chimera/', '.']
let g:pymode_doc = 1
let g:pymode_rope = 1
let g:pymode_motion = 1
let g:pymode_rope_auto_project = 1
let g:pymode_lint = 1
let g:pymode_lint_checker = "pylint,pep8,pyflakes"
let g:pymode_lint_config = "$HOME/.pylintrc"
let g:pymode_lint_write = 1
let g:pymode_lint_cwindow = 1
let g:pymode_lint_message = 1
let g:pymode_lint_signs = 1
let g:pymode_virtualenv = 1
let g:pymode_syntax_all = 1
let g:pymode_utils_whitespace = 1


let g:syntastic_python_checkers=['flake8', 'pep257']
let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_loc_list=1
let g:syntastic_aggregate_errors=1

let g:vipyut_openOutputOnFail=1
let g:vipyut_openQuickFix=0

let g:ropevim_goto_def_newwin=1

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

let g:rut_projects = [{
      \'pattern': '/vats$',
      \'test_dir': 'tests',
      \'source2unit': ['\v.*/vats/(.*)/([^/]*)', '\1/test_\2'],
      \'unit2source': ['\v.*/tests/(.*)/test_([^/]*)', 'vats/\1/\2'],
      \'runner': 'nosetests',
      \'errorformat': '%C %.%#,%A  File "%f"\, line %l%.%#,%Z%[%^ ]%\@=%m',
\}]

let g:rut_async = 1

" word wrap
" set wrap
" set textwidth=79

"set colorcolumn=80

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
