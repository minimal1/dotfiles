return {
  'kevinhwang91/nvim-ufo',
  dependencies = 'kevinhwang91/promise-async',
  event = 'BufReadPost',
  config = function()
    require('ufo').setup({
      provider_selector = function()
        return { 'treesitter', 'indent' }
      end
    })
  end
}

