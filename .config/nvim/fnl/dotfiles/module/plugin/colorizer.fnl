(module dotfiles.module.plugin.colorizer
  {require {nvim      aniseed.nvim
            colorizer colorizer}
   require-macros [dotfiles.macros]})

(_: set :termguicolors)
(colorizer.setup)
