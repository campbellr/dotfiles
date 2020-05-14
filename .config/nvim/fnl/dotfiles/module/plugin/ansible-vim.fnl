(module dotfiles.module.plugin.ansible-vim
  {require {nvim aniseed.nvim}})


(set nvim.g.ansible_template_syntaxes {:*.yaml.j2 :yaml})
