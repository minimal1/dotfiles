return {
  'akinsho/bufferline.nvim',
  version = "*",
  dependencies = 'nvim-tree/nvim-web-devicons',
  config = function()
    require("bufferline").setup {
      options = {
        themable = true,
        numbers = "ordinal",
        indicator = {
          icon = "|",
          style = 'icon'
        },
        max_name_length = 18,
        max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
        truncate_names = true,
        tab_size = 18,
        diagnostics = "nvim_lsp",
        diagnostics_update_in_insert = false, -- only applies to coc
        diagnostics_update_on_event = true,   -- use nvim's diagnostic handler
        -- The diagnostics indicator can be set to nil to keep the buffer name highlight but delete the highlighting
        diagnostics_indicator = function(count, level, diagnostics_dict, context)
          local s = ""

          for e, n in pairs(diagnostics_dict) do
            local sym = e == "error" and " "
                or (e == "warning" and " " or " ")
            s = s .. " " .. sym .. n
          end
          return s
        end,
        separator_style = "slope",
        always_show_bufferline = true,
        offsets = {
          {
            filetype = "NvimTree",
            text = "File Explorer",
            highlight = "Directory",
            text_align = "left"
          }
        }
      }
    }

    local function smart_buffer_delete(force)
      local current_buf = vim.api.nvim_get_current_buf()
      local buffers = vim.tbl_filter(function(buf)
        return vim.api.nvim_buf_is_loaded(buf) and vim.bo[buf].buflisted
      end, vim.api.nvim_list_bufs())

      -- modified 상태 체크 (force가 false일 때만)
      if not force and vim.bo[current_buf].modified then
        print("Buffer has unsaved changes. Use force delete or save first.")
        return
      end

      local delete_cmd = force and 'bdelete!' or 'bdelete'

      if #buffers > 1 then
        vim.cmd('bnext | ' .. delete_cmd .. ' #')
      else
        vim.cmd(delete_cmd)
      end
    end



    -- keymap
    vim.keymap.set('n', '<Tab>', ':BufferLineCycleNext<CR>', { silent = true })
    vim.keymap.set('n', '<S-Tab>', ':BufferLineCyclePrev<CR>', { silent = true })

    vim.keymap.set('n', '<leader>bd', function() smart_buffer_delete(false) end, { silent = true }) -- 버퍼가 1개남았다면 그냥 종료하는 게 맞음
    vim.keymap.set('n', '<leader>bq', function() smart_buffer_delete(true) end, { silent = true })
    vim.keymap.set('n', '<leader>bo', ':BufferLineCloseOthers<CR>', { silent = true })
    vim.keymap.set('n', '<leader>ba', ':%bdelete<CR>', { silent = true })
  end
}
