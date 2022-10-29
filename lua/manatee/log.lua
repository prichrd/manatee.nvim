local M = {}

local notify = function(msg, level)
  local notify_fn = vim.notify
  notify_fn(string.format(
  '[manatee.nvim] %s', msg),
  level)
end

M.info = function(msg)
  notify(msg, vim.log.levels.INFO)
end

M.warn = function(msg)
  notify(msg, vim.log.levels.WARN)
end

M.error = function(msg)
  notify(msg, vim.log.levels.ERROR)
end

return M
