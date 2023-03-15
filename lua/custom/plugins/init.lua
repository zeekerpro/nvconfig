---@type NvPluginSpec[]

-- local merge_tb = vim.tbl_deep_extend
-- local merge_tb = vim.tbl_extend

local removes = require("custom.plugins.removes")
local installs = require("custom.plugins.installs")
local overrides = require("custom.plugins.overrides")

-- return merge_tb("force", installs, overrides, removes)



return {
  removes, installs, overrides
}
