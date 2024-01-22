--  _       _ _     _             
-- (_)_ __ (_) |_  | |_   _  __ _ 
-- | | '_ \| | __| | | | | |/ _` |
-- | | | | | | |_ _| | |_| | (_| |
-- |_|_| |_|_|\__(_)_|\__,_|\__,_|                               

require("config.autocmds").setup()
require("config.keymaps").setup()
require("config.options").setup()

-- Set these up last because they are the most likely to fail. If my plugins or
-- lsp config fail to load, I still want my options and autocommands to be set
-- correctly.
require("config.tools").setup_lazy("config.plugins")
require("config.statusline").setup()
require("config.lsp").setup()
require("config.format").setup()

-- However, the colorscheme must be initialized after the plugins, because I
-- might using a plugin colorscheme.
vim.cmd.colorscheme("melange")
