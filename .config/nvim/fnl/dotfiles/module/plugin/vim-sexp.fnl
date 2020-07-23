(module dotfiles.module.plugin.vim-sexp
  {require { nvim aniseed.nvim}})

;; Disable insert mode parens matching (messes with parinfer)
(set nvim.g.sexp_enable_insert_mode_mappings false)
(set nvim.g.sexp_filetypes "clojure,scheme,lisp,timl,fennel,janet")
