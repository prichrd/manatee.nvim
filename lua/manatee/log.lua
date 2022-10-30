local M = {}

local notify = function(msg, level)
  local notify_fn = vim.notify
  notify_fn(string.format(
  '[manatee.nvim] %s', msg),
  level)
end

-- Prints a manatee info message.
-- @param msg The message to print.
M.info = function(msg)
  notify(msg, vim.log.levels.INFO)
end

-- Prints a manatee warn message.
-- @param msg The message to print.
M.warn = function(msg)
  notify(msg, vim.log.levels.WARN)
end

-- Prints a manatee error message.
-- @param msg The message to print.
M.error = function(msg)
  notify(msg, vim.log.levels.ERROR)
end

return M
