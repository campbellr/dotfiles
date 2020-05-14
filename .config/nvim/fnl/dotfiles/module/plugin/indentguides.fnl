(module dotfiles.module.plugin.indentguides
  {require {nvim aniseed.nvim}})

;; indent-guides messes up yaml syntax highlighting, and guides
;; are pointless on text files, so disable
(set nvim.g.indentguides_ignorelist [:text :yaml :yaml.jinja2])
