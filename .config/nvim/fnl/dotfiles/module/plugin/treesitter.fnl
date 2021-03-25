(module dotfiles.module.plugin.treesitter
  {require {nvim aniseed.nvim
            ts-config nvim-treesitter.configs}})

(ts-config.setup {:highlight {:enable true}
                  :autotag   {:enable true}})
