--  _       _ _     _
-- (_)_ __ (_) |_  | |_   _  __ _
-- | | '_ \| | __| | | | | |/ _` |
-- | | | | | | |_ _| | |_| | (_| |
-- |_|_| |_|_|\__(_)_|\__,_|\__,_|

local utils = require("config.utils")

utils.setup_autocmds()
utils.setup_keymaps()
utils.setup_options()

-- Set these up last because they are the most likely to fail. If my plugins or
-- lsp config fail to load, I still want my options and autocommands to be set
-- correctly.
require("config.plugins").setup()
require("config.lsp").setup()

-- However, the colorscheme must be initialized after the plugins, because I
-- might using a plugin colorscheme.
vim.cmd.colorscheme("gruvbox-material")
