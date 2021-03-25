(module dotfiles.module.after.core
  {require {nvim aniseed.nvim
            u    dotfiles.util}
   require-macros [dotfiles.macros]})
;; Core neovim configuration.
;;
;; NOTE: these to be here in after/ in order to not get overridden by
;; vim-better-defaults.

(_: colorscheme :gruvbox)

(u.gset :mouse "a")
(u.gset :termguicolors true)
(u.gset :cmdheight 2)
(u.gset :softtabstop 2)
(u.gset :tabstop 2)
(u.gset :shiftwidth 2)
(u.gset :undodir (.. (nvim.fn.stdpath "data") "/undo"))
(u.gset :incsearch false)
(u.gset :completeopt "menuone,noinsert,noselect")
(u.gset :title true)
(u.gset :switchbuf "usetab,newtab")
(u.gset :updatetime 300)

; Make escape work better in :terminal
(u.gset :timeout true)
(u.gset :ttimeoutlen 0)

;; The default vim mode indicator is redundant with airline
(set nvim.o.showmode false)


;; Not sure why i can't set these through the options api...
(_: set :signcolumn=yes)
(_: set :shortmess+=c)
(_: set :norelativenumber)
(_: set :cursorline)


(autocmd :FileType :go ":setlocal shiftwidth=4")
(autocmd :FileType :go ":setlocal tabstop=4")
