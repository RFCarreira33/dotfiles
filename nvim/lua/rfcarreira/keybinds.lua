-- This File maps the keybinds to the functions and general keybinds
local keymap = vim.keymap.set
local g = vim.g

-- Leader Key
g.mapleader = ' '

-- Keymaps
keymap("x", "<leader>p", "\"_dP")
keymap("n", "<leader>sv", "<C-w>v")
keymap("n", "<leader>sh", "<C-w>s")
keymap("n", "<leader>sc", ":close<CR>")
keymap("v", "J", ":m '>+1<CR>gv=gv")
keymap("v", "K", ":m '<-2<CR>gv=gv")

--format buffer on save
keymap("i", "<ESC>", "<ESC>:w<CR>:lua vim.lsp.buf.format()<CR>")

-- Navigation
keymap("n", "<C-u>", "<C-u>zz")
keymap("n", "<C-d>", "<C-d>zz")
keymap("n", "<S-Tab>", ":bnext<CR>")
keymap("n", "<leader>q", ":BufferClose<CR>")

-- Telescope keymaps
keymap("n", "<leader>f", ':lua require"telescope.builtin".find_files()<CR>')
keymap("n", "<leader>fs", ':lua require"telescope.builtin".live_grep()<CR>')
keymap("n", "<leader>b", ':lua require"telescope.builtin".buffers()<CR>')

-- Tree
keymap("n", "<leader>e", ":NvimTreeToggle<CR>")

-- lsp
keymap("n", "gd", ":lua vim.lsp.buf.definition()<CR>")
keymap("n", "gr", ":lua vim.lsp.buf.references()<CR>")
keymap("n", "K", ":lua vim.lsp.buf.hover()<CR>")
keymap("n", "<leader>rn", ":lua vim.lsp.buf.rename()<CR>")
keymap('n', '<C-j>', '<cmd>lua require("cmp").select_next_item()<CR>')
keymap('n', '<C-k>', '<cmd>lua require("cmp").select_prev_item()<CR>')
keymap('i', '<C-a>', '<cmd>lua require("cmp").complete()<CR>')
keymap('i', '<CR>', 'v:lua.MUtils.completion_confirm()', { expr = true, noremap = true })
keymap("n", "<leader>ca", ":lua vim.lsp.buf.code_action()<CR>")
keymap("n", "<leader>di", ":lua vim.lsp.diagnostic.set_loclist()<CR>")
keymap('n', '<leader>dn', '<Cmd>Lspsaga diagnostic_jump_next<cr>', { noremap = true, silent = true })
keymap('n', '<leader>dN', '<Cmd>Lspsaga diagnostic_jump_prev<cr>', { noremap = true, silent = true })
