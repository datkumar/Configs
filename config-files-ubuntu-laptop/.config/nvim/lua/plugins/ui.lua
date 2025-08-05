return {

    -- Load theme:
    -- priority 1000 is ensure theme loads before LazyVim sets the colorscheme

    -- { -- Tokyo Night
    --     "folke/tokyonight.nvim",
    --     opts = {
    --         style = "night" -- storm, night, day
    --     },
    -- },
    -- { -- Gruvbox
    --     "ellisonleao/gruvbox.nvim",
    --     name = "gruvbox",
    --     priority = 1000,
    --     opts = {
    --         style = "dark",    -- "dark", "light"
    --         contrast = "hard", -- "hard", "soft" ,""
    --     }
    -- },
    -- { -- Catppuccin
    --     "catppuccin/nvim",
    --     name = "catppuccin",
    --     priority = 1000,
    --     opts = {
    --         flavour = "auto", -- latte, frappe, macchiato, mocha
    --     }
    -- },
    -- { -- Rose Pine
    --     "rose-pine/neovim",
    --     name = "rose-pine",
    --     priority = 1000,
    --     opts = {
    --         variant = "main" -- auto, main, moon, dawn
    --     }
    -- },
    -- { -- Kanagawa
    --     "rebelot/kanagawa.nvim",
    --     name     = "kanagawa",
    --     priority = 1000,
    --     opts     = {
    --         theme = "dragon", -- wave, dragon, lotus
    --     },
    -- },
    { -- One Dark
        "navarasu/onedark.nvim",
        name     = "onedark",
        priority = 1000,
        opts     = {
            -- dark, darker, cool, deep, warm, warmer, light
            style = "darker",
        },
    },


    { -- Set that theme for LazyVim
        "LazyVim/LazyVim",
        opts = {
            colorscheme = "onedark",
        }
    },
    { -- Thin Vertical column
        "lukas-reineke/virt-column.nvim",
        opts = {
            -- char = "|"
            char = "│",
            -- virtcolumn = "120",
            highlight = "DiagnosticOk"
        }
    },

    { -- A snazzy 💅 buffer line (with tabpage integration)
        "akinsho/bufferline.nvim",
        version = "*",
        dependencies = "nvim-tree/nvim-web-devicons"
    },
}
