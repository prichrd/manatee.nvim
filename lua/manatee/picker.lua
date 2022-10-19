local M = {}

local builtin = require('telescope.builtin')
local state = require('manatee.state')

M.find_files = function(opts)
  opts = opts or {}
  opts.cwd = state.cwd()
  builtin.find_files(opts)
end

M.live_grep = function(opts)
  opts = opts or {}
  opts.cwd = state.cwd()
  builtin.live_grep(opts)
end

M.pickers = {
  find_files = M.find_files,
  live_grep = M.live_grep,
}

return M
