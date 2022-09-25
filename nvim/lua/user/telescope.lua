local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end

telescope.setup({
  pickers = {
    find_files = {
      theme = "dropdown",
    },
  },
})

local builtin = require("telescope.builtin")

vim.keymap.set("n", "<c-p>", builtin.find_files)

-- vim.keymap.set("n", "<leader>fg", builtin.live_grep)
-- vim.keymap.set("n", "<leader>fb", builtin.buffers)
-- vim.keymap.set("n", "<leader>fh", builtin.help_tags)
