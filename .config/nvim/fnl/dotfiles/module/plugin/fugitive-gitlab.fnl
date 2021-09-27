(module dotfiles.module.plugin.fugitive-gitlab
  {require {nvim aniseed.nvim}})

(set nvim.g.gitlab_api_keys {"gitlab.com" (. nvim.env "GITLAB_TOKEN")})
