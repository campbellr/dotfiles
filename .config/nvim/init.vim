" vim-plug initialization
call plug#begin(stdpath('data') . '/plugged')

Plug 'Olical/aniseed', { 'tag': 'v3.2.0' }
" For Fennel highlighting (based on Clojure).
Plug 'bakpakin/fennel.vim'
Plug 'liuchengxu/vim-better-default'
" async syntax linter and fixer
"Plug 'dense-analysis/ale'
" FIXME: switch back to official repo if/when this branch gets merged
Plug 'liquidz/ale', {'branch': 'feature/clj_kondo_config'}

" Go language support for Vim
Plug 'fatih/vim-go', { 'for': 'go', 'do': ':GoInstallBinaries' }
" An industrial strength argument wrapping and unwrapping extension for vim
Plug 'FooSoft/vim-argwrap'
" Vim plugin for fzf, a blazing fast fuzzy file finder written in Go
Plug 'junegunn/fzf', { 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" A vim plugin that provides an easy way to brows the tags of the current file
Plug 'majutsushi/tagbar'
" Render ANSI escape sequences inside vim
Plug 'powerman/vim-plugin-AnsiEsc'
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
" An internal wiki inspired (somewhat) by org-mode
Plug 'vimwiki/vimwiki'
" highlight whitespace
Plug 'ntpeters/vim-better-whitespace'
" show changed lines in the gutter
Plug 'airblade/vim-gitgutter'
" Rainbow parentheses!
Plug 'junegunn/rainbow_parentheses.vim'
" Vim motions on speed!
Plug 'easymotion/vim-easymotion'
" Coverage reporting for vim
Plug 'ruanyl/coverage.vim', { 'for': 'javascript' }
Plug 'skywind3000/asyncrun.vim'
" workaround for https://github.com/neovim/neovim/issues/1822
Plug 'bfredl/nvim-miniyank'
" intellisense engine for neovim
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Temporarily using my fork to work around #1588
Plug 'campbellr/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}
Plug 'Shougo/echodoc.vim'
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'thaerkh/vim-indentguides'
" racket
Plug 'wlangstroth/vim-racket'
Plug 'vim-scripts/scribble.vim'
Plug 'guns/vim-sexp', { 'for': 'clojure'}
Plug 'tpope/vim-sexp-mappings-for-regular-people', { 'for': 'clojure' }
Plug 'tpope/vim-repeat'
Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary!' }

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" A faster parinfer implementation in rust
Plug 'eraserhd/parinfer-rust', {'do': 'cargo build --release'}
" Adds neovim :terminal support to vim-dispatch
Plug 'radenling/vim-dispatch-neovim'
" disable because coc.nvim does the same thing
"Plug 'itchyny/vim-cursorword'

call plug#end()

lua require('aniseed.dotfiles')

let g:vim_better_default_persistent_undo = 1
let g:vim_better_default_key_mapping = 0

runtime! plugin/default.vim
set norelativenumber


" enable syntax coloring if available
if has("syntax")
  syntax on
endif

colorscheme gruvbox
set termguicolors
set cmdheight=2
set tabstop=2       " Make <TAB> equivalent to 4 space
set expandtab       " Expand <TAB>s to spaces
set shiftwidth=2    " Number of spaces for each indent level
set hlsearch        " highlight search terms
set noincsearch
set completeopt=menuone,longest,preview
" make 'yank' copy to osx system clipboard
set clipboard+=unnamed
set number
set cursorline
set laststatus=2
set title
set statusline=%{fugitive#statusline()}\ %<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P
" why do i have this?
set switchbuf=usetab,newtab
set updatetime=300
set shortmess+=c
set signcolumn=yes


let g:nv_search_paths = ['~/.vimwiki', './docs', 'docs.md' , './notes.md']
let g:nv_use_short_pathnames = 1

if has("autocmd")
    au BufReadPost *.rkt,*.rktl set filetype=racket
    au filetype racket set lisp
    au filetype racket set autoindent
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

au! BufRead,BufNewFile *.scrbl setfiletype scribble

au BufRead,BufNewFile *.wiki set filetype=mediawiki
au BufRead,BufNewFile *.yml,*.yaml set filetype=yaml
"au BufRead,BufNewFile *.tap set filetype=tap

" fix clipboard=unnamed added newlines
map p <Plug>(miniyank-autoput)
map P <Plug>(miniyank-autoPut)


" make line number color less bright
highlight LineNr ctermfg=grey

" display the syntax highlighting groups for the item under the cursor
map <F8> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
            \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
            \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>



if has('nvim')
    " neovim terminal emulator: remap 'exit mode' to ESC
    :tnoremap <Esc> <C-\><C-n>
    " make escape work better
    set timeout
    set ttimeoutlen=0
endif

autocmd! BufWritePost .nvimrc source $MYVIMRC

map <silent> <Leader>ts "=strftime("%Y-%m-%d %I:%M")<CR>P

" Add a colored column indicating when we're over 80 chars
"set colorcolumn=80
" highlight ColorColumn ctermbg=DarkGrey

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

" vim-argwrap
let g:argwrap_tail_comma = 1
nnoremap <silent> <leader>a :ArgWrap<CR>


" only indent these filetypes 2 spaces
autocmd FileType python setlocal shiftwidth=4 tabstop=4

" vimwiki
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
autocmd! BufWritePost ~/.vimwiki/* !cd ~/.vimwiki/; git add "%"; git commit -q -m "Auto commit of %:t." "%"; git push origin HEAD:master

" turn off word wrap in vimwiki
autocmd! BufNewFile,BufRead *.wiki set nowrap


" bind F (for find) to grep word under cursor
" nnoremap <silent> F :Rg <C-R><C-W><CR>
nnoremap <silent> F :Clap grep ++query=<cword><CR>
nnoremap <silent> <leader>f :Clap files<CR>
nnoremap <silent> <leader>b :Clap buffers<CR>
nnoremap <silent> <leader>g :Clap grep<CR>

" ranbow-parens
let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['{', '}']]

augroup rainbow_all
  autocmd!
  autocmd FileType * RainbowParentheses
augroup END

" test.vim options
let test#strategy = 'neovim'
"
nnoremap <silent> <leader>tf :RunTests<CR>
nnoremap <silent> <leader>tn :.RunTests<CR>
nnoremap <silent> <leader>rr :Require<CR>
nnoremap <silent> <leader>rc :Console!<CR>


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


let g:echodoc_enable_at_startup = 1

" Allow arrow up and arrow down to control command-line completion
cnoremap <expr> <up>   pumvisible() ? "<C-p>" : "<up>"
cnoremap <expr> <down> pumvisible() ? "<C-n>" : "<down>"

" Use gruvbox airline theme
let g:airline_theme='gruvbox'

" indent-guides settings
let g:indentguides_ignorelist = ['text']

" better whitespace
let g:better_whitespace_enabled = 1
let g:strip_whitespace_on_save = 1
let g:strip_whitespace_confirm = 0
let g:strip_only_modified_lines = 1

" conjure
let g:conjure_log_direction = "horizontal"

"ale
let g:ale_linters = { 'clojure': ['clj-kondo']}


" Completion stuff

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
"inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
"
"
" Disable insert mode parens matching
let g:sexp_enable_insert_mode_mappings = 0


" Use fzf instead of maple for filtering, fzf is more intuitive (or maybe im
" just used to it...
"let g:clap_default_external_filter = 'fzf'



" Use escape to exit clap floating window instead of <C-c>
au FileType clap_input inoremap <silent> <buffer> <Esc> <Esc>:call clap#handler#exit()<CR>

" For coc.nvim

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
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
if has('patch8.1.168')
  " Use `complete_info` if your (Neo)Vim version supports it.
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>cf  <Plug>(coc-format-selected)
nmap <leader>cf  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Introduce function text object
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for selections ranges.
" NOTE: Requires 'textDocument/selectionRange' support from the language server.
" coc-tsserver, coc-python are the examples of servers that support it.
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings using CoCList:
" Show all diagnostics.
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>0


"nmap <silent> gd <Plug>(coc-definition)
"nmap <leader>u <Plug>(coc-references)


autocmd BufReadCmd,FileReadCmd,SourceCmd jar:file://* call s:LoadClojureContent(expand("<amatch>"))
 function! s:LoadClojureContent(uri)
  setfiletype clojure
  let content = CocRequest('clojure-lsp', 'clojure/dependencyContents', {'uri': a:uri})
  call setline(1, split(content, "\n"))
  setl nomodified
  setl readonly
endfunction



function! Expand(exp) abort
    let l:result = expand(a:exp)
    return l:result ==# '' ? '' : "file://" . l:result
endfunction

" clojure-lsp refactoring commands
nnoremap <silent> crcc :call CocRequest('clojure-lsp', 'workspace/executeCommand', {'command': 'cycle-coll', 'arguments': [Expand('%:p'), line('.') - 1, col('.') - 1]})<CR>
nnoremap <silent> crth :call CocRequest('clojure-lsp', 'workspace/executeCommand', {'command': 'thread-first', 'arguments': [Expand('%:p'), line('.') - 1, col('.') - 1]})<CR>
nnoremap <silent> crtt :call CocRequest('clojure-lsp', 'workspace/executeCommand', {'command': 'thread-last', 'arguments': [Expand('%:p'), line('.') - 1, col('.') - 1]})<CR>
nnoremap <silent> crtf :call CocRequest('clojure-lsp', 'workspace/executeCommand', {'command': 'thread-first-all', 'arguments': [Expand('%:p'), line('.') - 1, col('.') - 1]})<CR>
nnoremap <silent> crtl :call CocRequest('clojure-lsp', 'workspace/executeCommand', {'command': 'thread-last-all', 'arguments': [Expand('%:p'), line('.') - 1, col('.') - 1]})<CR>
nnoremap <silent> cruw :call CocRequest('clojure-lsp', 'workspace/executeCommand', {'command': 'unwind-thread', 'arguments': [Expand('%:p'), line('.') - 1, col('.') - 1]})<CR>
nnoremap <silent> crua :call CocRequest('clojure-lsp', 'workspace/executeCommand', {'command': 'unwind-all', 'arguments': [Expand('%:p'), line('.') - 1, col('.') - 1]})<CR>
nnoremap <silent> crml :call CocRequest('clojure-lsp', 'workspace/executeCommand', {'command': 'move-to-let', 'arguments': [Expand('%:p'), line('.') - 1, col('.') - 1, input('Binding name: ')]})<CR>
nnoremap <silent> cril :call CocRequest('clojure-lsp', 'workspace/executeCommand', {'command': 'introduce-let', 'arguments': [Expand('%:p'), line('.') - 1, col('.') - 1, input('Binding name: ')]})<CR>
nnoremap <silent> crel :call CocRequest('clojure-lsp', 'workspace/executeCommand', {'command': 'expand-let', 'arguments': [Expand('%:p'), line('.') - 1, col('.') - 1]})<CR>
nnoremap <silent> cram :call CocRequest('clojure-lsp', 'workspace/executeCommand', {'command': 'add-missing-libspec', 'arguments': [Expand('%:p'), line('.') - 1, col('.') - 1]})<CR>
nnoremap <silent> crcn :call CocRequest('clojure-lsp', 'workspace/executeCommand', {'command': 'clean-ns', 'arguments': [Expand('%:p'), line('.') - 1, col('.') - 1]})<CR>
nnoremap <silent> cref :call CocRequest('clojure-lsp', 'workspace/executeCommand', {'command': 'extract-function', 'arguments': [Expand('%:p'), line('.') - 1, col('.') - 1, input('Function name: ')]})<CR>

