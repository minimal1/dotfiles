return {
  "scottmckendry/cyberdream.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("cyberdream").setup({
      variant = 'dark',
      transparent = true,
      terminal_colors = true,
    })
    vim.cmd.colorscheme("cyberdream")
  end,
}
