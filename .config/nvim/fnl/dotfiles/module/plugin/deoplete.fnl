(module dotfiles.module.plugin.deoplete
  {require {nvim aniseed.nvim
            a    aniseed.core
            u    aniseed.nvim.util}})

(set nvim.g.deoplete#enable_at_startup true)

(nvim.fn.deoplete#custom#option
  {:keyword_patterns {:clojure "[\\w!$%&*+/:<=>?@\\^_~\\-\\.#]*"}
   ;; autocompletion is too slow, disable it and only complete on <TAB>
   :auto_complete false})

(defn- t [s]
  (nvim.replace_termcodes s true true true))

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
    (t :<C-n>)
    (is-prev-space?)
    (t :<TAB>)
    (nvim.fn.deoplete#manual_complete)))

;; NOTE: we have to use fn-bridge here because neither "lua <foo>" no "v:lua" work in an expression
(u.fn-bridge :MaybeTabComplete *module-name* :tab-complete {:return true})

(nvim.set_keymap :i :<TAB> "MaybeTabComplete()" {:silent true :noremap true :expr true})
