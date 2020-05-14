(module dotfiles.module.after.syntax
  {require {nvim aniseed.nvim
            u    dotfiles.util}})
;; Custom syntax rules

;; Add aniseed macros to fennel symbol highlighting
(each [_ sym (ipairs [:defn :def :defn- :module])]
  (u.autocmd :Syntax :fennel :syn :keyword :FennelSpecialForm sym))

;; Make line number colour less bright
(nvim.ex.highlight :LineNr :ctermfg=grey)
