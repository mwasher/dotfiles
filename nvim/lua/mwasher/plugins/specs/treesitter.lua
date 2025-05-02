-- Configuration for tree-sitter incremental parser for improved code highlighting
-- https://github.com/nvim-treesitter/nvim-treesitter

return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  main = "nvim-treesitter.configs",

  opts = {
    ensure_installed = {
      "bash",
      "c",
      "css",
      "dockerfile",
      "diff",
      "go",
      "helm",
      "html",
      "javascript",
      "json",
      "lua",
      "luadoc",
      "markdown",
      "markdown_inline",
      "python",
      "query",
      "terraform",
      "toml",
      "vim",
      "vimdoc",
      "yaml",
    },
    auto_install = true,
    highlight = {
      enable = true,
      disable = {},
      additional_vim_regex_highlighting = {},
    },
    indent = {
      enable = true,
    },
  },
}
