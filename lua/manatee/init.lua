local log = require('manatee.log')

local M = {}

M._state = {
  vwd = vim.fn.getcwd(),
}

M.print_vwd = function()
  log.info(string.format('VWD set to %s', M._state.vwd))
end

-- Set the virtual working directory (VWD) to the provided dir. If `absolute` is
-- false, the VWD will be set from the current working directory ()CWD).
-- @param dir The directory to set the VWD to.
-- @param absolute Wether the provided dir is an absolute path or a CWD relative path.
M.set_vwd = function(dir, absolute)
  if absolute then
    M._state.vwd = dir
  else
    M._state.vwd = vim.fn.resolve(vim.fn.getcwd() .. '/' .. dir)
  end
  M.print_vwd()
end

-- Resets the virtual working directory (VWD) to the current working directory (CWD).
M.reset_vwd = function()
  M._state.vwd = vim.fn.getcwd()
  M.print_vwd()
end

-- Returns the current virtual working directory (VWD).
M.vwd = function()
  return M._state.vwd
end

return M
