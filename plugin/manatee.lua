if vim.g.loaded_manatee == 1 then
  return
end
vim.g.loaded_manatee = 1

local manatee = require'manatee'

vim.api.nvim_create_user_command('Manatee', function(opts)
  local val = opts.args
  if val == nil or val == "" then
    manatee.print_vwd()
    return
  end
  manatee.set_vwd(val)
end, {
  nargs = '?',
  complete = 'dir'
})

vim.api.nvim_create_user_command('ManateeReset', function(_)
  manatee.reset_vwd()
end, {})
