require('gitsigns').setup {
  signs = {
    add = { text = '+' },
    change = { text = '~' },
    delete = { text = '_' },
    topdelete = { text = '‾' },
    changedelete = { text = '~' },
  },
  current_line_blame = false,
  on_attach = function(bufnr)
    local gs = package.loaded.gitsigns

    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end

    -- Navigation []d will jump to previous and next changes
    map('n', ']c', function()
      if vim.wo.diff then return ']c' end
      vim.schedule(function() gs.next_hunk() end)
      return '<Ignore>'
    end, {expr=true})

    map('n', '[c', function()
      if vim.wo.diff then return '[c' end
      vim.schedule(function() gs.prev_hunk() end)
      return '<Ignore>'
    end, {expr=true})

    -- Actions
    -- Stage current hunk
    map({'n', 'v'}, '<leader>hs', ':Gitsigns stage_hunk<CR>')
    -- Locally undo hunk. Use this to undo spesific parts of a line
    map({'n', 'v'}, '<leader>hr', ':Gitsigns reset_hunk<CR>')
    -- Stage undo hunk
    map('n', '<leader>hu', gs.undo_stage_hunk)
    -- Preview changes in current hunk
    map('n', '<leader>hp', gs.preview_hunk)
    -- shows last commit for line
    map('n', '<leader>hb', function() gs.blame_line{full=false} end)
    -- Shows blame for current line
    map('n', '<leader>tb', gs.toggle_current_line_blame)
    map('n', '<leader>hd', gs.diffthis)
    map('n', '<leader>hD', function() gs.diffthis('~') end)
    -- td shows us older versions, hitting td again will hide it
    map('n', '<leader>td', gs.toggle_deleted)

    -- Text object
    --    map({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
end
}
