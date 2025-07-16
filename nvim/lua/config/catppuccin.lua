require("catppuccin").setup({
  flavour = "mocha",
  transparent_background = false,
  integrations = {
    treesitter = true,
    gitsigns = true,
  },
})

vim.cmd.colorscheme("catppuccin")
