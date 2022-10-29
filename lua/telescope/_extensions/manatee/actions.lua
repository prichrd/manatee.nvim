local M = {}

local manatee_state = require('manatee.state')

M.set_root = function(prompt_bufnr)
  local action_state = require "telescope.actions.state"
  local current_picker = action_state.get_current_picker(prompt_bufnr)
  manatee_state.set_cwd(current_picker.finder.path)
end

return M
