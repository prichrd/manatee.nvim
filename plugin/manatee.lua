if vim.g.loaded_manatee == 1 then
  return
end
vim.g.loaded_manatee = 1

local manatee_state = require'manatee.state'
local manatee_picker = require'manatee.picker'

vim.api.nvim_create_user_command('ManateeRoot', function(opts)
  local val = opts.args
  if val == nil or val == "" then
    -- TODO: Log
    return
  end
  manatee_state.set_subcwd(val)
end, {
  nargs = '?',
  complete = 'dir'
})
