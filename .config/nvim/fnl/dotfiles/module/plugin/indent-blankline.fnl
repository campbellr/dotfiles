(module dotfiles.module.plugin.indent-blankline
  {require {nvim aniseed.nvim}})

(set nvim.g.indent_blankline_enabled true)
(set nvim.g.indent_blankline_char "┆")

;; Workaround for https://github.com/lukas-reineke/indent-blankline.nvim/issues/59
(set nvim.wo.colorcolumn "80")
