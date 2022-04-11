(module dotfiles.module.plugin.lualine
  {require {nvim aniseed.nvim
            lualine lualine}})

(lualine.setup
  {:sections {:lualine_c [:filename (fn [] (nvim.fn.nvim_treesitter#statusline 90))]}
   :extensions [:fugitive :symbols-outline :quickfix]})

