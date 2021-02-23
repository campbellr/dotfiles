
if !exists('g:vscode')

  " vim-plug initialization
  call plug#begin(stdpath('data') . '/plugged')

  Plug 'Olical/aniseed', { 'tag': 'v3.11.0' }
  " For Fennel highlighting (based on Clojure).
  Plug 'bakpakin/fennel.vim'
  Plug 'bakpakin/janet.vim'
  Plug 'norcalli/nvim.lua'
  Plug 'Olical/conjure'
  Plug 'liuchengxu/vim-better-default'
  " async syntax linter and fixer
  "Plug 'dense-analysis/ale'
  " FIXME: switch back to official repo if/when this branch gets merged
  Plug 'liquidz/ale', {'branch': 'feature/clj_kondo_config'}
  Plug 'benizi/vim-automkdir'
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
  " syntax highlighting and stuff for Git
  Plug 'tpope/vim-git'
  " The best git wrapper of all time
  Plug 'tpope/vim-fugitive'
  " Github extention for fugitive.vim
  Plug 'tpope/vim-rhubarb'
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
  Plug 'Shougo/echodoc.vim'
  Plug 'morhetz/gruvbox'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'thaerkh/vim-indentguides'
  " racket
  Plug 'wlangstroth/vim-racket'
  Plug 'vim-scripts/scribble.vim'
  Plug 'guns/vim-sexp', { 'for': ['clojure', 'scheme', 'lisp', 'fennel', 'janet']}
  Plug 'tpope/vim-sexp-mappings-for-regular-people', { 'for': ['clojure', 'scheme', 'lisp', 'fennel', 'janet']}
  Plug 'tpope/vim-repeat'

  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  " A faster parinfer implementation in rust
  Plug 'eraserhd/parinfer-rust', {'do': 'cargo build --release'}
  " Adds neovim :terminal support to vim-dispatch
  Plug 'radenling/vim-dispatch-neovim'
  " highlight the current word under the cursor
  "Plug 'itchyny/vim-cursorword'
  Plug 'RRethy/vim-illuminate'
  Plug 'pearofducks/ansible-vim'

  Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

  Plug 'nvim-treesitter/nvim-treesitter'
  Plug 'neovim/nvim-lspconfig'
  Plug 'nvim-lua/completion-nvim'

  Plug 'rbong/vim-flog'

  Plug 'chr4/nginx.vim'

  Plug 'hashivim/vim-terraform'
  Plug 'godlygeek/tabular'

  Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }

  Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'

  Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }

  call plug#end()

  lua require('aniseed.env').init()


  " FIXME: i can't seem to get this working from lua/fennel (nvim_set_keymap)
  inoremap <silent> <expr> <TAB>
    \ pumvisible() ? "\<C-n>" :
    \ IsPrevSpace() ? "\<TAB>" :
    \ deoplete#manual_complete()

endif

if exists('g:started_by_firenvim')
  set guifont=FiraCode:h20

  let g:dont_write = v:false
  function! My_Write(timer) abort
    let g:dont_write = v:false
    write
  endfunction

  function! Delay_My_Write() abort
    if g:dont_write
      return
    end
    let g:dont_write = v:true
    call timer_start(5000, 'My_Write')
  endfunction

  " Automatically sync all writes to the textarea (instead of needing to save
  " with :w
  augroup firenvim
    au!
    au TextChanged * ++nested call Delay_My_Write()
    au TextChangedI * ++nested call Delay_My_Write()
  augroup END

endif

au filetype markdown setlocal textwidth=80
