-- Sair com 'q' , se usar gravação de macros altere para <C-q> → Ctrl + q
vim.cmd([[ map <C-q> :q<CR> ]])

-- Para Salvar com 'Ctrl + S' nos modos: Normal, Inserção e Visual
-- Precisa adicionar a linha: stty -ixon , ao seu ~/.bashrc
vim.cmd([[ nnoremap <C-s> :w<CR> ]])
vim.cmd([[ inoremap <C-s> <Esc>:w<CR>l ]])
vim.cmd([[ vnoremap <C-s> <Esc>:w<CR> ]])

-- Selecionar tudo com 'Ctrl + A'
vim.cmd([[ map <C-a> ggVG ]])

-- BASH - Auto preenche arquivos .sh que não existirem com a SheBang
vim.cmd([[ autocmd BufNewFile *.sh :call append(0, '#!/usr/bin/env bash') ]])

-- NvimTree
vim.cmd([[ nnoremap <C-n> :NvimTreeFindFileToggle<CR> ]])
vim.cmd([[ inoremap <C-n> <Esc>:NvimTreeFindFileToggle<CR>l ]])
vim.cmd([[ vnoremap <C-n> <Esc>:NvimTreeFindFileToggle<CR> ]])

-- Bufferline
vim.cmd([[ nnoremap <silent> <C-l> :BufferLineCycleNext<CR> ]])
vim.cmd([[ inoremap <silent> <C-l> <Esc>:BufferLineCycleNext<CR>l ]])
vim.cmd([[ vnoremap <silent> <C-l> <Esc>:BufferLineCycleNext<CR> ]])

vim.cmd([[ nnoremap <silent> <C-h> :BufferLineCyclePrev<CR> ]])
vim.cmd([[ inoremap <silent> <C-h> <Esc>:BufferLineCyclePrev<CR>l ]])
vim.cmd([[ vnoremap <silent> <C-h> <Esc>:BufferLineCyclePrev<CR> ]])

-- Smart split
-- resizing splits
-- amount defaults to 3 if not specified
-- use absolute values, no + or -
-- the functions also check for a range,
-- so for example if you bind `<A-h>` to `resize_left`,
-- then `10<A-h>` will `resize_left` by `(10 * config.default_amount)`
require('smart-splits').resize_up(amount)
require('smart-splits').resize_down(amount)
require('smart-splits').resize_left(amount)
require('smart-splits').resize_right(amount)
-- moving between splits
-- pass same_row as a boolean to override the default
-- for the move_cursor_same_row config option.
-- See Configuration.
require('smart-splits').move_cursor_up()
require('smart-splits').move_cursor_down()
require('smart-splits').move_cursor_left(same_row)
require('smart-splits').move_cursor_right(same_row)
-- Swapping buffers directionally with the window to the specified direction
require('smart-splits').swap_buf_up()
require('smart-splits').swap_buf_down()
require('smart-splits').swap_buf_left()
require('smart-splits').swap_buf_right()
-- persistent resize mode
-- temporarily remap your configured resize keys to
-- smart resize left, down, up, and right, respectively,
-- press <ESC> to stop resize mode (unless you've set a different key in config)
-- resize keys also accept a range, e.e. pressing `5j` will resize down 5 times the default_amount
require('smart-splits').start_resize_mode()

-- recommended mappings
-- resizing splits
-- these keymaps will also accept a range,
-- for example `10<A-h>` will `resize_left` by `(10 * config.default_amount)`
vim.keymap.set('n', '<A-h>', require('smart-splits').resize_left)
vim.keymap.set('n', '<A-j>', require('smart-splits').resize_down)
vim.keymap.set('n', '<A-k>', require('smart-splits').resize_up)
vim.keymap.set('n', '<A-l>', require('smart-splits').resize_right)
-- moving between splits
vim.keymap.set('n', '<S-h>', require('smart-splits').move_cursor_left)
vim.keymap.set('n', '<S-j>', require('smart-splits').move_cursor_down)
vim.keymap.set('n', '<S-k>', require('smart-splits').move_cursor_up)
vim.keymap.set('n', '<S-l>', require('smart-splits').move_cursor_right)
-- swapping buffers between windows
vim.keymap.set('n', '<leader><leader>h', require('smart-splits').swap_buf_left)
vim.keymap.set('n', '<leader><leader>j', require('smart-splits').swap_buf_down)
vim.keymap.set('n', '<leader><leader>k', require('smart-splits').swap_buf_up)
vim.keymap.set('n', '<leader><leader>l', require('smart-splits').swap_buf_right)

-- Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

-- Vim move
vim.cmd([[ let g:move_key_modifier = 'M' ]])
