return {
  {
    "mason-org/mason.nvim",
    opts = {}
  },
  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = { "mason-org/mason.nvim" },
    lazy = false,
    opts = {
      ensure_installed = {
        "ts_ls", 
        "gopls",    
        "html",
        "cssls",
        "dockerls",
        "eslint",
      },
      automatic_installation = true,
      handlers = {
        function(server_name)
          require("lspconfig")[server_name].setup({})
        end
      }
    },
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    dependencies = { "mason-org/mason-lspconfig.nvim" },
    config = function()
        vim.diagnostic.config({
        virtual_text = true,
        signs = true,
        underline = true,
        update_in_insert = false,
        severity_sort = true,
      })

      vim.o.updatetime = 250
      vim.cmd [[autocmd CursorHold * lua vim.diagnostic.open_float(nil, {focus=false})]]
    end, 
}
}
