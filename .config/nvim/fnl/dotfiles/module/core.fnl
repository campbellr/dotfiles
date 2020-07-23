(module dotfiles.module.core
  {require {nvim aniseed.nvim
            u    dotfiles.util}})

;; NOTE: Most config is now in dotfiles/module/after/core.fnl to
;;       ensure it loads *after* vim-better-defaults

(defn jump-to-last-line []
  (let [last-lineno (nvim.fn.line "'\"")
        max-lineno  (nvim.fn.line "$")]
    (when (and (> last-lineno 1) (<= last-lineno max-lineno))
      (nvim.ex.normal_ "g'\""))))

;; Make Vim jump to the last position when reopening a file
(u.autocmd :BufReadPost :* (u.viml->lua :dotfiles.module.core :jump-to-last-line))

(u.autocmd "BufNewFile,BufRead" "Dockerfile*" "set ft=Dockerfile")
