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
                           :auto_diary_index 1
                           :auto_generate_links 1
                           :auto_generate_tags 1
                           :auto_toc 1
                           :syntax    "markdown"
                           :ext       ".md"}])

(set nvim.g.vimwiki_global_ext 0)
(set nvim.g.vimwiki_auto_chdir 1)
(set nvim.g.vimwiki_auto_header 1)

(defn- ft-map [from to]
  (autocmd :FileType :vimwiki :nmap :<buffer> (.. :<LocalLeader> from) to))

(defn commit-and-push []
  (ex lcd vimwiki-dir)
  (let [path     (u.expand "%")
        filename (u.expand "%:t")]
    (git.git-add path)
    (git.git-commit (.. "Auto commit of " filename))
    (git.git-push "origin" "HEAD:master"))
  (ex lcd "-"))

(augroup
  vimwiki-config
  ;; FIXME: for some reason the `...` vararg syntax isn't working in the macro
  ;; correctly, so we need to wrap the body in a do
  (do (ft-map :k ":VimwikiDiaryPrevDay<CR>")
      (ft-map :j ":VimwikiDiaryNextDay<CR>")
      (autocmd
        :BufWritePost
        (.. vimwiki-dir "*")
        (viml->fn commit-and-push))))

;; fancy checkmarks
;;(set nvim.g.vimwiki_listsyms " ○◐●✓")
;;(set nvim.g.vimwiki_listsym_rejected "✗")

;; Show all pending and completed tasks
;; :vimgrep "[*-\d+] \[[ x]\]" **/*.md

;; Show all completed tasks
;; :vimgrep "[*-\d+] \[x\]" **/*.md

;; Show all uncompleted tasks
;; :vimgrep "[*-\d+] \[ \]" **/*.md
