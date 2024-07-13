return {
  'mfussenegger/nvim-lint',
  -- Lazy load nvim-lint on buffer open for existing and new files
  event = { 'BufReadPre', 'BufNewFile' },
  config = function()
    local lint = require 'lint'

    lint.linters_by_ft = {
      javascript = { 'eslint_d' },
      javascriptreact = { 'eslint_d' },
      lua = { 'luacheck' },
      markdown = { 'vale' },
      typescript = { 'eslint_d' },
      typescriptreact = { 'eslint_d' },
    }

    -- Add an auto-command to lint the current buffer on insert leave
    vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
      callback = function()
        lint.try_lint()
      end,
    })
  end,
}
