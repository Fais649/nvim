return {
  cmd = { 'phpactor' },
  filetypes = { 'php' },
  root_markers = { '.git', 'composer*' },
  init_options = {
    ['language_server_completion.trim_leading_dollar'] = true,
  },
}
