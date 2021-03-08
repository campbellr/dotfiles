(module dotfiles.module.plugin.ale
  {require {nvim aniseed.nvim
            u    dotfiles.util}})

(set nvim.g.ale_linters {:clojure          [:clj-kondo]
                         :terraform        [:terraform]
                         :typescript:      [:eslint]
                         :typescriptreact: [:eslint]
                         :go               [:golangci-lint :gobuild]
                         :sh               [:shellcheck]
                         :bash             [:shellcheck]})
(set nvim.g.ale_fixers {:python     [:black :isort]
                        :javascript [:prettier]
                        :terraform  [:terraform]
                        :typescript [:prettier]
                        :typescriptreact [:prettier]
                        :yaml [:prettier]})

(set nvim.g.ale_fix_on_save true)

(set nvim.g.ale_go_golangci_lint_options "")
(set nvim.g.ale_go_golangci_lint_package 1)

(u.augroup :I18Next
  #(u.autocmd! "BufNewFile,BufRead" "en.json" "let b:ale_json_jq_filters = '-f ~/sort-keys-nocase.jq'"))

;; run jq *only* on i18next translation files
(set nvim.g.ale_pattern_options {"en\\.json$" {:ale_fixers [:jq]}})
(set nvim.g.ale_pattern_options_enabled 1)
