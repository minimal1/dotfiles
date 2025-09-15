-- diagnostic configuration
vim.diagnostic.config({
  virtual_text = true,
})

-- LSP 키맵 설정 함수
local function setup_lsp_keymaps(bufnr)
  local opts = { buffer = bufnr, silent = true }

  -- 정의로 바로 이동 (보통 하나만 있음)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, vim.tbl_extend('force', opts, { desc = "Go to definition" }))

  -- 참조는 telescope로 (보통 여러 개)
  vim.keymap.set('n', 'gr', '<cmd>Telescope lsp_references<cr>',
    vim.tbl_extend('force', opts, { desc = "Go to references" }))

  -- 구현으로 바로 이동
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, vim.tbl_extend('force', opts, { desc = "Go to implementation" }))

  -- 타입 정의로 이동
  vim.keymap.set('n', 'gD', vim.lsp.buf.type_definition,
    vim.tbl_extend('force', opts, { desc = "Go to type definition" }))

  -- 선언으로 이동
  vim.keymap.set('n', '<leader>gd', vim.lsp.buf.declaration,
    vim.tbl_extend('force', opts, { desc = "Go to declaration" }))

  -- 문서 심볼 검색
  vim.keymap.set('n', '<leader>ds', '<cmd>Telescope lsp_document_symbols<cr>',
    vim.tbl_extend('force', opts, { desc = "Document symbols" }))

  -- 시그니처 도움말 (매개변수 정보)
  vim.keymap.set('n', '<leader>sh', vim.lsp.buf.signature_help,
    vim.tbl_extend('force', opts, { desc = "Signature help" }))
  vim.keymap.set('i', '<C-h>', vim.lsp.buf.signature_help, vim.tbl_extend('force', opts, { desc = "Signature help" }))

  -- 이름 변경
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, vim.tbl_extend('force', opts, { desc = "Rename symbol" }))

  -- 코드 액션
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, vim.tbl_extend('force', opts, { desc = "Code actions" }))
end

-- LSP attach 시 키맵 설정
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(event)
    setup_lsp_keymaps(event.buf)
  end
})
