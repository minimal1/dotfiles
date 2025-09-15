return {
  'WhoIsSethDaniel/mason-tool-installer.nvim',
  dependencies = { "williamboman/mason.nvim" },
  config = function()
    require("mason-tool-installer").setup({
      ensure_installed = {
        -- LSP Servers
        "lua_ls",                 -- Lua
        "gopls",                  -- Go
        "rust_analyzer",          -- Rust
        "kotlin_language_server", -- Kotlin
        "ts_ls",                  -- TypeScript/JavaScript
        "marksman",               -- Markdown
        "cssls",                  -- CSS
        "html",                   -- HTML
        "jsonls",                 -- JSON
        "yamlls",                 -- YAML

        -- Formatters
        -- rustfmt, gofmt, goimports는 각 언어 설치 시 포함되므로 제외
        "stylua",    -- lua_ls
        "prettierd", -- ts_ls, jsonls, yamlls, cssls, html, marksman
        "ktlint",    -- kotlin_language_server

        -- Linters
        -- lua, go, rust, kotlin은 LSP 자체에서 진단 제공
        "eslint_d",     -- ts_ls (JS/TS)
        "jsonlint",     -- jsonls
        "yamllint",     -- yamlls
        "stylelint",    -- cssls
        "markdownlint", -- marksman
      },
    })
  end
}
