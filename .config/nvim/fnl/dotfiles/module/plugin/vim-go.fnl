(module dotfiles.module.plugin.vim-go
  {require { nvim aniseed.nvim
            u     dotfiles.util}
   require-macros [dotfiles.macros]})

(set nvim.g.go_code_completion_enabled false)
(set nvim.g.go_gopls_enabled false)
(set nvim.g.go_def_mapping_enabled false)
(set nvim.g.go_doc_keywordprg_enabled false)

(set nvim.g.go_alternative_mode :vsplit)
(set nvim.g.go_fmt_command :goimports)
(set nvim.g.go_highlight_functions true)
(set nvim.g.go_highlight_methods true)
(set nvim.g.go_term_enabled true)
(set nvim.g.go_term_reuse true)
(set nvim.g.go_term_close_on_exit false)

(autocmd :FileType :go :nmap "<Leader>dt" (u.plug :go-def-tab))
