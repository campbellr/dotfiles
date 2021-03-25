(module dotfiles.module.plugin.lexima
  {require {nvim aniseed.nvim}
   require-macros [dotfiles.macros]})

(set nvim.g.lexima_enable_basic_rules 1)
(set nvim.g.lexima_enable_newline_rules 1)

;; Automatically add closing angle brackets (for generic functions, for example)
(nvim.fn.lexima#add_rule {:char "<" :at "\\w\\%#" :input_after ">"})
(nvim.fn.lexima#add_rule {:char ">" :at "<\\%#>" :leave 1})
(nvim.fn.lexima#add_rule {:char "<BS>" :at "<\\%#>" :delete 1})

(defn lexima-disable []
  (set nvim.b.lexima_disabled 1))

;; Disable lexima in clojure and other lispy languages where we are already
;; using paredit

(augroup
  :lexima-lisp
  (each [_ ft (ipairs [:clojure :fennel :racket :scheme])]
    (autocmd :FileType ft (viml->fn lexima-disable))))
