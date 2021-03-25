(module dotfiles.module.plugin.rainbow_parentheses
  {require {nvim aniseed.nvim
            u    dotfiles.util}
   require-macros [dotfiles.macros]})

(set nvim.g.rainbow#pairs [["(" ")"] ["[" "]"] ["{" "}"]])

;; Use rainbow parentheses for all file types
(augroup :rainbow-all
  (autocmd :Filetype :* :RainbowParentheses))
