(module dotfiles.util
  {require {a    aniseed.core
            nvim aniseed.nvim}})

(defn escape [s]
  (nvim.fn.shellescape s))

(defn expand [path]
  (nvim.fn.expand path))

(defn glob [path]
  (nvim.fn.glob path true true true))

(defn exists? [path]
  (= (nvim.fn.filereadable path) 1))

(defn lua-file [path]
  (nvim.ex.luafile path))

(def config-path (nvim.fn.stdpath "config"))

(defn noremap [mode from to]
  (nvim.set_keymap
    mode
    from
    to
    {:noremap true}))

(defn nnoremap [from to]
  (noremap :n from to))

(defn inoremap [from to]
  (noremap :i from to))


(defn inoremap [from to]
  (noremap :c from to))

(defn some? [x] (not (a.nil? x)))

(defn plug [cmd]
  (.. "<Plug>(" cmd ")"))

;; vim's :set sets both global and buffer option, this emulates that behaviour
;; TODO: maybe rename to setg?
(defn gset [name value]
  (pcall a.assoc nvim.o name value)
  (pcall a.assoc nvim.bo name value)
  (pcall a.assoc nvim.bo name value))
