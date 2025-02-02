--[[
===== Basic Config =====
--]]


-- Sync clipboard between OS and Neovim.
vim.opt.clipboard = "unnamedplus"

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.g.have_nerd_font = true

-- [[ Setting options ]]
-- See `:help vim.opt`
vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.mouse = 'a'

vim.opt.showmode = false -- no need with statusline plugin (mini.statusline)

vim.opt.breakindent = true -- ?
vim.opt.showbreak = '↪ '

vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C
vim.opt.ignorecase = true
-- or one or more capital letters in the search term:
vim.opt.smartcase = true

vim.opt.signcolumn = 'yes'

vim.opt.updatetime = 300

vim.opt.timeoutlen = 300

vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true -- ?
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split' -- ?

vim.opt.cursorline = true

vim.opt.scrolloff = 15

vim.opt.tabstop = 2       -- 一个 Tab 显示为 2 个空格
vim.opt.shiftwidth = 2    -- 自动缩进时使用 2 个空格
vim.opt.expandtab = true  -- 用空格替代 Tab

-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`
vim.opt.hlsearch = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

vim.keymap.set('n', '<C-s>', ':w<Return>', { desc = 'Save' })

vim.keymap.set('n', '<C-a>', 'gg<S-v>G', { desc = 'Select all' })

vim.keymap.set('n', 's', '', { desc = '' })
vim.keymap.set('n', 'sh', ':split<Return>', { desc = 'Split' })
vim.keymap.set('n', 'sv', ':vsplit<Return>', { desc = 'Vertical Split' })

vim.keymap.set('n', '<leader>c', ':bd<Return>', { desc = 'Close buffer' })

-- TODO:
-- vim.keymap.set('n', '<tab>', ':tabnext<Return>', { desc = 'Next tab' })
-- vim.keymap.set('n', '<S-tab>', ':tabprev<Return>', { desc = 'Prev tab' })

-- vim.keymap.set('n', '<C-S-h>', '<C-w><', { desc = 'Resize window <' })
-- vim.keymap.set('n', '<C-S-l>', '<C-w>>', { desc = 'Resize window >' })
-- vim.keymap.set('n', '<C-S-k>', '<C-w>+', { desc = 'Resize window +' })
-- vim.keymap.set('n', '<C-S-j>', '<C-w>-', { desc = 'Resize window -' })

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

function GetCurrentWindowId()
  return vim.api.nvim_get_current_win()
end

function GetCurrentBufId()
  local win_id = vim.api.nvim_get_current_win();
  return vim.api.nvim_win_get_buf(win_id);
end

function GetCurrentBufName()
  return vim.api.nvim_buf_get_name(GetCurrentBufId());
end

function ListBuffers()
    -- Get a list of all buffer IDs
    local wins = vim.api.nvim_list_wins();
    -- Iterate through each buffer
    for _, win_id in ipairs(wins) do
      -- Get the name of the buffer
      local buf_id = vim.api.nvim_win_get_buf(win_id)
      local buf_name = vim.api.nvim_buf_get_name(buf_id)
      -- Print the buffer ID and name
      print("Window Id: " .. win_id .. ", Buffer ID: " .. buf_id .. ", Buffer Name: " .. buf_name)
    end
end