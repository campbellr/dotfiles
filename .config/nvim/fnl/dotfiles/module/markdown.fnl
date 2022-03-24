(module dotfiles.module.markdown
  {require {nvim aniseed.nvim}
   require-macros [dotfiles.macros]})

;; Enable folding for markdown
(set nvim.g.markdown_folding 1)

;; Set the default foldlevel really high so everything starts out open
(autocmd :FileType :markdown ":setlocal foldlevel=99")
