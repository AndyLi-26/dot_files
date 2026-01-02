-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd.packadd('packer.nvim')

return require('packer').startup(
    function(use)
        -- Packer can manage itself
        use 'wbthomason/packer.nvim'

        use {
            'nvim-telescope/telescope.nvim', tag = '0.1.3',
            -- or                            , branch = '0.1.x',
            requires = { {'nvim-lua/plenary.nvim'} }
        }

        use({
            --'rose-pine/neovim',
            --as = 'rose-pine',
            'fabius/molokai.nvim',
            requires={
                {'rktjmp/lush.nvim'},
            }
            --config = function()
                --  vim.Cmd('colorscheme rose-pine')
                --end
            })

            use({
                "folke/trouble.nvim",
                config = function()
                    require("trouble").setup {
                        icons = false,
                        -- your configuration comes here
                        -- or leave it empty to use the default settings
                        -- refer to the configuration section below
                    }
                end
            })


            --neogit
            use {
                "NeogitOrg/neogit",
                requires={
                    {"nvim-lua/plenary.nvim"},         -- required
                    {"sindrets/diffview.nvim"},        -- optional - Diff integration

                    -- Only one of these is needed, not both.
                    {"nvim-telescope/telescope.nvim"}, -- optional
                    --"ibhagwan/fzf-lua",              -- optional
                },
                branch='nightly',
                --keys = { {"n", "<leader>gn", function() require('neogit').open() end, "Neogit" } },
                --opts = { graph_style = "unicode", }
            }

        use {
            'nvim-treesitter/nvim-treesitter',
            run = function()
                local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
                ts_update()
            end,
        }
        use("nvim-treesitter/playground")
        --use("theprimeagen/harpoon")
        use("theprimeagen/refactoring.nvim")
        use("mbbill/undotree")
        use("tpope/vim-fugitive")
        --use("junegunn/rainbow_parentheses.vim")
        --use("tpope/vim-fugitive")
        use("lervag/vimtex")
        use("nvim-treesitter/nvim-treesitter-context");


        use("folke/zen-mode.nvim")
        use("github/copilot.vim")
        use("eandrju/cellular-automaton.nvim")
        use("laytan/cloak.nvim")
        use("preservim/nerdtree")
        use('christoomey/vim-tmux-navigator')
        use {
            'VonHeikemen/lsp-zero.nvim',
            branch = 'v1.x',
            requires = {
                -- LSP Support
                {'neovim/nvim-lspconfig',
            tag="v2.*",},
                {'williamboman/mason.nvim'},
                {'williamboman/mason-lspconfig.nvim'},

                -- Autocompletion
                {'hrsh7th/nvim-cmp'},
                {'hrsh7th/cmp-buffer'},
                {'hrsh7th/cmp-path'},
                {'saadparwaiz1/cmp_luasnip'},
                {'hrsh7th/cmp-nvim-lsp'},
                {'hrsh7th/cmp-nvim-lua'},

                -- Snippets
                {'L3MON4D3/LuaSnip'},
                {'rafamadriz/friendly-snippets'},
            }
        }
        use('f3fora/cmp-spell')
        use('uga-rosa/cmp-dictionary')
        use {
            'stevearc/aerial.nvim',
            requires = {
                'nvim-treesitter/nvim-treesitter', -- optional, for better symbols
                'nvim-tree/nvim-web-devicons'      -- optional, for icons
            }
        }


    end
)
--use {
    --    "lukas-reineke/indent-blankline.nvim",
    --    config = function()
        --        opts = {}
        --        -- Other blankline configuration here
        --        require("ibl").setup(require("indent-rainbowline").make_opts(opts,{
            --            -- How transparent should the rainbow colors be. 1 is completely opaque, 0 is invisible. 0.07 by default
            --            color_transparency = 0.35,
            --            -- The 24-bit colors to mix with the background. Specified in hex.
            --            -- { 0xffff40, 0x79ff79, 0xff79ff, 0x4fecec, } by default
            --            colors = { 0xff0000, 0x00ff00, 0x0000ff, },
            --        }))
            --    end,
            --    requires = {
                --        "TheGLander/indent-rainbowline.nvim",
                --    },
                --}
                --

