local pickers = require('manatee.picker')

return require("telescope").register_extension{
  exports = {
    find_files = pickers.find_files,
    live_grep = pickers.live_grep,
    actions = require('telescope._extensions.manatee.actions'),
  },
}
