(module dotfiles.module.plugin.vim-fugitive
  {require {nvim aniseed.nvim
            u    dotfiles.util}})

(u.nnoremap "<leader>gs" ":Git<CR>")
(u.nnoremap "<leader>gr" ":Git rebase -i<CR>")
