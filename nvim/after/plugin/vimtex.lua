vim.g.vimtex_view_method="skim"

vim.api.nvim_create_augroup("quickfix_autocmds", { clear = true })
vim.api.nvim_create_autocmd("BufWinEnter", {
  group = "quickfix_autocmds",
  callback = function()
    if vim.bo.buftype == "quickfix" then
      vim.cmd("3wincmd _")
    end
  end,
})
vim.g.vimtex_quickfix_ignore_filters = {
  'Underfull',
  'Overfull',
  'LaTeX Warning',
  'Package hyperref Warning',
}

vim.api.nvim_create_autocmd("WinEnter", {
  callback = function()
    if vim.bo.buftype == "quickfix"
       and #vim.api.nvim_list_wins() == 1 then
      vim.cmd("q")
    end
  end,
})
