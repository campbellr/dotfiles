(module dotfiles.module.plugin.better-default
  {require {nvim aniseed.nvim}})

(set nvim.g.vim_better_default_persistent_undo true)
(set nvim.g.vim_better_default_key_mapping false)

(nvim.ex.runtime_ "plugin/default.vim")
