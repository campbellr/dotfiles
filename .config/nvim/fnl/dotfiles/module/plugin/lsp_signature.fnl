(module dotfiles.module.plugin.lsp_signature
  {require {nvim aniseed.nvim
            sig lsp_signature}})

(sig.setup { :handler_opts {:border :rounded}})
