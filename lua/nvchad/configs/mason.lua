-- Load mason theme cache safely
local cache_file = vim.g.base46_cache .. "mason"
if vim.loop.fs_stat(cache_file) then
  dofile(cache_file)
end

return {
  PATH = "skip",

  ui = {
    icons = {
      package_pending = " ",
      package_installed = " ",
      package_uninstalled = " ",
    },
  },

  max_concurrent_installers = 10,
}
