(module dotfiles.module.racket
  {require {nvim aniseed.nvim
            u    dotfiles.util}
   require-macros [dotfiles.macros]})

(augroup
  racket
  (autocmd :BufReadPost "*.rkt,*.rktl" ":set filetype=racket")
  (autocmd :FileType :racket ":set lisp")
  (autocmd :FileType :racket ":set autoindent")
  (autocmd "BufRead,BufNewFile" "*.scrbl" ":set filetype scribble"))

