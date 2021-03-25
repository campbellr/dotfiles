(module dotfiles.module.fennel
  {require {nvim aniseed.nvim
            nu   aniseed.nvim.util
            a    aniseed.core
            u    dotfiles.util}
   require-macros [dotfiles.macros]})

(defn empty-buffer? []
  (-> (nvim.buf_get_lines 0 0 1 false)
      (a.first)
      (= "")))

(def dotfiles-re ".*fnl/dotfiles/")

(defn in-dotfiles? [path]
  (<= 0 (nvim.fn.match path dotfiles-re)))

(defn file->module-name [path]
  (-> path
      (nvim.fn.substitute dotfiles-re "dotfiles/" "")
      (nvim.fn.substitute "/" "." "g")
      (nvim.fn.substitute "\\.fnl" "" "g")))

(defn insert-lines [lines]
  (nvim.buf_set_lines 0 0 0 false lines))

(defn insert-module-def [name]
  (insert-lines [(.. "(module " name)
                 "  {require {nvim aniseed.nvim}})"]))

(defn insert-aniseed-module []
  (let [path (u.expand "%:p")]
    (when (and (empty-buffer?) (in-dotfiles? path))
      (let [mod-name (file->module-name path)]
        (insert-module-def mod-name)))))


;; Automatically insert a (module ...) form for new files in my aniseed dotfiles
(augroup
  aniseed-group
  (autocmd :FileType :fennel (viml->fn insert-aniseed-module)))
