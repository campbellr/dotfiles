(module dotfiles.module.plugin.telescope
  {require {nvim      aniseed.nvim
            u         dotfiles.util
            telescope telescope}})

(telescope.setup
  {:defaults          {:prompt_prefix   " "
                       :selection_caret " "}})

(u.nnoremap :F ":Telescope grep_string<CR>")
(u.nnoremap :<leader>ff ":Telescope find_files<CR>")
(u.nnoremap :<leader>fb ":Telescope buffers<CR>")
(u.nnoremap :<leader>fg ":Telescope live_grep<CR>")
(u.nnoremap :<leader>fgf ":Telescope git_files<CR>")

