(module dotfiles.module.plugin.lexima
  {require {nvim aniseed.nvim}})

(set nvim.g.lexima_enable_basic_rules 1)
(set nvim.g.lexima_enable_newline_rules 1)

;; Automatically add closing angle brackets (for generic functions, for example)
(nvim.fn.lexima#add_rule {:char "<" :at "\\w\\%#" :input_after ">"})
(nvim.fn.lexima#add_rule {:char ">" :at "<\\%#>" :leave 1})
(nvim.fn.lexima#add_rule {:char "<BS>" :at "<\\%#>" :delete 1})
