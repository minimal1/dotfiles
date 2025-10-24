return {
  'stevearc/conform.nvim',
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  keys = {
    {
      "<leader>r", -- leader + r로 수동 포맷팅
      function()
        require("conform").format({ async = true, lsp_fallback = true })
      end,
      desc = "Format buffer",
    },
  },
  config = function()
    require('conform').setup({
      -- 저장 시 자동 포맷팅
      format_on_save = {
        timeout_ms = 500,
        lsp_fallback = true,
      },
      -- 파일 타입별 포맷터 설정
      formatters_by_ft = {
        -- LSP 서버 기반
        lua = { "stylua" },
        go = { "goimports", "gofmt" },
        rust = { "rustfmt" },
        kotlin = { "ktlint" },

        -- TypeScript LSP 기반 (ts_ls)
        javascript = { "prettierd", "prettier", stop_after_first = true },
        typescript = { "prettierd", "prettier", stop_after_first = true },
        javascriptreact = { "prettierd", "prettier", stop_after_first = true },
        typescriptreact = { "prettierd", "prettier", stop_after_first = true },

        -- 기타 파일 타입들
        json = { "prettierd", "prettier", stop_after_first = true },
        yaml = { "prettierd", "prettier", stop_after_first = true },
        css = { "prettierd", "prettier", stop_after_first = true },
        html = { "prettierd", "prettier", stop_after_first = true },
        markdown = { "prettierd", "prettier", stop_after_first = true },
      },
    })
  end
}
