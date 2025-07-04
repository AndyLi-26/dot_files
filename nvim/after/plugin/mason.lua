local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
    -- see :help lsp-zero-keybindings
    -- to learn the available actions
    lsp_zero.default_keymaps({buffer = bufnr})
end)

require('mason').setup({})
require('mason-lspconfig').setup({
    -- Replace the language servers listed here
    -- with the ones you want to install
    ensure_installed = {'ts_ls', 'rust_analyzer','pyright','clangd','bashls','lua_ls'},
    handlers = {
        function(server_name)
            require('lspconfig')[server_name].setup({})
        end,
    },
})
