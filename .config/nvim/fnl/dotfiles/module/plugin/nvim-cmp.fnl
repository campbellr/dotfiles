(module dotfiles.module.plugin.nvim-cmp
  {require {nvim aniseed.nvim}})

(set nvim.o.completeopt "menuone,noselect")

(let [cmp (require :cmp)]
  (cmp.setup {:snippet {:expand (fn [args]
                                  (let [luasnip (require :luasnip)]
                                    (luasnip.lsp_expand (. args :body))))}
              :mapping {"<C-f>"     (cmp.mapping (cmp.mapping.scroll_docs 3) {:i :c})
                        "<C-Space>" (cmp.mapping (cmp.mapping.complete) {:i :c})
                        "<C-y>"     cmp.config_disable
                        "<C-e>"     (cmp.mapping {:i (cmp.mapping.abort) :c (cmp.mapping.close)})
                        "<CR>"      (cmp.mapping.confirm {:select true})
                        "<Tab>"     (fn [fallback]
                                      (if (cmp.visible)
                                          (cmp.select_next_item)
                                          (luasnip.expand_or_jumpable)
                                          (luasnip.expand_or_jump)
                                          (fallback)))
                        "<S-Tab>"   (fn [fallback]
                                      (if (cmp.visible)
                                          (cmp.select_prev_item)
                                          (luasnip.expand_or_jumpable)
                                          (luasnip.expand_or_jump)
                                          (fallback)))}
              :sources (cmp.config.sources [{:name "nvim_lsp"}
                                            {:name "luasnip"}]
                                           {:name "buffer"})}))
