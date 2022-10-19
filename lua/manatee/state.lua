local M = {}

M._state = {
  cwd = vim.fn.getcwd(),
}

-- set_subcwd sets the virtual CWD.
M.set_subcwd = function(subcwd)
  M._state.cwd = vim.fn.resolve(vim.fn.getcwd() .. '/' .. subcwd)
end

-- cwd gets the virtual CWD.
M.cwd = function()
  return M._state.cwd
end

return M
