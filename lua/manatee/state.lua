local M = {}

local log = require('manatee.log')

M._state = {
  cwd = vim.fn.getcwd(),
}

-- set_subcwd sets the virtual CWD.
M.set_subcwd = function(subcwd)
  M._state.cwd = vim.fn.resolve(vim.fn.getcwd() .. '/' .. subcwd)
  log.info(string.format('root set to %s', M._state.cwd))
end

-- cwd gets the virtual CWD.
M.cwd = function()
  log.info(string.format('root set to %s', M._state.cwd))
  return M._state.cwd
end

-- set_cwd sets the virtual CWD.
M.set_cwd = function(cwd)
  M._state.cwd = cwd
  log.info(string.format('root set to %s', M._state.cwd))
end

-- reset_cwd resets the CWD.
M.reset_cwd = function()
  M.set_cwd(vim.fn.getcwd())
end

return M
