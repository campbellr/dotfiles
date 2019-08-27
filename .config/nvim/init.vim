runtime! debian.vim

" build helper for vim-markdown composer
function! BuildComposer(info)
  if a:info.status != 'unchanged' || a:info.force
    !cargo build --release
  endif
endfunction

" vim-plug initialization
call plug#begin('~/.local/share/nvim/plugged')

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
" highlight whitespace
Plug 'ntpeters/vim-better-whitespace'
" show changed lines in the gutter
Plug 'airblade/vim-gitgutter'
" Syntax highlighting for styled-components
Plug 'styled-components/vim-styled-components', { 'for': 'javascript' }
" Rainbow parentheses!
Plug 'junegunn/rainbow_parentheses.vim'
" Jump to any location specified by 2 characters (minimalist easymotion)
" Plug 'justinmk/vim-sneak'
" Vim motions on speed!
Plug 'easymotion/vim-easymotion'
" Coverage reporting for vim
Plug 'ruanyl/coverage.vim', { 'for': 'javascript' }
" A test plugin
Plug 'janko-m/vim-test'
" tmux-style window zooming
Plug 'dhruvasagar/vim-zoom'

Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'

Plug 'skywind3000/asyncrun.vim'

" Pony-lang
Plug 'jakwings/vim-pony'
" Bitbucket support for :Gbrowse
Plug 'tommcdo/vim-fubitive'

" workaround for https://github.com/neovim/neovim/issues/1822
Plug 'bfredl/nvim-miniyank'

" a note-taking app where searching for a note and creating one are the same operation.
Plug 'https://github.com/Alok/notational-fzf-vim'

" intellisense engine for neovim
Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'Shougo/echodoc.vim'

Plug 'morhetz/gruvbox'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'thaerkh/vim-indentguides'

call plug#end()

" enable syntax coloring if available
if has("syntax")
  syntax on
endif

set t_Co=256
set termguicolors
set background=dark

" This color scheme is great for dark backgrounds
" colorscheme desert256
colorscheme gruvbox

let g:nv_search_paths = ['~/.vimwiki', './docs', 'docs.md' , './notes.md']
let g:nv_use_short_pathnames = 1


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

set cmdheight=2

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

"set completeopt=menuone,longest,preview


" make 'yank' copy to osx system clipboard
set clipboard+=unnamed
" fix clipboard=unnamed added newlines
map p <Plug>(miniyank-autoput)
map P <Plug>(miniyank-autoPut)

" Show line numbers
set number
" underline the line the cursor is on 
" set cursorline

" make line number color less bright
highlight LineNr ctermfg=grey

" fix ugly pink completion windows
" hi Pmenu ctermbg=DarkGrey guibg=DarkGrey


set wildmode=longest:full
set wildmenu
set wildignore=*.o,*.pyc,*~,*.beam

let g:Grep_Default_Options = '-R'


" Probe options
let g:probe_use_wildignore = 1
" let g:probe_mappings = {'accept_tab': '<enter>'}
let g:probe_use_gitignore = 1

"" Folding
set foldmethod=indent
set foldnestmax=2       " don't nest more than 2 folds
set foldlevel=10        " start with all folds open


" status line
set laststatus=2
set title
set statusline=%{fugitive#statusline()}\ %<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P

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
"let test#javascript#jest#options = '--detectOpenHandles'
nnoremap <silent> <leader>tf :TestFile<CR>
nnoremap <silent> <leader>tn :TestNearest<CR>


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




" ------------------- coc.nvim -------------------------------------

" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
" set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

let g:coc_global_extensions = [
  \ 'coc-eslint',
  \ 'coc-html',
  \ 'coc-java',
  \ 'coc-jest',
  \ 'coc-json',
  \ 'coc-marketplace',
  \ 'coc-pairs',
  \ 'coc-prettier',
  \ 'coc-python',
  \ 'coc-sh',
  \ 'coc-tsserver',
  \ 'coc-vimlsp',
  \ 'coc-xml',
  \ 'coc-yaml'
  \ ]

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>ff  <Plug>(coc-format-selected)
nmap <leader>ff  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Use <tab> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <S-TAB> <Plug>(coc-range-select-backword)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>


" Organize imports on save
autocmd FileType java,python autocmd BufWritePre <buffer> :OR

let g:echodoc_enable_at_startup = 1

" Allow arrow up and arrow down to control command-line completion
cnoremap <expr> <up>   pumvisible() ? "<C-p>" : "<up>"
cnoremap <expr> <down> pumvisible() ? "<C-n>" : "<down>"

" Use gruvbox airline theme
let g:airline_theme='gruvbox'

" Show buffers in the tabline if there aren't any real tabs open
" let g:airline#extensions#tabline#enabled = 1

" indent-guides settings
let g:indentguides_ignorelist = ['text']

" better whitespace
let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1
let g:strip_whitespace_confirm=0
