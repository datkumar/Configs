return {

    -- Treesitter Parsers
    {
        "nvim-treesitter/nvim-treesitter",
        opts = {
            highlight = { enable = true },
            indent = { enable = true },
            ensure_installed = {
                "lua", "luadoc", "luap",
                "bash",
                "c", "cpp",
                "printf", "diff", "query", "regex", "comment",
                "markdown", "markdown_inline", "latex",
                "html", "css", "scss",
                "astro", "vue", "svelte",
                "javascript", "typescript", "tsx",
                "json", "jsonc",
                "yaml", "toml", "xml",
                "prisma", "sql",
                "python",
                "vim", "vimdoc",
                "go", "gomod", "gosum", "gowork", "gotmpl",
                "rust",

            },
        },
    },


    -- Mason: LSPs, Formatters, Linters
    {
        "williamboman/mason.nvim",
        build = ":MasonUpdate",
        opts = {
            ensure_installed = {
                -- JS-TS Web-dev
                "typescript-language-server",
                "json-lsp",
                "yaml-language-server",
                "taplo", -- TOML lsp
                "prettier",
                "prettierd",
                "eslint-lsp",
                "eslint_d",
                "tailwindcss-language-server",
                "astro-language-server",
                "prisma-language-server",
                -- C/C++
                "clangd",
                "clang-format",
                "cpptools",
                "cmake-language-server",
                -- Flutter (Dart)
                -- "dart-language-server",
                -- Go
                "gopls",
                "goimports",
                "gofumpt",
                "gomodifytags",
                "impl",
                "delve", -- Go debugger
                -- Rust
                "rust-analyzer",
                -- "rustfmt", deprecated, should be installed via rustup
            },
        },
    },

    {
        "williamboman/mason-lspconfig.nvim",
        opts = {
            automatic_installation = true,
        },
    },


    -- DAP (Debug Adapter Protocol)
    { -- Core DAP
        "mfussenegger/nvim-dap",
        dependencies = {
            "rcarriga/nvim-dap-ui",
            "theHamsta/nvim-dap-virtual-text",
            "nvim-neotest/nvim-nio",
        },
        config = function()
            local dap = require("dap")
            local dapui = require("dapui")

            -- Setup DAP UI
            dapui.setup()

            -- Setup virtual text
            require("nvim-dap-virtual-text").setup()

            -- Auto open/close DAP UI
            dap.listeners.after.event_initialized["dapui_config"] = function()
                dapui.open()
            end
            dap.listeners.before.event_terminated["dapui_config"] = function()
                dapui.close()
            end
            dap.listeners.before.event_exited["dapui_config"] = function()
                dapui.close()
            end
        end,
    },
    { -- Go DAP adapter
        "leoluz/nvim-dap-go",
        ft = "go",
        dependencies = "mfussenegger/nvim-dap",
        config = function()
            require("dap-go").setup()
        end,
    },


    { -- package.json management
        "vuki656/package-info.nvim",
        dependencies = "MunifTanjim/nui.nvim",
        config = true,
    },


    { -- Markdown Preview
        "iamcco/markdown-preview.nvim",
        cmd = {
            "MarkdownPreviewToggle",
            "MarkdownPreview",
            "MarkdownPreviewStop"
        },
        ft = { "markdown" },
        build = function() vim.fn["mkdp#util#install"]() end,
    },


    { -- Enhanced TypeScript support
        "pmizio/typescript-tools.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            -- "neovim/nvim-lspconfig"
        },
        opts = {
            settings = {
                tsserver_file_preferences = {
                    includeInlayParameterNameHints = "all",
                    includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                    includeInlayFunctionParameterTypeHints = true,
                    includeInlayVariableTypeHints = true,
                    includeInlayPropertyDeclarationTypeHints = true,
                    includeInlayFunctionLikeReturnTypeHints = true,
                    includeInlayEnumMemberValueHints = true,
                },
            },
        },
    },


    { -- Tailwind CSS support
        "hrsh7th/nvim-cmp",
        dependencies = {
            {
                "roobert/tailwindcss-colorizer-cmp.nvim",
                config = true
            },
        },
        opts = function(_, opts)
            local format_kinds = opts.formatting.format
            opts.formatting.format = function(entry, item)
                format_kinds(entry, item)
                return require("tailwindcss-colorizer-cmp").formatter(entry, item)
            end
        end,
    },


    { -- Enhanced C++ support
        "neovim/nvim-lspconfig",
        opts = {
            servers = {
                clangd = {
                    cmd = {
                        "clangd",
                        "--background-index",
                        "--clang-tidy",
                        "--header-insertion=iwyu",
                        "--completion-style=detailed",
                        "--function-arg-placeholders",
                        "--fallback-style=llvm",
                    },
                    init_options = {
                        usePlaceholders = true,
                        completeUnimported = true,
                        clangdFileStatus = true,
                    },
                },
            },
        },
    },
    { -- CMake support
        "Civitasv/cmake-tools.nvim",
        dependencies = "nvim-lua/plenary.nvim",
        config = true,
    },


    { -- Dart syntax highlighting
        "dart-lang/dart-vim-plugin",
        ft = "dart",
    },
    { -- Flutter support
        "akinsho/flutter-tools.nvim",
        lazy = false,
        dependencies = {
            "nvim-lua/plenary.nvim",
            "stevearc/dressing.nvim",
        },
        config = function()
            require("flutter-tools").setup({
                -- Adjust path as needed
                flutter_path = "/home/kumar/FlutterSdk/flutter/bin/flutter",
                debugger = {
                    enabled = true,
                    run_via_dap = true,
                },
                widget_guides = {
                    enabled = true,
                    -- Customize characters, e.g.: border_char = { "│", "─", "╭", "╮", "╯", "╰" }
                },
                dev_tools = {
                    autostart = true,          -- Automatically start DevTools server
                    auto_open_browser = false, -- Don't auto-open browser, open manually or use a keymap
                },
                lsp = {
                    color = {
                        enabled = true,
                        background = false,
                        virtual_text = true,
                    },
                    settings = {
                        showTodos = true,
                        completeFunctionCalls = true,
                        enableSnippets = true,
                    },
                },
            })
        end,
    },


    { -- Snippet Engine
        "L3MON4D3/LuaSnip",
        -- Replace <CurrentMajor> by the latest released major (first number of latest release)
        version = "v2.*",
        -- install jsregexp
        build = "make install_jsregexp"
    },
    { -- Go support
        "ray-x/go.nvim",
        dependencies = {
            "ray-x/guihua.lua",
            "neovim/nvim-lspconfig",
            "nvim-treesitter/nvim-treesitter",
        },
        config = function()
            require("go").setup({
                goimport = "gopls",
                gofmt = "gofumpt",
                -- Enable LSP
                lsp_cfg = true, -- tells go.nvim to manage gopls for you
                lsp_gofumpt = true,
                lsp_on_attach = true,
                -- Other settings
                tag_transform = "camelcase",
                dap_debug = true,
                luasnip = true,
            })
        end,
        event = { "CmdlineEnter" },
        ft = { "go", "gomod" },
        build = ':lua require("go.install").update_all_sync()',
    },


    { -- Rust support
        "mrcjkb/rustaceanvim",
        version = "^4",
        ft = { "rust" },
        config = function()
            vim.g.rustaceanvim = {
                server = {
                    settings = {
                        ["rust-analyzer"] = {
                            checkOnSave = {
                                command = "clippy",
                            },
                            imports = {
                                granularity = {
                                    group = "module",
                                },
                                prefix = "self",
                            },
                            cargo = {
                                buildScripts = {
                                    enable = true,
                                },
                            },
                            procMacro = {
                                enable = true,
                            },
                        },
                    },
                },
            }
        end,
    },
    { -- Crate management
        'saecki/crates.nvim',
        tag = 'stable',
        ft = { "rust", "toml" },
        config = function()
            require('crates').setup({
                completion = {
                    cmp = { enabled = true },
                },
            })
        end,
    },



    -- Optional: If you need to override default LSP server settings
    -- for example, to pass custom `init_options` or `settings` to a server.
    -- {
    --   "neovim/nvim-lspconfig",
    --   opts = {
    --     servers = {
    --       -- Example for tsserver:
    --       tsserver = {
    --         settings = {
    --           javascript = {
    --             preferences = {
    --               importModuleSpecifierPreference = "non-relative",
    --             },
    --           },
    --           typescript = {
    --             preferences = {
    --               importModuleSpecifierPreference = "non-relative",
    --             },
    --           },
    --         },
    --       },
    --       -- Example for clangd:
    --       clangd = {
    --         capabilities = { offsetEncoding = { "utf-16" } },
    --         -- More clangd settings: e.g., args = { "--clang-tidy", "--background-index" }
    --       },
    --     },
    --   },
    -- },
}
