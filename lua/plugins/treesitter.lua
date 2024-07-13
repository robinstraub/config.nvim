return { -- Highlight, edit and navigate code
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  opts = {
    -- Autoinstall languages that are not installed
    auto_install = true,
    ensure_installed = {
      'bash',
      'c',
      'diff',
      'html',
      'javascript',
      'lua',
      'luadoc',
      'markdown',
      'php',
      'phpdoc',
      'typescript',
      'vim',
      'vimdoc',
    },
    highlight = { enable = true },
    indent = { enable = true },
  },
  config = function(_, opts)
    require('nvim-treesitter.install').prefer_git = true
    require('nvim-treesitter.configs').setup(opts)
  end,
}
