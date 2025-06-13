local function compile_latex()
  local outdir = "/tmp"
  local file = vim.fn.expand("%")
  vim.system({ "pdflatex", "-output-directory", outdir, file })
end

vim.keymap.set("n", "<leader>e", "<cmd>Explore<cr>")
vim.keymap.set("n", "<leader>l", compile_latex)

-- Opens the PDF compiled from the current LaTeX document in the browser.
vim.keymap.set("n", "<leader>o", function()
  local file = vim.fn.expand("%:t:r")
  local pdf = "/tmp/" .. file .. ".pdf"
  local browser = "firefox"
  if not vim.uv.fs_stat(pdf) then
    compile_latex()
  end
  vim.system({ browser, pdf })
end)
