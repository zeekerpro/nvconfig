-- Load git theme cache safely
local cache_file = vim.g.base46_cache .. "git"
if vim.loop.fs_stat(cache_file) then
  dofile(cache_file)
end

return {
  signs = {
    delete = { text = "󰍵" },
    changedelete = { text = "󱕖" },
  },
}
