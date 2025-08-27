return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  keys = {
    { "<leader>tt", "<cmd>NvimTreeToggle<cr>",   desc = "nvim-tree: Toggle" },
    { "<leader>to", "<cmd>NvimTreeOpen<cr>",     desc = "nvim-tree: Open" },
    { "<leader>tc", "<cmd>NvimTreeClose<cr>",    desc = "nvim-tree: Close" },
    { "<leader>tf", "<cmd>NvimTreeFindFile<cr>", desc = "nvim-tree: Fouse File" }
  },
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local function my_on_attach(bufnr)
      local api = require "nvim-tree.api"

      local function opts(desc)
        return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
      end

      -- default mappings
      api.config.mappings.default_on_attach(bufnr)


      -- custom mappings
      vim.keymap.del("n", "o", opts("Open"))
      vim.keymap.set("n", "l", api.node.open.edit, opts("Open"))
    end

    -- pass to setup along with your other options
    require("nvim-tree").setup {
      ---
      on_attach = my_on_attach,
      ---
      view = {
        side = 'right'
      },

      git = {
        enable = true,
        ignore = false,
      }
    }

    vim.api.nvim_create_autocmd("QuitPre", {
      callback = function()
        local invalid_win = {}
        local wins = vim.api.nvim_list_wins()
        for _, w in ipairs(wins) do
          local bufname = vim.api.nvim_buf_get_name(vim.api.nvim_win_get_buf(w))
          if bufname:match("NvimTree_") ~= nil then
            table.insert(invalid_win, w)
          end
        end
        if #invalid_win == #wins - 1 then
          -- Should quit, so we close all invalid windows.
          for _, w in ipairs(invalid_win) do vim.api.nvim_win_close(w, true) end
        end
      end
    })
  end,
}
