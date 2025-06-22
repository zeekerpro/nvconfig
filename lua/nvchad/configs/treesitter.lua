-- Load treesitter theme cache safely
pcall(function()
  local syntax_cache = vim.g.base46_cache .. "syntax"
  local treesitter_cache = vim.g.base46_cache .. "treesitter"
  
  if vim.loop.fs_stat(syntax_cache) then
    dofile(syntax_cache)
  end
  
  if vim.loop.fs_stat(treesitter_cache) then
    dofile(treesitter_cache)
  end
end)

return {
  ensure_installed = { "lua", "luadoc", "printf", "vim", "vimdoc" },

  highlight = {
    enable = true,
    use_languagetree = true,
  },

  indent = { enable = true },
}
