return {
    {
        "folke/snacks.nvim",
        priority = 1000,
        lazy = false,
        opts = {
            quickfile = {
                enabled = true,
                exclude = { "latex" },
            },
            picker = {
                enabled = true,
                matchers = {
                    frecency = true,
                    cwd_bonus = false,
                },
                formatters = {
                    file = {
                        filename_first = false,
                        filename_only = false,
                        icon_width = 2,
                    },
                },
                layout = {
                    -- presets options : "default" , "ivy" , "ivy-split" , "telescope" , "vscode", "select" , "sidebar"
                    -- override picker layout in keymaps function as a param below
                    preset = "telescope", -- defaults to this layout unless overidden
                    cycle = false,
                },
                layouts = {
                     select = {
                        preview = false,
                        layout = {
                            backdrop = false,
                            width = 0.6,
                            min_width = 80,
                            height = 0.4,
                            min_height = 10,
                            box = "vertical",
                            border = "rounded",
                            title = "{title}",
                            title_pos = "center",
                            { win = "input", height = 1, border = "bottom" },
                            { win = "list", border = "none" },
                            { win = "preview", title = "{preview}", width = 0.6, height = 0.4, border = "top" },
                        }
                    },
                    telescope = {
                        reverse = true, -- set to false for search bar to be on top 
                        layout = {
                            box = "horizontal",
                            backdrop = false,
                            width = 0.8,
                            height = 0.9,
                            border = "none",
                            {
                                box = "vertical",
                                { win = "list", title = " Results ", title_pos = "center", border = "rounded" },
                                { win = "input", height = 1, border = "rounded", title = "{title} {live} {flags}", title_pos = "center" },
                            },
                            {
                                win = "preview",
                                title = "{preview:Preview}",
                                width = 0.50,
                                border = "rounded",
                                title_pos = "center",
                            },
                        },
                    },
                    ivy = {
                        layout = {
                            box = "vertical",
                            backdrop = false,
                            width = 0,
                            height = 0.4,
                            position = "bottom",
                            border = "top",
                            title = " {title} {live} {flags}",
                            title_pos = "left",
                            { win = "input", height = 1, border = "bottom" },
                            {
                                box = "horizontal",
                                { win = "list", border = "none" },
                                { win = "preview", title = "{preview}", width = 0.5, border = "left" },
                            },
                        },
                    }

                },
            },
            dashboard = {
                enabled = true,
                sections = {
                    -- Header Section
                    { 
                        section = "terminal", 
                        cmd = [[figlet -c -f 3D\ Diagonal "Lix's Nvim" -t | lolcat]], 
                        height = 32, 
                        enabled = true,
                        padding = 1,
                        pane = 1 -- on 1st panel
                    },

                    -- Startup Section
                    (function()
                        local cols, lines = vim.o.columns, vim.o.lines
                        return {
                            section = "startup",
                            padding = 1,
                            pane = 1
                        }
                    end)(),

                    -- Keys Section
                    (function()
                        local cols, lines = vim.o.columns, vim.o.lines
                        return {
                            section = "keys",
                            gap = 1,
                            width  = math.floor(cols * 0.5),
                            height = math.floor(lines * 0.15),
                            pane = 2, -- on 
                            padding = 1
                        }
                    end)(),
                    

                    -- Projects Section
                    (function()
                        local cols, lines = vim.o.columns, vim.o.lines
                        return {
                            pane = 2,
                            icon = " ",
                            title = "Projects",
                            section = "projects",
                            indent = 2,
                            padding = 1,
                            width  = math.floor(cols * 0.4),
                            height = math.floor(lines * 0.15)
                        }
                    end)(),

                    -- Git Status Section
                    (function()
                        local cols, lines = vim.o.columns, vim.o.lines
                        return {
                            pane = 2,
                            icon = " ",
                            title = "Git Status",
                            section = "terminal",
                            enabled = function()
                                return Snacks.git.get_root() ~= nil
                            end,
                            cmd = { "git", "status", "--short", "--branch", "--renames" },
                            padding = 1,
                            ttl = 5 * 60,
                            indent = 3,
                        }
                    end)(),

                }
            }
        },
        keys = {
            { "<leader>lg", function() require("snacks").lazygit() end, desc = "Lazygit" },
            { "<leader>gl", function() require("snacks").lazygit.log() end, desc = "Lazygit logs" },
            { "<leader>es", function() require("snacks").explorer() end, desc = "Open Snacks Explorer" },
            { "<leader>rN", function() require("snacks").rename.rename_file() end, desc = "Fast Rename Current File" },
            { "<leader>dB", function() require("snacks").bufdelete() end, desc = "Delete or Close Buffer (Confirm)" },

            -- Snack Picker
            { "<leader>pf", function() require("snacks").picker.files() end, desc = "Find Files (Snack Picker)" },
            { "<leader>pc", function() require("snacks").picker.files({ cmd = vim.fn.stdpath("config") }) end, desc = "Find Config File" },
            { "<leader>ps", function() require("snacks").picker.grep() end, desc = "Grep Word" },
            { "<leader>pws", function() require("snacks").picker.grep_word() end, desc = "Search visual selection or Word", mode = { "n", "x" } },
            { "<leader>pk", function() require("snacks").picker.keymaps({ layout = "ivy" }) end, desc = "Search Keymaps (Snacks Picker)" },

            { "<leader>gbr", function() require("snacks").picker.git_branches({ layout = "select" }) end, desc = "Pick and Switch git Branches" },
            { "<leader>th", function() require("snacks").picker.colorschemes({ layout = "ivy" }) end, desc = "Pick Colorschemes (Snack Picker)" },
            { "<leader>vh", function() require("snacks").picker.help() end, desc = "Help Pages" },
        },
    },
    {
        "folke/todo-comments.nvim",
        event = { "BufReadPre", "BufNewFile" },
        keys = {
            { "<leader>pt", function() require("snacks").picker.todo_comments() end, desc = "TODO" },
            { "<leader>pT", function() require("snacks").picker.todo_comments({ "TODO", "FIX", "FIX ME" }) end, desc = "Todo/Fix/FixMe" }
        }
    }
}
