(module dotfiles.module.plugin.deoplete
  {require {nvim aniseed.nvim
            a    aniseed.core
            u    aniseed.nvim.util}})

(set nvim.g.deoplete#enable_at_startup true)

(nvim.fn.deoplete#custom#option
  {:keyword_patterns {:clojure "[\\w!$%&*+/:<=>?@\\^_~\\-\\.#]*"}
   ;; autocompletion is too slow, disable it and only complete on <TAB>
   :auto_complete false})

(defn- matches? [pattern s]
  (>= (nvim.fn.match pattern s) 0))

(defn- prev-char []
  (let [cursor-idx  (nvim.fn.col ".")
        prev-idx    (- cursor-idx 1)
        line        (nvim.fn.getline ".")]
    (line:sub prev-idx prev-idx)))

(defn is-prev-space? []
  (let [c (prev-char)]
    (or (= "" c) (matches? c "\\s"))))

(defn tab-complete []
  "TAB should trigger code completion but only if the previous
  character isn't a space."
  (if (~= (nvim.fn.pumvisible) 0)
    :<C-n>
    (is-prev-space?)
    :<TAB>
    (nvim.fn.deoplete#manual_complete)))

;; viml->lua doesn't as a map expression, so we fall back to fn-bridge
(u.fn-bridge :MaybeTabComplete :dotfiles.module.plugin.deoplete :tab-complete {:return true})
(u.fn-bridge :IsPrevSpace :dotfiles.module.plugin.deoplete :is-prev-space? {:return true})

;; FIXME: can't figure out how to get this to insert the actual key codes instead of the string...
(comment (nvim.set_keymap)
        :i
        :<TAB>
        "MaybeTabComplete()"
        {:silent true :noremap true :expr true})
