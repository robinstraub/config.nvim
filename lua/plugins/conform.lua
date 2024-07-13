return {
  'stevearc/conform.nvim',
  -- Lazy load conform on buffer open for existing and new files
  event = { 'BufReadPre', 'BufNewFile' },
  -- Define conform options
  opts = {
    formatters_by_ft = {
      css = { 'prettier' },
      html = { 'prettier' },
      javascript = { 'prettier' },
      javascriptreact = { 'prettier' },
      json = { 'prettier' },
      lua = { 'stylua' },
      markdown = { 'prettier' },
      php = { { 'pint', 'php-cs-fixer' } },
      typescript = { 'prettier' },
      typescriptreact = { 'prettier' },
      yaml = { 'prettier' },
    },
  },
  -- Customize conform bootstrapping
  config = function(_, opts)
    require('conform').setup(opts)
    -- Add an auto-command to format code on insert leave
    vim.api.nvim_create_autocmd({ 'BufWritePre', 'InsertLeave' }, {
      pattern = '*',
      callback = function(args)
        require('conform').format { bufnr = args.buf }
      end,
    })
  end,
}
