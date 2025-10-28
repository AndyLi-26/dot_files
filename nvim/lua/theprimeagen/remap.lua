vim.g.mapleader = " "
vim.keymap.set("n", "e", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "10j")
vim.keymap.set("n", "K", "10k")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("n", "<leader>vwm", function()
    require("vim-with-me").StartVimWithMe()
end)
vim.keymap.set("n", "<leader>svwm", function()
    require("vim-with-me").StopVimWithMe()
end)

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
--vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

--vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
--vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
--vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
--vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>h", [[/\<<C-r><C-w>\>/gI<CR>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set("n", "<leader>vpp", "<cmd>e ~/.config/nvim/lua/theprimeagen/packer.lua<CR>");
vim.keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>");
vim.keymap.set("n", "<C-t>","<cmd>NERDTreeToggle<CR>")

vim.keymap.set("n","<C-h>",":<C-U>TmuxNavigateLeft<CR>")
vim.keymap.set("n","<C-j>", ":<C-U>TmuxNavigateDown<CR>")
vim.keymap.set("n","<C-k>",":<C-U>TmuxNavigateUp<CR>")
vim.keymap.set("n","<C-l>",":<C-U>TmuxNavigateRight<CR>")
vim.keymap.set("n","<C-p>",":<C-U>TmuxNavigatePrevious<CR>")


--vim.keymap.set("n", "<C-h>", "<C-b>h")
--vim.keymap.set("n", "<C-j>", "<C-b>j")
--vim.keymap.set("n", "<C-k>", "<C-b>k")
--vim.keymap.set("n", "<C-l>", "<C-b>l")


vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)


vim.api.nvim_create_user_command('W',function()
    vim.cmd("w")
end,{})

vim.api.nvim_create_user_command('Q',function()
    vim.cmd("q")
end,{})

vim.api.nvim_create_user_command('Wq',function()
    vim.cmd("wq")
end,{})


vim.api.nvim_create_user_command('WQ',function()
    vim.cmd("wq")
end,{})
