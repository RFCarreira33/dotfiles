local keymap = vim.keymap.set
local g = vim.g

g.mapleader = ' '

keymap('n', '<leader>sv', '<C-w>v')
keymap('n', '<leader>sh', '<C-w>s')
keymap('n', '<leader>sc', '<cmd>close<CR>')
keymap('v', 'J', ":m '>+1<CR>gv=gv", { silent = true })
keymap('v', 'K', ":m '<-2<CR>gv=gv", { silent = true })
keymap('v', '>', '>gv', { silent = true })
keymap('v', '<', '<gv', { silent = true })
keymap('v', '<leader>y', '"+y')
keymap('n', '<leader>y', '"+Y')
keymap('v', '<leader>p', '"_dP')

keymap('n', '<C-Up>', '<cmd>resize +2<cr>')
keymap('n', '<C-Down>', '<cmd>resize -2<cr>')
keymap('n', '<C-Left>', '<cmd>vertical resize -2<cr>')
keymap('n', '<C-Right>', '<cmd>vertical resize +2<cr>')
keymap('i', '<ESC>', '<ESC><cmd>w<CR>')
keymap('n', '<ESC>', '<cmd>w<CR>')

keymap('n', '<C-u>', '<C-u>zz')
keymap('n', '<C-d>', '<C-d>zz')

keymap('n', '<S-h>', '<cmd>BufferPrevious<CR>')
keymap('n', '<S-l>', '<cmd>BufferNext<CR>')
keymap('n', '<leader>q', '<cmd>BufferClose<CR>')

keymap('n', '<leader>ff', '<cmd>Telescope find_files<CR>')
keymap('n', '<leader>fs', '<cmd>Telescope live_grep<CR>')

keymap('n', '<leader>sd', '<cmd>lua vim.diagnostic.open_float(0, {scope="line"})<CR>')
keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>')
keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>')
keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>')
keymap('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>')

keymap('n', '<C-j>', '<cmd>lua require("cmp").select_next_item()<CR>')
keymap('n', '<C-k>', '<cmd>lua require("cmp").select_prev_item()<CR>')
keymap('i', '<C-a>', '<cmd>lua require("cmp").complete()<CR>')
keymap('i', '<CR>', 'v<cmd>lua.MUtils.completion_confirm()', { expr = true, noremap = true })

-- latex
keymap('n', '<leader>tr', '<cmd>VimtexCompile<CR>')
keymap('n', '<leader>tc', '<cmd>VimtexClean<CR>')
keymap('n', '<leader>ts', '<cmd>VimtexStopAll<CR>')
