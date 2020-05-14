(module dotfiles.module.plugin.clap
  {require {nvim aniseed.nvim
            u    dotfiles.util}})

(u.nnoremap :F ":Clap grep ++query=<cword><CR>")
(u.nnoremap :<leader>f ":Clap files<CR>")
(u.nnoremap :<leader>b ":Clap buffers<CR>")
(u.nnoremap :<leader>g ":Clap grep<CR>")


(defn clap-exit-esc []
  (let [opts {:silent true :noremap true}]
     (nvim.buf_set_keymap 0 :i "<Esc>" "<Esc>:call clap#handler#exit()<cr>" opts)))

;; Use escape to exit clap floating window instead of <C-c>)
(u.autocmd :FileType :clap_input (u.viml->lua :dotfiles.module.plugin.clap :clap-exit-esc))
