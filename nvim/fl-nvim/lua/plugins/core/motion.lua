local hop = require "internal.hop"
plugin("hop.nvim")
  :event_defer()
  :on_require("hop")
  :keys({
    kmap({ "n", "x" }, "<M-s>", hop.hop_word, "Hop"),
    kmap({ "n", "x" }, "<M-S>", hop.hop_char_global, "Jump Char"),
    kmap({ "n", "x" }, "f", hop.hop_char_line(), "Hop Char l-AC"),
    kmap({ "n", "x" }, "F", hop.hop_char_line(false), "Hop Char l-BC"),
    kmap({ "n", "x" }, "t", hop.hop_char_line(true, -1), "Hop Before Char l-AC"),
    kmap({ "n", "x" }, "T", hop.hop_char_line(false, 1), "Hop After Char l-BC"),
    kmap("v", "z;", kcmd "HopLine", "Hop Line"),
    kmap("n", "z;", kcmd "HopLineStart", "Hop Line Start"),
    kmap("n", "z/", kcmd "HopPattern", "Hop Pattern"),
  })
  :setup(function()
    ---@diagnostic disable-next-line: deprecated
    local fg = vim.api.nvim_get_hl_by_name("Constant", true).foreground
    vim.api.nvim_set_hl(0, "HopNextKey", { fg = fg, bold = true, underline = true })
    vim.api.nvim_set_hl(0, "HopNextKey1", { fg = fg, bold = true, underline = true })
    vim.api.nvim_set_hl(0, "HopNextKey2", { fg = fg, bold = true })
  end)

plugin("flash.nvim")
  :event_defer()
  :opts({
    modes = {
      char = {
        enabled = false,
      },
      treesitter = {
        highlight = {
          backdrop = true,
        },
      },
    },
  })
  :keys({
    kmap("v", "v", function() require("flash").treesitter() end, "Treesitter"),
    kmap("v", "/", function() require("flash").treesitter_search() end, "Treesitter Search"),
  })
  :setup(function()
    ---@diagnostic disable-next-line: deprecated
    local fg = vim.api.nvim_get_hl_by_name("Constant", true).foreground
    vim.api.nvim_set_hl(0, "FlashLabel", { fg = fg, bold = true, underline = true })
  end)

-- TODO:
-- plugin("smart-motion"):opts {
--   presets = {
--     words = true, -- w, b, e, ge
--     lines = true, -- j, k
--     search = true, -- s, f, F, t, T, ;, ,, gs
--     delete = true, -- d, dt, dT, rdw, rdl
--     yank = true, -- y, yt, yT, ryw, ryl
--     change = true, -- c, ct, cT
--     paste = true, -- p, P
--     treesitter = true, -- ]], [[, ]c, [c, ]b, [b, daa, caa, yaa, dfn, cfn, yfn, saa
--     diagnostics = true, -- ]d, [d, ]e, [e
--     git = true, -- ]g, [g
--     quickfix = true, -- ]q, [q, ]l, [l
--     marks = true, -- g', gm
--     misc = true, -- . g. g0 g1-g9 gp gP gA-gZ gmd gmy (repeat, history, pins, global pins)
--   },
-- }

-- plugin("harpoon"):event_defer():config(false):keys {
--   kmap("n", "<M-m>", function() require("harpoon"):list():add() end, "Mark"),
--   kmap("n", "<M-M>", function() require("harpoon"):list():remove() end, "Unmark"),
--   kmap(
--     "n",
--     "<M-e>",
--     function() require("harpoon").ui:toggle_quick_menu(require("harpoon"):list(), { border = "rounded" }) end,
--     "Harpoon List"
--   ),
--   kmap("n", "<M-1>", function() require("harpoon"):list():select(1) end, "Goto Harpoon Mark(1)"),
--   kmap("n", "<M-2>", function() require("harpoon"):list():select(2) end, "Goto Harpoon Mark(2)"),
--   kmap("n", "<M-3>", function() require("harpoon"):list():select(3) end, "Goto Harpoon Mark(3)"),
--   kmap("n", "<M-4>", function() require("harpoon"):list():select(4) end, "Goto Harpoon Mark(4)"),
--   kmap("n", "<M-5>", function() require("harpoon"):list():select(5) end, "Goto Harpoon Mark(5)"),
--   kmap("n", "<M-6>", function() require("harpoon"):list():select(6) end, "Goto Harpoon Mark(6)"),
--   kmap("n", "<M-7>", function() require("harpoon"):list():select(7) end, "Goto Harpoon Mark(7)"),
--   kmap("n", "<M-8>", function() require("harpoon"):list():select(8) end, "Goto Harpoon Mark(8)"),
--   kmap("n", "<M-9>", function() require("harpoon"):list():select(9) end, "Goto Harpoon Mark(9)"),
-- }

-- FIXME: conflict with hop & illuminate
-- plugin("nvim-better-n"):event_defer()

plugin("arrow.nvim"):opts {
  show_icons = true,
  leader_key = "<C-m>", -- Equivalent to 'Enter'
  buffer_leader_key = "m",
  hide_handbook = false,
  hide_buffer_handbook = true,
  mappings = {
    clear_all_items = "S",
    open_vertical = "|",
    open_horizontal = "\\",
  },
  window = {
    border = "rounded",
  },
  save_key = "git_root",
}
