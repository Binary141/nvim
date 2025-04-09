-- vim.api.nvim_set_keymap('n', '<leader>cc', ':copy<CR>', { noremap = true })

vim.keymap.set("i", "jk", "<Esc>")

-- allow the mouse to move the cursor position
vim.keymap.set("n", "<ScrollWheelDown>", "j")
vim.keymap.set("n", "<ScrollWheelUp>", "k")

vim.keymap.set("v", "<leader>y", '"+y', { desc = "Yank to system clipboard" })

vim.keymap.set("n", "<leader>t", ":NvimTreeToggle<cr>")
-- vim.keymap.set("n", "<leader>e", vim.cmd.Ex)

-- telescope config
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})


-- barbar
vim.keymap.set('n', '<leader>x', '<Cmd>BufferClose<CR>', {})
-- force close a buffer
vim.keymap.set('n', '<leader>X!', '<Cmd>BufferClose!<CR>', {})

vim.keymap.set('n', '<Tab>', '<Cmd>BufferNext<CR>', {})
vim.keymap.set('n', '<S-Tab>', '<Cmd>BufferPrevious<CR>', {})
