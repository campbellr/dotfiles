(module dotfiles.module.plugin.telescope
  {require {nvim aniseed.nvim
            u    dotfiles.util}})

(u.nnoremap :F ":Telescope grep_string default_text=<cword><CR>")
(u.nnoremap :<leader>f ":Telescope find_files<CR>")
(u.nnoremap :<leader>b ":Telescope buffers<CR>")
(u.nnoremap :<leader>g ":Telescope live_grep<CR>")

