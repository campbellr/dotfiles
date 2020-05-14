(module dotfiles.module.plugin.ale
  {require {nvim aniseed.nvim}})

(set nvim.g.ale_linters {:clojure [:clj-kondo]})
