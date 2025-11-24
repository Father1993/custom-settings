-- Базовые настройки NeoVim на Lua
vim.opt.number = true
vim.opt.relativenumber = true

-- Табуляция
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.autoindent = true

-- Поиск
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true


-- Интерфейс
vim.opt.cursorline = true
vim.opt.showcmd = true
vim.opt.wildmenu = true
vim.opt.laststatus = 2
vim.opt.ruler = true

-- Кодировка

vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"

-- Мышь
vim.opt.mouse = "a"

-- Бэкспейс

vim.opt.backspace = "indent,eol,start"

-- Горячие клавиши (Vim-стиль)
vim.api.nvim_set_keymap('i', 'jk', '<ESC>', {noremap = true})
vim.api.nvim_set_keymap('i', 'kj', '<ESC>', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-s>', ':w<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-q>', ':q<CR>', {noremap = true})

-- Перемещение между окнами
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', {noremap = true})