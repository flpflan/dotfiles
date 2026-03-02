plugin("better-escape.nvim"):on_require("better_escape"):event_defer():opts {
  default_mappings = true,
  mappings = {
    i = {
      [";"] = {
        [";"] = "<Esc>A;<Esc>",
      },
      [" "] = {
        ["<tab>"] = function()
          -- Defer execution to avoid side-effects
          vim.defer_fn(function()
            -- set undo point
            vim.o.ul = vim.o.ul
            require("luasnip").expand_or_jump()
          end, 1)
        end,
      },
    },
  },
}

-- TODO: :vsplit term://bash or :terminal
-- TODO: move line

-- TODO: organise keymaps
-- vim.keymap.set("n", "<leader>", "<cmd>WhichKey ,<cr>", { desc = "Buffer Local Keymaps (which-key)" })

require("which-key").setup {
  --  layout = {
  --    align = "center",
  --    spacing = 5,
  --   },
  win = {
    border = "rounded",
  },
  icons = {
    mappings = true,
  },
  defer = function(ctx)
    if vim.list_contains({ "d", "y", "v" }, ctx.operator) then return true end
    return vim.list_contains({ "<C-V>", "V" }, ctx.mode)
  end,
}

kmap("n", "]r", function() require("illuminate")["goto_next_reference"](false) end, "Next reference")
kmap("n", "[r", function() require("illuminate")["goto_prev_reference"](false) end, "Previous reference")

-- local groups = {
--     { "<leader>b", group = "Buffers" },
--     { "<leader>g", group = "Git" },
--     { "<leader>l", group = "LSP" },
--     { "<leader>n", group = "Neorg" },
--     { "<leader>p", group = "Plugins" },
--     { "<leader>s", group = "Sessions" },
--     { "<leader>t", group = "Toggle" },
--     { "<leader>w", group = "Windows" },
--     { ">", group = "Move Next" },
--     { "<", group = "Move Before" },
-- }
--
-- local g_lsp = {
--     { "<leader>ld", group = "Diagnostics" },
--     { "<leader>lg", group = "Goto" },
-- }
--
-- local g_neorg = {
--     { "<leader>nm", group = "Metadata" },
--     { "<leader>no", group = "ToC" },
-- }
--
-- wk.add(groups)
-- wk.add(g_lsp)
-- wk.add(g_neorg)

-- Permanent Toggle Relative Line Numbers
vim.keymap.set('n', '<leader>uN', function()
  if vim.o.relativenumber then
    -- Switch to static line numbers
    vim.o.relativenumber = false
    -- vim.notify('Switched to absolute line numbers', vim.log.levels.INFO, { title = 'Option' })
  else
    -- Switch to relative line numbers
    vim.o.relativenumber = true
    -- vim.notify('Switched to relative line numbers', vim.log.levels.INFO, { title = 'Option' })
  end
end, { desc = 'Toggle Rel/Abs Line Numbers' })

local temp_relnu_toggle
-- Temporary Toggle Relative Line Numbers
vim.keymap.set('n', '<leader>un', function()
  if vim.o.relativenumber then
    -- Switch to static line numbers
    vim.o.relativenumber = false
    temp_relnu_toggle = true
    -- vim.notify('Temporarily switched to absolute line numbers', vim.log.levels.INFO, { title = 'Option' })
  else
    -- Switch to relative line numbers
    vim.o.relativenumber = true
    temp_relnu_toggle = false
    -- vim.notify('Switched to relative line numbers', vim.log.levels.INFO, { title = 'Option' })
  end
end, { desc = 'Temp Toggle Rel/Abs Line Numbers' })
vim.keymap.set({ 'n' }, '<esc>', function()
  vim.cmd 'noh'
  if vim.fn.mode() == 'n' then
    if temp_relnu_toggle and not vim.o.relativenumber then
      vim.o.relativenumber = true
      temp_relnu_toggle = false
      -- vim.notify('Re-enabled relative line numbers', vim.log.levels.INFO, { title = 'Option' })
    end
  end
  return '<esc>'
end, { expr = true, desc = 'Escape, clear hlsearch, and restore relativenumber' })
-- Autocommand to re-enable relative line numbers if they were temporarily turned off
vim.api.nvim_create_autocmd({ 'BufEnter', 'FocusGained', 'InsertLeave' }, {
  callback = function()
    if temp_relnu_toggle and not vim.o.relativenumber then
      vim.o.relativenumber = true
      -- vim.notify('Re-enabled relative line numbers', vim.log.levels.INFO, { title = 'Option' })
      temp_relnu_toggle = false
    end
  end,
})

-----------------------------------------------------------------------------------------------------------
--[[
    Modern RelOps: Context-Aware Relative Line Numbers
    See: https://www.reddit.com/r/neovim/comments/1qx9co6/modern_relops_contextaware_relative_line_numbers/
--]]
-----------------------------------------------------------------------------------------------------------

-- -- Initialize global state for persistence
-- if vim.g.RELOPS_ACTIVE == nil then
--     vim.g.RELOPS_ACTIVE = true
-- end
--
-- local function refresh_line_numbers()
--     -- Skip special buffers or non-modifiable files
--     if not vim.bo.modifiable or vim.bo.buftype ~= "" or vim.bo.filetype == "help" then
--         vim.opt_local.number = false
--         vim.opt_local.relativenumber = false
--         return
--     end
--
--     local mode = vim.api.nvim_get_mode().mode
--
--     if vim.g.RELOPS_ACTIVE then
--         -- MODERN RELOPS LOGIC: Enable relative numbers only during actions
--         local targeting_modes = {
--             ['no']  = true, -- Operator-pending
--             ['v']   = true, -- Visual
--             ['V']   = true, -- Visual Line
--             ['\22'] = true, -- Visual Block
--             ['c']   = true, -- Command-line
--         }
--         vim.opt_local.relativenumber = targeting_modes[mode] or false
--     else
--         -- STANDARD HYBRID LOGIC: Always on, except Insert mode
--         vim.opt_local.relativenumber = (mode ~= 'i')
--     end
--
--     vim.opt_local.number = true
-- end
--
-- -- Toggle Keymap
-- vim.keymap.set("n", "<leader>un", function()
--     vim.g.RELOPS_ACTIVE = not vim.g.RELOPS_ACTIVE
--     refresh_line_numbers()
--     print("RelOps Mode: " .. (vim.g.RELOPS_ACTIVE and "ENABLED" or "HYBRID"))
-- end, { desc = "Toggle Numbering Profile" })
--
-- -- Autocommands to trigger refresh
-- vim.api.nvim_create_autocmd({ "ModeChanged", "CursorMoved", "BufEnter", "BufWinEnter", "TermOpen" }, {
--     group = vim.api.nvim_create_augroup("DynamicLineNumbers", { clear = true }),
--     callback = refresh_line_numbers,
-- })
--
-- -- Trigger relative numbers when starting a count
-- for i = 1, 9 do
--     vim.keymap.set("n", tostring(i), function()
--         if vim.g.RELOPS_ACTIVE then
--             vim.opt_local.relativenumber = true
--         end
--         return swallow_key and "" or tostring(i) -- Clean return
--     end, { expr = true, silent = true })
-- end
--
-- -- Reset on ESC
-- vim.keymap.set("n", "<Esc>", function()
--     vim.cmd("nohlsearch") -- Note: Remove this if you don't want to clear highlights on ESC
--     if vim.g.RELOPS_ACTIVE then
--         vim.opt_local.relativenumber = false
--     end
--     return "<Esc>"
-- end, { expr = true, silent = true, desc = "Clear search and reset RelOps" })
