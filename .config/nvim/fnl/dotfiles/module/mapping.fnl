(module dotfiles.module.mapping
  {require {nvim aniseed.nvim
            u    dotfiles.util}})
;; Generic (no-plugin) mappings
;; Plugin-specific maps go in the individual plugin modules

(defn- remap [from to]
  (u.nnoremap from to)
  (u.inoremap from to))

;; Make Home and End keys work
(remap "<C-a>" "<Home>")
(remap "<C-e>" "<End>")

;; Neovim terminal emulator;: remap "exit mode" to ESC
(u.noremap :t "<Esc>" "<C-\\><C-n>")
