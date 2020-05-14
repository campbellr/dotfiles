(module dotfiles.module.plugin.vim-better-whitespace
  {require {nvim aniseed.nvim}})

(set nvim.g.better_whitespace_enabled true)
(set nvim.g.strip_whitespace_on_save true)
(set nvim.g.strip_whitespace_confirm  false)
(set nvim.g.strip_only_modified_lines  true)
