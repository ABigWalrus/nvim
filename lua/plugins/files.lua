return {
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.8',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
            local telescope = require('telescope')

            telescope.setup({
                defaults = {
                    file_ignore_patterns = { "^%.git/" }, -- exclude .git folder
                },
                pickers = {
                    find_files = {
                        hidden = true
                    }
                }
            })
            local builtin = require("telescope.builtin")

            vim.keymap.set('n', '<C-P>', builtin.find_files, {})
            vim.keymap.set('n', '<leader>F', builtin.live_grep, {})
        end
    },
    {
        "mikavilpas/yazi.nvim",
        event = "VeryLazy",
        dependencies = {
            { "nvim-lua/plenary.nvim", lazy = true },
        },
        keys = {
            -- {
            -- "<leader>-",
            -- mode = { "n", "v" },
            -- "<cmd>Yazi<cr>",
            -- desc = "Open yazi at the current file",
            -- },
            {
                -- Open in the current working directory
                "<leader>e",
                "<cmd>Yazi cwd<cr>",
                desc = "Open the file manager in nvim's working directory",
            },
            -- {
            -- "<c-up>",
            -- "<cmd>Yazi toggle<cr>",
            -- desc = "Resume the last yazi session",
            -- },
        },
    },
    {
        'nvim-telescope/telescope-ui-select.nvim',
        config = function()
            require("telescope").setup {
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown {
                        }
                    }
                }
            }
            require("telescope").load_extension("ui-select")
        end
    }
}
