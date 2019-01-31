runtime! debian.vim

set t_Co=256
set background=dark

" This color scheme is great for dark backgrounds
colorscheme desert256

" build helper for vim-markdown composer
function! BuildComposer(info)
  if a:info.status != 'unchanged' || a:info.force
    !cargo build --release
  endif
endfunction

" vim-plug initialization
call plug#begin('~/.local/share/nvim/plugged')

" Awesome python autocompletion for vim
Plug 'davidhalter/jedi-vim', { 'for': 'python' }
" Fold away lines that don't match a specific search pattern
Plug 'embear/vim-foldsearch'
" A vim interface for taskwarrior
Plug 'farseer90718/vim-taskwarrior',
" Go language support for Vim
Plug 'fatih/vim-go', { 'for': 'go', 'do': ':GoInstallBinaries' }
" An industrial strength argument wrapping and unwrapping extension for vim
Plug 'FooSoft/vim-argwrap'
" Clojure runtime files (mainly for vim-fireplace)
Plug 'guns/vim-clojure-static', { 'for': 'clojure' }
" Vim plugin for fzf, a blazing fast fuzzy file finder written in Go
Plug 'junegunn/fzf', { 'do': './install --all' }
" structured editing of lisp s-expressions
Plug 'kovisoft/paredit', { 'for': ['clojure', 'scheme'] }
" A vim plugin that provides an easy way to brows the tags of the current file
Plug 'majutsushi/tagbar'
" Async grep/ack/ag search that loads matches into the location list
Plug 'mhinz/vim-grepper'
" Syntax highlighting for handlebars-style template files
Plug 'mustache/vim-mustache-handlebars'
" Syntax highlighting for Vue.js components
Plug 'posva/vim-vue'
" Render ANSI escape sequences inside vim
Plug 'powerman/vim-plugin-AnsiEsc'
" Async autocompletion framework for neovim
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Taskwarrior integration for vimwiki
Plug 'tbabej/taskwiki'
" A pure-viml fuzzy file finder that i sometimes contribute to
Plug 'torbiak/probe'
" Asynchronous build and test dispatcher (I don't really use this anymore...)
Plug 'tpope/vim-dispatch'
" A clojure REPL for vim
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
" syntax highlighting and stuff for Git
Plug 'tpope/vim-git'
" The best git wrapper of all time
Plug 'tpope/vim-fugitive'
" Granular project configuration using 'projections'
Plug 'tpope/vim-projectionist'
" Static support for Leiningen and Boot
Plug 'tpope/vim-salve'
" Mappings to easily delete, change and add 'surroundings'
Plug 'tpope/vim-surround'
" Easily create increasing/decreasing numbers of sequences across multiple
" lines via visual mode
Plug 'triglav/vim-visual-increment'
" Live in-browser preview of markdown files
Plug 'euclio/vim-markdown-composer', { 'do': function('BuildComposer') }
" An internal wiki inspired (somewhat) by org-mode
Plug 'vimwiki/vimwiki'
" a Go completion source for deoplete
Plug 'zchee/deoplete-go', { 'for': 'go', 'do': 'make'}
" highlight whitespace
Plug 'ntpeters/vim-better-whitespace'
" show changed lines in the gutter
Plug 'airblade/vim-gitgutter'
" Asynchronous Lint Engine
Plug 'w0rp/ale'
" Syntax highlighting for styled-components
Plug 'styled-components/vim-styled-components', { 'for': 'javascript' }
" Rainbow parentheses!
Plug 'junegunn/rainbow_parentheses.vim'
" Javascript auto-import helper
Plug 'Galooshi/vim-import-js', { 'for': 'javascript' }
" Jump to any location specified by 2 characters (minimalist easymotion)
" Plug 'justinmk/vim-sneak'
" Vim motions on speed!
Plug 'easymotion/vim-easymotion'
" Coverage reporting for vim
Plug 'ruanyl/coverage.vim', { 'for': 'javascript' }
" A test plugin
Plug 'janko-m/vim-test'
Plug 'ludovicchabant/vim-gutentags'
" tmux-style window zooming
Plug 'dhruvasagar/vim-zoom'

" A vim LSP client
"Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'bash install.sh'}
Plug 'skywind3000/asyncrun.vim'

" Pony-lang
Plug 'jakwings/vim-pony'
" Bitbucket support for :Gbrowse
Plug 'tommcdo/vim-fubitive'

" workaround for https://github.com/neovim/neovim/issues/1822
Plug 'bfredl/nvim-miniyank'

call plug#end()


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

" make 'yank' copy to osx system clipboard
set clipboard+=unnamed

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
set statusline=%{fugitive#statusline()}\ %<%f\ %{gutentags#statusline('[',']')}\ %h%m%r%=%-14.(%l,%c%V%)\ %P

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
let g:tagbar_width = 80

" vim-go
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

" only indent these filetypes 2 spaces
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
  \  'maxhi': 1, 'auto_tags': 1, 'syntax': 'markdown', 'ext': '.md' },
  \  ]
let g:vimwiki_global_ext = 0

" insert a timestamp with F3
map <F3> :r! date +"\%Y-\%m-\%d \%H:\%M:\%S"<ESC>0==j
map <F4> :r! date +"\%Y-\%m-\%d"<ESC>0=j

:nmap <Leader>k <Plug>VimwikiDiaryPrevDay
:nmap <Leader>j <Plug>VimwikiDiaryNextDay

" Automatically commit to git repo on write.
autocmd! BufWritePost ~/.vimwiki/* !cd ~/.vimwiki/; git add "%";git commit -q -m "Auto commit of %:t." "%"

" turn off word wrap in vimwiki
autocmd! BufNewFile,BufRead *.wiki set nowrap

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor
endif

" bind F (for find) to grep word under cursor
nnoremap F :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" ALE settings
let g:ale_sign_column_always = 1

let g:ale_fixers = {
\   'javascript': ['prettier'],
\   'python': ['black'],
\}

let g:ale_javascript_prettier_use_local_config = 1
let g:ale_fix_on_save = 1
let g:ale_command_wrapper = 'nice -n5'
let g:ale_lint_delay = 2000


" vim-sneak
let g:sneak#label = 1

" ranbow-parens
let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['{', '}']]

augroup rainbow_all
  autocmd!
  autocmd FileType * RainbowParentheses
augroup END

" coverage.vim options
let g:coverage_json_report_path = 'coverage/coverage-final.json'

" test.vim options
let test#strategy = 'neovim'
let test#javascript#jest#options = '--detectOpenHandles'

" projectionist settings for javascript projects:
let g:projectionist_heuristics = {
      \ "package.json": {
      \   "src/*.js": {
      \     "alternate": "src/{}.test.js",
      \     "type": "source",
      \   },
      \   "src/*.test.js": {
      \     "alternate": "src/{}.js",
      \     "type": "test",
      \   },
      \   "server/*.js": {
      \     "alternate": "server/{}.test.js",
      \     "type": "source",
      \   },
      \   "server/*.test.js": {
      \     "alternate": "server/{}.js",
      \     "type": "test",
      \   },
      \ },
      \ "pom.xml": {
      \   "src/main/java/*.java": {
      \     "alternate": "src/test/java/{}Test.java",
      \     "type": "source",
      \   },
      \   "src/test/java/*Test.java": {
      \     "alternate": "src/main/java/{}.java",
      \     "type": "test",
      \   },
      \ }
\ }


" gutentags
let g:gutentags_exclude_filetypes = ['gitcommit']


" fix clipboard=unnamed added newlines
map p <Plug>(miniyank-autoput)
map P <Plug>(miniyank-autoPut)
