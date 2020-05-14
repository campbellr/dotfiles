(module dotfiles.module.plugin.fireplace
  {require {nvim aniseed.nvim}})

(defn- noremap [from to]
  (nvim.set_keymap
    :n
    (.. :<leader> from)
    (.. ":" to "<CR>")
    {:noremap true
     :silent  true}))

;; Run all tests in current file/namespace (mnemonic: test file)
;(noremap :tf :RunTests)
;; Run test under cursor (mnemonic: test nearest)
;(noremap :tn :.RunTests)
(noremap :rr :Require)
(noremap :rc :Console!)
