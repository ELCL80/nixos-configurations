return {
  "mason-org/mason-lspconfig.nvim",
  lazy = false,
  opts = {
    ensure_installed = {
      "rust_analyzer",
      "lua_ls",
      "pyright",
      "html",
      "ts_ls",
      "clangd",
      "hls"
    },
  },
  dependencies = {
    {
       "mason-org/mason.nvim",
       opts = {}
    },
    {
       "neovim/nvim-lspconfig"
    }
  }
}
