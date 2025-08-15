local opts = { noremap = true, silent = true }

vim.g.mapleader = " "
vim.g.maplocalleader = " "


-- move the current selected line Up/Down (manual selection | V)
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selected lines up" }) 
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selected lines down" })

-- horizontal line mouvement
vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)

-- join line with the previous
vim.keymap.set("n", "J", "mzJ`z", { desc = "Join lines and restore cursor" })

-- line search
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- line centered search
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "move down in the buffer with cursor centered" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "move up in the buffer with cursor centered" })

--Paste without copying
vim.keymap.set("x", "<leader>p", [["_dP]])
vim.keymap.set("v", "p", '"_dP', opts)
vim.keymap.set({ "n", "v" }, "<leader>p", [["_dP]])

vim.keymap.set("i", "<C-c>", "<ESC>", { desc = "exit the insert mode" })

vim.keymap.set("n", "<C-c>", ":nohl<CR>", { desc = "clear the search highlight" })

-- | my personals edit technicaly require full line selection with V 
mvi.keymap.set("v", "d", "d", { desc = "delete a line" })
vim.keymap.set("v", "D", "yp", { desc = "duplicate a line" })

-- auto save in insert mode
vim.keymap.set("i", "<C-s>", "<ESC>:w<CR>i", { desc = "save current file"})
