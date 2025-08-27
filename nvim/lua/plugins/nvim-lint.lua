return {
  'mfussenegger/nvim-lint',
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local lint = require("lint")

    -- 파일 타입별 린터 설정
    lint.linters_by_ft = {
      -- JavaScript/TypeScript (ts_ls + eslint_d)
      javascript = { "eslint_d" },
      typescript = { "eslint_d" },
      javascriptreact = { "eslint_d" },
      typescriptreact = { "eslint_d" },

      -- 기타 파일 타입들 (선택적)
      json = { "jsonlint" },
      yaml = { "yamllint" },
      css = { "stylelint" },
      markdown = { "markdownlint" },

      -- lua, go, rust, kotlin은 LSP 진단이 충분해서 제외
    }

    -- 린팅 실행 autocommand 설정
    local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
      group = lint_augroup,
      callback = function()
        lint.try_lint()
      end,
    })

    -- 키맵 설정 (선택적)
    vim.keymap.set("n", "<leader>l", function()
      lint.try_lint()
    end, { desc = "Trigger linting for current file" })
  end,
}
