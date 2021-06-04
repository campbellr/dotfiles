(module dotfiles.module.diff
  {require {nvim aniseed.nvim}
   require-macros [dotfiles.macros]})

(_: set "diffopt=filler,internal,algorithm:histogram,indent-heuristic")
