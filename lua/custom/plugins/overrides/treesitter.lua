local options = {
  ensure_installed = {
    "lua",
    "html",
    "css",
    "javascript",
    "typescript",
    "json",
    "yaml",
    "markdown",
    "ruby",
    "vue",
    "lua",
    "scss",
    "python",
    "svelte"
  },

  highlight = {
    enable = true,
    use_languagetree = true,
  },

  indent = {
    enable = false,
  },
}

return {
  override_options = options
}
