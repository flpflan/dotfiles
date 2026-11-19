-- plugin("nvim-toggler")
--   :event_defer()
--   :keys({ kmap({ "n", "x" }, "<leader>i", klazy("nvim-toggler").toggle(), "Toggle Invert") })
--   :opts {
--     remove_default_keybinds = true,
--     inverses = {
--       ["Yes"] = "No",
--       ["yes"] = "no",
--       ["Disable"] = "Enable",
--       ["Disabled"] = "Enabled",
--       ["disabled"] = "enabled",
--       ["ON"] = "OFF",
--       ["on"] = "off",
--     },
--   }

plugin("dial")
  :event_defer()
  :config(function()
    local augend = require "dial.augend"
    local function toggler(elms, word, cyclic)
      return augend.constant.new {
        elements = elms,
        word = word or true,
        cyclic = cyclic or true,
      }
    end
    require("dial.config").augends:register_group {
      default = {
        augend.integer.alias.decimal_int,
        augend.integer.alias.binary,
        augend.integer.alias.octal,
        augend.integer.alias.hex,
        augend.semver.alias.semver,
        augend.date.alias["%Y-%m-%d"],
        augend.date.alias["%Y/%m/%d"],
        augend.date.alias["%Y年%-m月%-d日"],
        augend.constant.alias.alpha,
        augend.constant.alias.Alpha,
      },
      toggler = {
        toggler({ "&&", "||" }, false, true),
        toggler({ "++", "--" }, false, true),
        toggler({ ">", "<" }, false, true),
        toggler { "and", "or" },
        toggler { "let", "const" },
        toggler { "Yes", "No" },
        toggler { "yes", "no" },
        toggler { "disable", "enable" },
        toggler { "Disable", "Enable" },
        toggler { "Disabled", "Enabled" },
        toggler { "disabled", "enabled" },
        toggler { "ON", "OFF" },
        toggler { "on", "off" },
        augend.constant.alias.bool,
        augend.constant.alias.Bool,
      },
    }
  end)
  :keys {
    kmap("n", "<C-a>", klazy("dial.map").manipulate("increment", "normal")),
    kmap("n", "<C-x>", klazy("dial.map").manipulate("decrement", "normal")),
    kmap("n", "<leader>i", klazy("dial.map").manipulate("increment", "normal", "toggler"), "Toggle Invert"),
  }

plugin("treesj")
  :cmd({ "TSJSplit", "TSJJoin", "TSJToggle" })
  :keys({
    kmap("n", "gj", kcmd "TSJToggle", "Join/Split Node"),
  })
  :opts {
    use_default_keymaps = false,
  }

plugin("substitute.nvim"):event_defer():keys(kopts({ noremap = true }, {
  kmap("n", "<C-s>", klazy("substitute").operator(), "Substitute"),
  kmap("n", "<C-s><C-s>", klazy("substitute").line(), "Substitute Line"),
  kmap("n", "<C-S-s>", klazy("substitute").eol(), "Substitute EOL"),
  kmap("x", "<C-s>", klazy("substitute").visual(), "Substitute"),
}))
