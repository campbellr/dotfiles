(module dotfiles.module.plugin.nvim-lsp
  {require {u          dotfiles.util
            comp       completion
            lsp        lspconfig}})

(defn on-attach [client bufnr]
  ;; Configure nvim-lua/completion-nvim
  (comp.on_attach client bufnr)
  ;; Keybindings for LSPs
  ;; Stuffed inside on-attach so they don't override bindings for non-LSP stuff
  (u.nnoremap "gd" "<cmd>lua vim.lsp.buf.definition()<CR>")
  (u.nnoremap "K" "<cmd>lua vim.lsp.buf.hover()<CR>")
  (u.nnoremap "gD" "<cmd>lua vim.lsp.buf.implementation()<CR>")
  (u.nnoremap "<c-k>" "<cmd>lua vim.lsp.buf.signature_help()<CR>")
  (u.nnoremap "1gD" "<cmd>lua vim.lsp.buf.type_definition()<CR>")
  (u.nnoremap "gr" "<cmd>lua vim.lsp.buf.references()<CR>")
  (u.nnoremap "g0" "<cmd>lua vim.lsp.buf.document_symbol()<CR>")
  (u.nnoremap "gW" "<cmd>lua vim.lsp.buf.workspace_symbol()<CR>"))

;; Set up typescript/javascript LS
(lsp.tsserver.setup {:on_attach on-attach})

;; set up python LS
(lsp.jedi_language_server.setup {:on_attach on-attach})
