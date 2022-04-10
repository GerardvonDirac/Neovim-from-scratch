local status_ok, _ = pcall(require, "repl")
if not status_ok then
  return
end

local opts = { noremap = true, silent = true }

local keymap = vim.api.nvim_set_keymap

keymap("n", "<F5>", ":ReplToggle<CR>", opts)
keymap("n", "\\w", ":ReplSend<CR>", opts)
keymap("v", "\\w", ":ReplSend<CR>", opts)
