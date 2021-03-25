(module dotfiles.module.typescript
  {require {nvim aniseed.nvim
            u    dotfiles.util}
   require-macros [dotfiles.macros]})

(augroup
  typescript
  (autocmd :BufReadPost "*.tsx" ":set filetype=typescriptreact"))
