if vim.g.loaded_manatee == 1 then
  return
end
vim.g.loaded_manatee = 1

local manatee_state = require'manatee.state'
local manatee_picker = require'manatee.picker'

local notify_fn = vim.notify_once or vim.notify

vim.api.nvim_create_user_command('ManateeRoot', function(opts)
  local val = opts.args
  if val == nil or val == "" then
    notify_fn(string.format(
      '[manatee.nvim] root is set to %s',
      manatee_state.cwd()),
      vim.log.levels.INFO)
    return
  end
  manatee_state.set_subcwd(val)
end, {
  nargs = '?',
  complete = 'dir'
})

vim.api.nvim_create_user_command('ManateeFindFiles', manatee_picker.find_files, { nargs = 0 })
vim.api.nvim_create_user_command('ManateeLiveGrep', manatee_picker.live_grep, { nargs = 0 })
vim.api.nvim_create_user_command('ManateeTerm', function()
  local fterm = require('FTerm')
  fterm.run(string.format('cd %s && clear', manatee_state.cwd()))
end, { nargs = 0 })
