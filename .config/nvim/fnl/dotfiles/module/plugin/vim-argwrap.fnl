(module dotfiles.module.plugin.vim-argwrap
  {require {nvim aniseed.nvim
            u    dotfiles.util}})

(set nvim.g.argwrap_tail_comma true)
(u.nnoremap "<leader>a" ":ArgWrap<CR>")

