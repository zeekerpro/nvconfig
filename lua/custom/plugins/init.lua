---@type NvPluginSpec[]

local merge_tb = vim.tbl_deep_extend

local removes = require("custom.plugins.removes")
local installs = require("custom.plugins.installs")
local overrides = require("custom.plugins.overrides")

return merge_tb("force", installs, overrides, removes)


-- local plugins = {
--   -- Install a plugin
--   {
--     "max397574/better-escape.nvim",
--     event = "InsertEnter",
--     config = function()
--       require("better_escape").setup()
--     end,
--   },
--
-- }
--
-- return plugins
