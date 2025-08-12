local lsps = {
    'lua_ls',
    'pyright',
    'ltex',
    'ocamllsp',
    'rust_analyzer',
    'bash-language-server',
}
local linters = {}
local formatters = { 'stylua', 'shfmt', 'ocamlformat' }

local installs = {}

-- vim.list_extend(installs, lsps)
-- vim.list_extend(installs, linters)
-- vim.list_extend(installs, formatters)
return {
    {
        "nvim-treesitter/nvim-treesitter",
        branch = 'master',
        lazy = false,
        build = ":TSUpdate",
        config = function()
            local treesitter = require('nvim-treesitter.configs')
            treesitter.setup({
                auto_install = true
            })
        end
    },
    {
        "mason-org/mason.nvim",
        opts = {}
    },
    {
        "mason-org/mason-lspconfig.nvim",
        opts = {
            ensure_installed = lsps
        }
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local capabilities = require('cmp_nvim_lsp').default_capabilities()

            for _, lsp in ipairs(lsps) do
                vim.lsp.enable(lsp)
                vim.lsp.config(lsp, { capabilities = capabilities })
            end

            vim.lsp.config('lua_ls',
                {
                    settings = {
                        Lua = {
                            diagnostics = { globals = { 'vim' } },
                            workspace = { library = vim.api.nvim_get_runtime_file("", true) }
                        }
                    }
                })
            -- require('lspconfig').lua_ls.setup({
            --     capabilities = require('cmp_nvim_lsp').default_capabilities(),
            --     settings = {
            --         Lua = {
            --             runtime = { version = 'LuaJIT' },
            --             diagnostics = { globals = { 'vim' } },
            --             workspace = {
            --                 library = vim.api.nvim_get_runtime_file("", true),
            --                 checkThirdParty = false,
            --             },
            --         },
            --     },
            -- })

            -- vim.lsp.enable('pyright')
            -- vim.lsp.config('pyright', { capabilities = capabilities })
            -- vim.lsp.enable('lua_ls')
            -- vim.lsp.config('lua_ls', { capabilities = capabilities })
            -- vim.lsp.enable('ltex')
            -- vim.lsp.config('ltex', { capabilities = capabilities })

            -- vim.lsp.config('ltex', {
            --     filetypes = {
            --         "lua", "python", "javascript", "typescript", "rust", "go",
            --         "markdown", "tex", "text", "gitcommit"
            --     },
            --     settings = {
            --         ltex = {
            --             language = "en-US",
            --             additionalLanguages = { "de-DE" },
            --             enabledScopes = { "comments", "strings", "documentation" },
            --         }
            --     }
            -- })

            vim.api.nvim_create_autocmd('LspAttach', {
                group = vim.api.nvim_create_augroup('UserLspConfig', {}),
                callback = function(ev)
                    local opts = { buffer = ev.buf }

                    vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)
                    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
                    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
                    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
                    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
                    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
                    -- vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
                    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
                    vim.api.nvim_create_autocmd('BufWritePre', {
                        callback = function()
                            vim.lsp.buf.format()
                        end
                    })
                    -- vim.keymap.set('n', '<leader>f', function()
                    --     vim.lsp.buf.format { async = true }
                    -- end, opts)
                end
            })
            local langaage = 0
        end
    },
    {
        "nvimtools/none-ls.nvim",
        config = function()
            local null_ls = require('null-ls')

            local builtins = {
                null_ls.builtins.completion.spell
            }
            for _, name in ipairs(formatters) do
                local ok, formatter = pcall(function()
                    return null_ls.builtins.formatting[name]
                end)
                if ok and formatter then
                    vim.list_extend(builtins, formatter)
                else
                    vim.notify("Formatter not found: " .. name, vim.log.levels.WARN)
                end
            end

            null_ls.setup({
                sources = builtins
            })
        end
    }
}
