(module init
  {require {core aniseed.core
            nvim aniseed.nvim
            util dotfiles.util}})

;; Load all modules in no particular order.
(->> (util.glob (.. util.config-path "/lua/dotfiles/module/*.lua"))
     (core.run! (fn [path]
                  (require (string.gsub path ".*/(.-)/(.-)/(.-)%.lua" "%1.%2.%3")))))

;; Load all the "after" modules.
(->> (util.glob (.. util.config-path "/lua/dotfiles/module/after/*.lua"))
     (core.run! (fn [path]
                  (require (string.gsub path ".*/(.-)/(.-)/(.-)/(.-)%.lua" "%1.%2.%3.%4")))))
