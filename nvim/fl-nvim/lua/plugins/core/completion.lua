local cmp_kinds = {
  Text = "",
  Method = "",
  Function = "",
  Constructor = "",
  Field = "",
  Variable = "",
  Class = "",
  Interface = "",
  Module = "",
  Property = "",
  Unit = "",
  Value = "",
  Enum = "",
  Keyword = "",
  Snippet = "",
  Color = "",
  File = "",
  Reference = "",
  Folder = "",
  EnumMember = "",
  Constant = "",
  Struct = "",
  Event = "",
  Operator = "",
  TypeParameter = "",
  Copilot = "",
}

-- local base_keymap = {
--   ["<C-a>"] = { "select_and_accept", "fallback" },
--   ["<C-j>"] = { "show", "select_next", "fallback" },
--   ["<C-k>"] = { "show", "select_prev" },
--   ["<Up>"] = { "select_prev", "fallback" },
--   ["<Down>"] = { "select_next", "fallback" },
--   ["<C-x>"] = { "cancel" },
--   ["<C-h>"] = {
--     function(cmp)
--       if cmp.is_visible() then
--         cmp.hide()
--       else
--         cmp.show()
--       end
--     end,
--   },
-- }
local base_keymap = {
  ["<CR>"] = { "select_and_accept", "fallback" },
  ["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
  ["<C-j>"] = { "show", "select_next", "fallback" },
  ["<C-k>"] = { "show", "select_prev" },
  ["<Up>"] = { "select_prev", "fallback" },
  ["<Down>"] = { "select_next", "fallback" },
  ["<C-x>"] = { "cancel" },
  ["<C-h>"] = {
    function(cmp)
      if cmp.is_visible() then
        cmp.hide()
      else
        cmp.show()
      end
    end,
  },
}

plugin("blink-compat"):dep_of("blink.cmp"):on_require "blink.compat"

local tmp_line = nil
plugin("blink.cmp"):event_defer():event_typing():on_require("blink"):opts {
  appearance = { nerd_font_variant = "mono" },
  snippets = { preset = "luasnip" },
  sources = {
    default = { "lsp", "path", "snippets", "buffer" },
    per_filetype = {
      lua = { inherit_defaults = true, "lazydev" },
      sql = { "dbee", "buffer" },
    },
    providers = {
      -- dont show LuaLS require statements when lazydev has items
      -- lsp = { fallbacks = { "lazydev" } },
      lazydev = { name = "LazyDev", module = "lazydev.integrations.blink", score_offset = 100 },
      dbee = { name = "cmp-dbee", module = "blink.compat.source" },
    },
  },
  keymap = vim.tbl_deep_extend("keep", {
    preset = "none",
    ["<C-d>"] = { "show_documentation", "hide_documentation" },
    ["<C-s>"] = { "show_signature", "hide_signature" },
    ["<C-l>"] = {
      function(cmp)
        if cmp.is_visible() then cmp.hide() end
        require("copilot.suggestion").next()
      end,
    },
    ["<C-n>"] = { "snippet_forward", "fallback" },
    ["<C-p>"] = { "snippet_backward" },
  }, base_keymap),
  signature = {
    enabled = true,
    window = { border = "rounded", show_documentation = true },
  },
  completion = {
    list = {
      selection = { preselect = true, auto_insert = false },
    },
    accept = {
      auto_brackets = { enabled = true },
    },
    documentation = {
      auto_show = true,
      auto_show_delay_ms = 100,
      window = { border = "rounded" },
    },
    ghost_text = { enabled = true },
    menu = {
      border = "rounded",
      auto_show = true,
      scrollbar = false,
      draw = {
        columns = {
          { "kind_icon", "label", gap = 2 },
          { "kind" },
        },
        components = {
          kind_icon = {
            text = function(ctx) return (cmp_kinds[ctx.kind] or ctx.kind_icon) .. ctx.icon_gap end,
          },
          kind = {
            text = function(ctx) return "(" .. ctx.kind .. ")" end,
            highlight = function(_) return "Comment" end,
          },
        },
      },
    },
  },
  cmdline = {
    completion = { menu = { auto_show = false } },
    keymap = vim.tbl_deep_extend("force", base_keymap, {
      preset = "none",
      ["<Tab>"] = {
        function(cmp)
          if cmp.show_and_insert() then
            local ctx = cmp.get_context()
            tmp_line = ctx.line
            return true
          end
        end,
        function(cmp)
          if cmp.is_active() and cmp.is_ghost_text_visible() then
            local ctx = cmp.get_context()
            if ctx.line == tmp_line then return false end

            local list = require "blink.cmp.completion.list"
            vim.schedule(function()
              list.select(list.selected_item_idx, { auto_insert = true })
              tmp_line = ctx.line
            end)

            return true
          end
        end,
        "select_next",
      },
      ["<CR>"] = {
        -- function(cmp)
        --   if vim.fn.getcmdtype() == ":" then return cmp.select_and_accept() end
        -- end,
        "fallback",
      },
      ["<C-h>"] = {
        function(cmp)
          if cmp.is_ghost_text_visible() then
            cmp.show()
          else
            if cmp.is_visible() then
              cmp.hide()
            else
              cmp.show()
            end
          end
        end,
      },
    }),
  },
  fuzzy = { implementation = "prefer_rust_with_warning" },
}
