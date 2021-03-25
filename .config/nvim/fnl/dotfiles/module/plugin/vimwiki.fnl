(module dotfiles.module.plugin.vimwiki
  {require {nvim aniseed.nvim
            u    dotfiles.util
            git  dotfiles.git}
   require-macros [dotfiles.macros]})

(def vimwiki-dir "~/.vimwiki/")

(set nvim.g.vimwiki_list [{:path      vimwiki-dir
                           :path_html "~/public_html/"
                           :maxhi     1
                           :auto_tags 1
                           :syntax    "markdown"
                           :ext       ".md"}])

(set nvim.g.vimwiki_global_ext 0)

(defn- ft-map [from to]
  (autocmd :FileType :vimwiki :nmap :<buffer> (.. :<LocalLeader> from) to))

(defn commit-and-push []
  (_: lcd vimwiki-dir)
  (let [path     (u.expand "%")
        filename (u.expand "%:t")]
    (git.git-add path)
    (git.git-commit (.. "Auto commit of " filename))
    (git.git-push "origin" "HEAD:master"))
  (_: lcd "-"))

(augroup
  vimwiki-config
  ;; mappings
  (ft-map :k ":VimwikiDiaryPrevDay<CR>")
  (ft-map :j ":VimwikiDiaryNextDay<CR>")

  ;; Automatically commit to git repo on write.
  (autocmd
    :BufWritePost
    (.. vimwiki-dir "*")
    (viml->fn commit-and-push))

  ;; turn off word wrap in vimwiki
  (autocmd "BufNewFile,BufRead" "*.wiki" ":set nowrap"))
