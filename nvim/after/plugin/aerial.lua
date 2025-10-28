local status_ok, aerial = pcall(require, 'aerial')
if not status_ok then
  return
end

aerial.setup({
  on_attach = function(bufnr)
    vim.keymap.set('n', '<leader>f', '<cmd>AerialToggle!<CR>', { buffer = bufnr, desc = 'Toggle Aerial' })
    vim.keymap.set('n', '{', '<cmd>AerialPrev<CR>', { buffer = bufnr, desc = 'Prev symbol' })
    vim.keymap.set('n', '}', '<cmd>AerialNext<CR>', { buffer = bufnr, desc = 'Next symbol' })
  end,
  layout = {
    max_width = {40, 0.2},  -- Max width in columns and percentage
    min_width = 20,
    default_direction = "right",
  },
  show_guides = true,
  filter_kind = {
    "Function",       -- Normal functions
    "Method",         -- Class/struct methods
    "Constructor",    -- Class constructors
    "Destructor",     -- Class destructors
  }
})
