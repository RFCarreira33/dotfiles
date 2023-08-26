-- This File maps the keybinds to the functions and general keybinds
local keymap = vim.keymap.set
local g = vim.g

-- Leader Key
g.mapleader = ' '

-- General Keybinds
keymap('x', '<leader>p', '\'_dP')
keymap('n', '<leader>sv', '<C-w>v')
keymap('n', '<leader>sh', '<C-w>s')
keymap('n', '<leader>sc', '<cmd>close<CR>')
keymap('v', 'J', '<cmd>m ">+1<CR>gv=gv')
keymap('v', 'K', '<cmd>m "<-2<CR>gv=gv')

-- Resize window using <ctrl> arrow keys
keymap('n', '<C-Up>', '<cmd>resize +2<cr>')
keymap('n', '<C-Down>', '<cmd>resize -2<cr>')
keymap('n', '<C-Left>', '<cmd>vertical resize -2<cr>')
keymap('n', '<C-Right>', '<cmd>vertical resize +2<cr>')

--format buffer on save
keymap('i', '<ESC>', '<ESC><cmd>:lua vim.lsp.buf.format()<CR><cmd>w<CR>')
keymap('n', '<ESC>', '<cmd>:lua vim.lsp.buf.format()<CR><cmd>w<CR>')

-- Navigation and buffers
keymap('n', '<C-u>', '<C-u>zz')
keymap('n', '<C-d>', '<C-d>zz')
keymap('n', '<S-h>', '<cmd>BufferPrevious<CR>')
keymap('n', '<S-l>', '<cmd>BufferNext<CR>')
keymap('n', '<leader>q', '<cmd>BufferClose<CR>')

-- Telescope
keymap('n', '<leader>ff', '<cmd>Telescope find_files<CR>')
keymap('n', '<leader>fs', '<cmd>Telescope live_grep<CR>')

-- lsp
keymap('n', '<leader>sd', '<cmd>lua vim.diagnostic.open_float(0, {scope="line"})<CR>')
keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>')
keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>')
keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>')
keymap('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>')

-- Dont rly use this I prefer arrow keys but its here anyway
keymap('n', '<C-j>', '<cmd>lua require("cmp").select_next_item()<CR>')
keymap('n', '<C-k>', '<cmd>lua require("cmp").select_prev_item()<CR>')
keymap('i', '<C-a>', '<cmd>lua require("cmp").complete()<CR>')
keymap('i', '<CR>', 'v<cmd>lua.MUtils.completion_confirm()', { expr = true, noremap = true })
