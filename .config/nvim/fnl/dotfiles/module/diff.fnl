(module dotfiles.module.diff
  {require {nvim aniseed.nvim}
   require-macros [dotfiles.macros]})

(ex set "diffopt=filler,internal,algorithm:histogram,indent-heuristic")
