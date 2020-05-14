(module dotfiles.module.plugin.nvim-miniyank
  {require {nvim aniseed.nvim
            u    dotfiles.util}})

;; fix clipboard=unnamed added newlines
(nvim.set_keymap "" :p (u.plug :miniyank-autoput) {})
(nvim.set_keymap "" :P (u.plug :miniyank-autoPut) {})
