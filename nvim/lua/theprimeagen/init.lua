vim.g.deprecation_warnings = false


require('theprimeagen.packer')
require("theprimeagen.set")
require("theprimeagen.remap")

-- DO NOT INCLUDE THIS
-- vim.opt.rtp:append("~/personal/streamer-tools")
-- DO NOT INCLUDE THIS
local augroup = vim.api.nvim_create_augroup
local ThePrimeagenGroup = augroup('ThePrimeagen', {})

local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup('HighlightYank', {})

function R(name)
    require("plenary.reload").reload_module(name)
end

autocmd('TextYankPost', {
    group = yank_group,
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 40,
        })
    end,
})

autocmd({"BufWritePre"}, {
    group = ThePrimeagenGroup,
    pattern = "*",
    command = [[%s/\s\+$//e]],
})

autocmd({'BufWinEnter'}, {
  group = lastplace,
  desc = 'return cursor to where it was last time closing the file',
  pattern = '*',
  command = 'silent! normal! g`"zv',
})

vim.lsp.enable('pyright')
vim.g.termguicolors=true
vim.g.exrc=true
vim.cmd.colorscheme('molokai')
vim.opt.background = "dark"
vim.cmd([[highlight Normal guibg=black]])

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25
vim.g.syntax='on'
vim.cmd [[packadd copilot.vim]]
vim.cmd(":Copilot disable")

print("finish loading primeagen")
