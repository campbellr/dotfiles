(module dotfiles.module.plugin.vimwiki
  {require {nvim aniseed.nvim
            u    dotfiles.util
            git  dotfiles.git}})

(def vimwiki-dir "~/.vimwiki/")

(set nvim.g.vimwiki_list [{:path      vimwiki-dir
                           :path_html "~/public_html/"
                           :maxhi     1
                           :auto_tags 1
                           :syntax    "markdown"
                           :ext       ".md"}])

(set nvim.g.vimwiki_global_ext 0)

(defn- ft-map [from to]
  (u.autocmd :FileType :vimwiki :nmap :<buffer> (.. :<LocalLeader> from) to))

;; mappings
(ft-map :k ":VimwikiDiaryPrevDay<CR>")
(ft-map :j ":VimwikiDiaryNextDay<CR>")

(defn commit-and-push []
  (nvim.ex.lcd vimwiki-dir)
  (let [path     (u.expand "%")
        filename (u.expand "%:t")]
    (git.git-add path)
    (git.git-commit (.. "Auto commit of " filename))
    (git.git-push "origin" "HEAD:master"))
  (nvim.ex.lcd "-"))

;; Automatically commit to git repo on write.
(u.autocmd!
  :BufWritePost
  (.. vimwiki-dir "*")
  (u.viml->lua :dotfiles.module.plugin.vimwiki :commit-and-push))

;; turn off word wrap in vimwiki
(u.autocmd! "BufNewFile,BufRead" "*.wiki" ":set nowrap")
