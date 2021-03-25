(module dotfiles.module.after.syntax
  {require {nvim aniseed.nvim
            u    dotfiles.util}
   require-macros [dotfiles.macros]})
;; Custom syntax rules

;; Add aniseed macros to fennel symbol highlighting
(each [_ sym (ipairs [:defn :def :defn- :module])]
  (autocmd :Syntax :fennel :syn :keyword :FennelSpecialForm sym))

;; Make line number colour less bright
(_: highlight :LineNr :ctermfg=grey)
