# manatee.nvim

This plugin provides a set of tools for working with monorepos:

* Set the virtual working directory (`VWD`) with `:Manatee <directory>`
* Print the `VWD` with `:Manatee`
* Reset the `VWD` with `:ManateeReset`
* Extend Telescope's `file_finder` and `live_grep` finders to search from `VWD`

## Telescope

This plugin extends Telescope's find_files and live_grep functionality by
setting the `CWD` to the `VWD`. Here is a sample telescope configuration:

```lua
local telescope = require'telescope'
local manatee_actions = telescope.extensions.manatee.actions

-- Manatee exposes actions to manipulate the virtual working directory. If you
-- are using telescope-file-browser.nvim for instance, you can set the following
-- action to set the virtual working directory by pression `m` in normal mode.
telescope.setup({
  extensions = {
    file_browser = {
      mappings = {
        ["n"] = {
          ["m"] = manatee_actions.set_vwd,
        },
      },
    },
  },
})
telescope.load_extension('file_browser')

-- Register the manatee.nvim extension.
telescope.load_extension('manatee')

-- Configures find_files and live_grep to use Manatee. You can still provide
-- regular Telescope arguments to the finders.
vim.api.nvim_set_keymap('n', '<Leader>ff', '<cmd>lua require"telescope".extensions.manatee.find_files{}<CR>', opts)
vim.api.nvim_set_keymap('n', '<Leader>fg', '<cmd>lua require"telescope".extensions.manatee.live_grep{}<CR>', opts)
```

## Installing

manatee.nvim requires Neovim and follows the standard runtime package structure.
It is possible to install it with all popular package managers:

* [vim-plug](https://github.com/junegunn/vim-plug)
  * `Plug 'prichrd/manatee.nvim'`
* [packer](https://github.com/wbthomason/packer.nvim)
  * `use 'prichrd/manateee.nvim'`

## Usage

The documentation can be found at [doc/manatee.txt](doc/manatee.txt). You can also
use the `:help manatee.nvim` command inside of Neovim.

