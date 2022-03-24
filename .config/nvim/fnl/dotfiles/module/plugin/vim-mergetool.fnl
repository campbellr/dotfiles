(module dotfiles.module.plugin.vim-mergetool
  {require {nvim aniseed.nvim}})

(set nvim.g.mergetool_layout :bmr)
(set nvim.g.mergetool_prefer_revision :local)
