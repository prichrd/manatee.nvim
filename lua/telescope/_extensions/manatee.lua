local pickers = require('manatee.picker')

return require("telescope").register_extension{
  exports = {
    find_files = pickers,
  },
}
