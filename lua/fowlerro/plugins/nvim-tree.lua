return {
  "nvim-tree/nvim-tree.lua",
  lazy = false,
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function() 
    local nvimtree = require("nvim-tree")

    -- disable netrw at the very start of your init.lua
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    -- optionally enable 24-bit colour
    vim.opt.termguicolors = true

    -- empty setup using defaults
    nvimtree.setup({
      disable_netrw = true,
      hijack_netrw = true,
      update_cwd = true,
      diagnostics = {
        enable = true,
        icons = {
          hint = "",
          info = "",
          warning = "",
          error = "",
        },
      },
      view = {
        width = 35,
        relativenumber = true
      },
      renderer = {
        highlight_git = true,
        indent_markers = {
          enable = true
        },
      icons = {
          show = {
            git = true,
            file = true,
            folder = true,
            folder_arrow = false,
          },
          glyphs = {
            default = "",
            symlink = "",
            git = {
              unstaged = "",
              staged = "S",
              unmerged = "",
              renamed = "➜",
              deleted = "",
              untracked = "U",
              ignored = "◌",
            },
            folder = {
              default = "",
              open = "",
              empty = "",
              empty_open = "",
              symlink = "",
            },
          },
        },
      },
      actions = {
        open_file = {
          quit_on_open = true,
          resize_window = true,
          window_picker = {
            enable = false,
          },
        },
      },
      filters = {
        custom = { ".DS_Store" },
      },
      git = {
        ignore = false,
      },
    })

    -- keymaps
    local keymap = vim.keymap

    keymap.set("n", "<leader>e", "<cmd>NvimTreeFindFileToggle<CR>", { desc = "Toggle file explorer" })
  end
}
