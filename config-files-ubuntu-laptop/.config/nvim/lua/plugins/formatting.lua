return {
    "stevearc/conform.nvim",
    opts = {
        -- Define preferred formatters for each filetype
        formatters_by_ft = {
            -- Web-dev: prefer prettierd for speed, fallback to prettier)
            javascript = { "prettierd", "prettier" },
            typescript = { "prettierd", "prettier" },
            javascriptreact = { "prettierd", "prettier" },
            typescriptreact = { "prettierd", "prettier" },
            css = { "prettierd", "prettier" },
            html = { "prettierd", "prettier" },
            markdown = { "prettierd", "prettier" },
            graphql = { "prettierd", "prettier" },
            vue = { "prettierd", "prettier" },
            scss = { "prettierd", "prettier" },
            less = { "prettierd", "prettier" },

            -- Config files
            toml = { "taplo" },
            lua = { "stylua" },
            json = { "prettierd", "prettier" },
            jsonc = { "prettierd", "prettier" },
            yaml = { "prettierd", "prettier" },

            -- C/C++
            c = { "clang_format" },
            cpp = { "clang_format" },
            -- Go, Rust, Dart
            go = { "goimports", "gofumpt" },
            rust = { "rustfmt" },
            dart = { "dart_format" },


        },
        -- You can configure individual formatters if they need specific commands or arguments
        formatters = {
            clang_format = {
                -- command = "clang-format", -- Mason typically handles finding this.
                -- args = { "-style=file", "--fallback-style=llvm" }, -- Example arguments
            },
            prettierd = {
                -- command = "prettierd",
                -- args = { "--parser", "typescript" }, -- Example arg for prettierd
            },
            prettier = {
                -- command = "prettier",
                -- args = { "--parser", "typescript" }, -- Example arg for prettier
            },
        },
    },
}
