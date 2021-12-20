(module dotfiles.module.plugin.colorizer
  {require {nvim      aniseed.nvim
            colorizer colorizer}
   require-macros [dotfiles.macros]})

(ex set :termguicolors)
(colorizer.setup)
