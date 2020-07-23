(module dotfiles.module.plugin.ale
  {require {nvim aniseed.nvim}})

(set nvim.g.ale_linters {:clojure [:clj-kondo]
                         :go      [:golangci-lint :gobuild]})
(set nvim.g.ale_fixers {:python     [:black :isort]
                        :javascript [:prettier]
                        :yaml [:prettier]})

(set nvim.g.ale_fix_on_save true)

(set nvim.g.ale_go_golangci_lint_options "")
(set nvim.g.ale_go_golangci_lint_package 1)

