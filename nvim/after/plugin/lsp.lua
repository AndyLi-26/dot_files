--local lsp = require("lsp-zero")
local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.ensure_installed({
  --'tsserver',
  'quick_lint_js',
  'eslint',
})

-- Fix Undefined global 'vim'
lsp.nvim_workspace()

local cmp = require('cmp')
--require'lspconfig'.eslint.setup{}

--require('lspconfig')['ts_ls'].setup {
--  capabilities = capabilities,
--}

vim.lsp.config("eslint", {})

vim.lsp.config("ts_ls", {
  capabilities = capabilities,
})


local capabilities = require('cmp_nvim_lsp').default_capabilities()

local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
  --['<S-Tab>'] = cmp.mapping.select_prev_item(cmp_select),
  ['<Enter>'] = cmp.mapping.confirm({ select = true }),
  --['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
  ['<Tab>'] = cmp.config.disable,
  ['<C-Space>'] = cmp.config.disable,
  ['<C-n>'] = cmp.config.disable,
  ['<C-Tab>'] = cmp.config.disable,
  --["<C-Space>"] = cmp.mapping.complete(),
})

--local spell_source = {}
--
--spell_source.new = function()
--  return setmetatable({}, { __index = spell_source })
--end
--
--spell_source.complete = function(self, params, callback)
--  local ft = vim.bo.filetype
--  if ft ~= "tex" and ft ~= "markdown" and ft ~= "md" then
--    callback({ items = {}, isIncomplete = false })
--    return
--  end
--
--  local word = vim.fn.expand("<cword>")
--  local suggestions = vim.fn.spellsuggest(word)
--  local items = {}
--  for _, s in ipairs(suggestions) do
--    table.insert(items, { label = s })
--  end
--  callback({ items = items, isIncomplete = false })
--end
--
--spell_source.get_trigger_characters = function()
--  return { "" }
--end
--
--cmp.register_source("spell", spell_source.new())

lsp.setup_nvim_cmp({
  mapping = cmp_mappings,
  sources = {
      { name = 'spell', keyword_length = 3, max_item_count = 3,
      option = {
          keep_all_entries = false,
          enable_in_context = function()
              return true
          end,
          preselect_correct_word = true,
      },
      },
      { name = 'nvim_lsp', keyword_length = 1 },
      { name = 'buffer', keyword_length = 3, max_item_count = 3 },
      { name = 'path', keyword_length = 1 },
      { name = "dictionary", keyword_length = 5, max_item_count = 3},
  --{ name = 'luasnip', keyword_length = 3 },
  }
})

require("cmp_dictionary").setup({
    paths = { "/usr/share/dict/words" },
    exact_length = 5,
})

lsp.set_preferences({
    suggest_lsp_servers = false,
    sign_icons = {
        error = 'E',
        warn = 'W',
        hint = 'H',
        info = 'I'
    }
})

lsp.on_attach(function(client, bufnr)
  local opts = {buffer = bufnr, remap = false}

  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set("n", "<leader>i", function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
  vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
  vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
  vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
  vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
  vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
  vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
  vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)


lsp.setup()
--vim.lsp.enable('lua')
--v
--vim.

vim.diagnostic.config({
    virtual_text = true
})

