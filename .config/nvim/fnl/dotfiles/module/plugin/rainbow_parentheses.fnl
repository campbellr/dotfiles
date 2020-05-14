(module dotfiles.module.plugin.rainbow_parentheses
  {require {nvim aniseed.nvim
            u    dotfiles.util}})

(set nvim.g.rainbow#pairs [["(" ")"] ["[" "]"] ["{" "}"]])

;; Use rainbow parentheses for all file types
(u.augroup! :rainbow-all
  #(nvim.ex.autocmd :Filetype :* :RainbowParentheses))
