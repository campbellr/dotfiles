(module dotfiles.module.racket
  {require {nvim aniseed.nvim
            u    dotfiles.util}})

(u.augroup! :racket-group
  (fn [] (u.autocmd :BufReadPost "*.rkt,*.rktl" ":set filetype=racket")
         (u.autocmd :FileType :racket ":set lisp")
         (u.autocmd :FileType :racket ":set autoindent")

         (u.autocmd "BufRead,BufNewFile" "*.scrbl" ":set filetype scribble")))

