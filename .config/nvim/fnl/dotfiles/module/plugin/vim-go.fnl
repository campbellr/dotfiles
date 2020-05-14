(module dotfiles.module.plugin.vim-go
  {require { nvim aniseed.nvim
            u     dotfiles.util}})

(set nvim.g.go_alternative_mode :vsplit)
(set nvim.g.go_fmt_command :goimports)
(set nvim.g.go_highlight_functions true)
(set nvim.g.go_highlight_methods true)
(set nvim.g.go_term_enabled true)

(u.autocmd :FileType :go :nmap "<Leader>dt" (u.plug :go-def-tab))
