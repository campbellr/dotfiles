(module dotfiles.module.typescript
  {require {nvim aniseed.nvim
            u    dotfiles.util}})

(u.augroup! :typescript
  (fn [] (u.autocmd :BufReadPost "*.tsx" ":set filetype=typescriptreact")))
