(module dotfiles.module.plugin.octo
  {require {nvim aniseed.nvim
            telescope telescope}})

;; Use Telescope interface for octo pickers)
(telescope.load_extension :octo)
