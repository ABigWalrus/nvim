return {
    {
        "rebelot/kanagawa.nvim",
        config = function()
            require('kanagawa').setup({
                undercurl = true,
                transparent = true,
            })
            vim.cmd("colorscheme kanagawa")

            -- vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "NONE" })
            vim.api.nvim_set_hl(0, "TelescopeBorder", { bg = "NONE" })
            -- vim.api.nvim_set_hl(0, "TelescopePromptNormal", { bg = "NONE" })
            -- vim.api.nvim_set_hl(0, "TelescopePromptBorder", { bg = "NONE" })
            -- vim.api.nvim_set_hl(0, "TelescopePromptTitle", { bg = "NONE" })
            -- vim.api.nvim_set_hl(0, "TelescopeResultsNormal", { bg = "NONE" })
            -- vim.api.nvim_set_hl(0, "TelescopeResultsBorder", { bg = "NONE" })
            -- vim.api.nvim_set_hl(0, "TelescopeResultsTitle", { bg = "NONE" })
            -- vim.api.nvim_set_hl(0, "TelescopePreviewNormal", { bg = "NONE" })
            -- vim.api.nvim_set_hl(0, "TelescopePreviewBorder", { bg = "NONE" })
            vim.api.nvim_set_hl(0, "TelescopePreviewTitle", { bg = "NONE" })
            vim.api.nvim_set_hl(0, "FloatBorder", { bg = "NONE" })
        end
    },
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            require('lualine').setup()
        end
    },
    {
        'goolord/alpha-nvim',
        dependencies = {
            'echasnovski/mini.icons',
            'nvim-lua/plenary.nvim'
        },
        config = function()
            local dashboard = require('alpha.themes.dashboard')
            dashboard.section.header.val = {
                [[=================     ===============     ===============   ========  ========]],
                [[\\ . . . . . . .\\   //. . . . . . .\\   //. . . . . . .\\  \\. . .\\// . . //]],
                [[||. . ._____. . .|| ||. . ._____. . .|| ||. . ._____. . .|| || . . .\/ . . .||]],
                [[|| . .||   ||. . || || . .||   ||. . || || . .||   ||. . || ||. . . . . . . ||]],
                [[||. . ||   || . .|| ||. . ||   || . .|| ||. . ||   || . .|| || . | . . . . .||]],
                [[|| . .||   ||. _-|| ||-_ .||   ||. . || || . .||   ||. _-|| ||-_.|\ . . . . ||]],
                [[||. . ||   ||-'  || ||  `-||   || . .|| ||. . ||   ||-'  || ||  `|\_ . .|. .||]],
                [[|| . _||   ||    || ||    ||   ||_ . || || . _||   ||    || ||   |\ `-_/| . ||]],
                [[||_-' ||  .|/    || ||    \|.  || `-_|| ||_-' ||  .|/    || ||   | \  / |-_.||]],
                [[||    ||_-'      || ||      `-_||    || ||    ||_-'      || ||   | \  / |  `||]],
                [[||    `'         || ||         `'    || ||    `'         || ||   | \  / |   ||]],
                [[||            .===' `===.         .==='.`===.         .===' /==. |  \/  |   ||]],
                [[||         .=='   \_|-_ `===. .==='   _|_   `===. .===' _-|/   `==  \/  |   ||]],
                [[||      .=='    _-'    `-_  `='    _-'   `-_    `='  _-'   `-_  /|  \/  |   ||]],
                [[||   .=='    _-'          '-__\._-'         '-_./__-'         `' |. /|  |   ||]],
                [[||.=='    _-'                                                     `' |  /==.||]],
                [[=='    _-'                        N E O V I M                         \/   `==]],
                [[\   _-'                                                                `-_   /]],
                [[ `''                                                                      ``' ]],
                -- [[______ _____ _____   _    _  ___   _     ______ _   _ _____ ]],
                -- [[| ___ \_   _|  __ \ | |  | |/ _ \ | |    | ___ \ | | /  ___|]],
                -- [[| |_/ / | | | |  \/ | |  | / /_\ \| |    | |_/ / | | \ `--. ]],
                -- [[| ___ \ | | | | __  | |/\| |  _  || |    |    /| | | |`--. \]],
                -- [[| |_/ /_| |_| |_\ \ \  /\  / | | || |____| |\ \| |_| /\__/ /]],
                -- [[\____/ \___/ \____/  \/  \/\_| |_/\_____/\_| \_|\___/\____/ ]],
                -- [[                                                 ]],
                -- [[                                                 ]],
                -- [[                               __                ]],
                -- [[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
                -- [[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
                -- [[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
                -- [[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
                -- [[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
            }

            vim.cmd([[highlight HeaderArt guifg=#bdb9a0 guibg=NONE]])

            dashboard.section.header.opts = {
                position = "center",
                hl       = "HeaderArt"
            }

            require('alpha').setup(dashboard.config)
        end
    },
    -- {
    --     'NTBBloodbath/doom-one.nvim',
    --     config = function()
    --         -- Add color to cursor
    --         vim.g.doom_one_cursor_coloring = false
    --         -- Set :terminal colors
    --         vim.g.doom_one_terminal_colors = true
    --         -- Enable italic comments
    --         vim.g.doom_one_italic_comments = false
    --         -- Enable TS support
    --         vim.g.doom_one_enable_treesitter = true
    --         -- Color whole diagnostic text or only underline
    --         vim.g.doom_one_diagnostics_text_color = false
    --         -- Enable transparent background
    --         vim.g.doom_one_transparent_background = false
    --
    --         -- Pumblend transparency
    --         vim.g.doom_one_pumblend_enable = false
    --         vim.g.doom_one_pumblend_transparency = 20
    --
    --         -- Plugins integration
    --         vim.g.doom_one_plugin_neorg = true
    --         vim.g.doom_one_plugin_barbar = false
    --         vim.g.doom_one_plugin_telescope = false
    --         vim.g.doom_one_plugin_neogit = true
    --         vim.g.doom_one_plugin_nvim_tree = true
    --         vim.g.doom_one_plugin_dashboard = true
    --         vim.g.doom_one_plugin_startify = true
    --         vim.g.doom_one_plugin_whichkey = true
    --         vim.g.doom_one_plugin_indent_blankline = true
    --         vim.g.doom_one_plugin_vim_illuminate = true
    --         vim.g.doom_one_plugin_lspsaga = false
    --     end
    -- }
}
