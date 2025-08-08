-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Language-specific keybindings
local map = vim.keymap.set

-- -- Go specific
-- map("n", "<leader>gie", "<cmd>GoIfErr<cr>", { desc = "Go if err" })
-- map("n", "<leader>gat", "<cmd>GoAddTag<cr>", { desc = "Go add tag" })
-- map("n", "<leader>grt", "<cmd>GoRmTag<cr>", { desc = "Go remove tag" })
-- map("n", "<leader>gtf", "<cmd>GoTestFunc<cr>", { desc = "Go test function" })
-- map("n", "<leader>gta", "<cmd>GoTestAll<cr>", { desc = "Go test all" })

-- -- Flutter specific
-- map("n", "<leader>fq", "<cmd>FlutterQuit<cr>", { desc = "Flutter quit" })
-- map("n", "<leader>fr", "<cmd>FlutterReload<cr>", { desc = "Flutter reload" })
-- map("n", "<leader>fR", "<cmd>FlutterRestart<cr>", { desc = "Flutter restart" })
-- map("n", "<leader>fd", "<cmd>FlutterDevices<cr>", { desc = "Flutter devices" })

-- -- C++ specific
-- map("n", "<leader>ch", "<cmd>ClangdSwitchSourceHeader<cr>", { desc = "Switch header/source" })

-- -- Package.json (Node.js)
-- map("n", "<leader>ns", "<cmd>lua require('package-info').show()<cr>", { desc = "Show package info" })
-- map("n", "<leader>nc", "<cmd>lua require('package-info').hide()<cr>", { desc = "Hide package info" })
-- map("n", "<leader>nu", "<cmd>lua require('package-info').update()<cr>", { desc = "Update package" })
