(module dotfiles.module.plugin.ale
  {require {nvim aniseed.nvim}})

(set nvim.g.ale_linters {:clojure          [:clj-kondo]
                         :typescript:      [:eslint]
                         :typescriptreact: [:eslint]
                         :go               [:golangci-lint :gobuild]
                         :sh               [:shellcheck]
                         :bash             [:shellcheck]})
(set nvim.g.ale_fixers {:python     [:black :isort]
                        :javascript [:prettier]
                        :typescript [:prettier]
                        :typescriptreact [:prettier]
                        :yaml [:prettier]})

(set nvim.g.ale_fix_on_save true)

(set nvim.g.ale_go_golangci_lint_options "")
(set nvim.g.ale_go_golangci_lint_package 1)

