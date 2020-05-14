(module dotfiles.git
  {require {nvim aniseed.nvim
            u    dotfiles.util}})
;; Git helpers functions used in other modules

(defn git-commit [msg]
  (nvim.fn.system (.. "git commit -q -m " (u.escape msg))))

(defn git-add [path]
  (nvim.fn.system (.. "git add " (u.escape path))))

(defn git-push [remote ref]
  (nvim.fn.system (.. "git push " remote ref)))

