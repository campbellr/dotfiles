(module dotfiles.module.sql
  {require {nvim aniseed.nvim}
   require-macros [dotfiles.macros]})

;; TODO: this should really be a filetype plugin or something

(augroup
  sql
  (autocmd :FileType :sql ":set tabstop=4")
  (autocmd :FileType :sql ":set softtabstop=4")
  (autocmd :FileType :sql ":set shiftwidth=4"))
