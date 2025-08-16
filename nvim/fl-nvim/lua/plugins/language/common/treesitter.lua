---------------
--- Options ---
---------------
local ensured_languages = {
  "comment", "dap_repl"
}
if require("nixCatsUtils").isNixCats then ensured_languages = nil end
--------------------
--- Config Logic ---
--------------------
plugin("nvim-treesitter-endwise"):on_plugin("nvim-treesitter"):config(false)
plugin("nvim-treesitter-textobjects"):on_plugin("nvim-treesitter"):config(false)

plugin("treesitter-context"):event_defer():for_cat("core"):opts {
  mode = "topline",
  max_lines = 3,
}

plugin("nvim-treesitter")
  :lazy(vim.fn.argc(-1) == 0) -- load treesitter immediately when opening a file from the cmdline
  :event_defer()
  :cmd({
    "TSBufDisable",
    "TSBufEnable",
    "TSBufToggle",
    "TSDisable",
    "TSEnable",
    "TSToggle",
    "TSInstall",
    "TSInstallInfo",
    "TSInstallSync",
    "TSModuleInfo",
    "TSUninstall",
    "TSUpdate",
    "TSUpdateSync",
  })
  -- beforeAll = function() pcall(require, "nvim-treesitter.query_predicates") end,
  :dep_of(
    "treesj",
    "otter.nvim",
    "render-markdown",
    "neorg"
  )
  :config(function()
    local configs = require "nvim-treesitter.configs"
    configs.setup {
      ensure_installed = ensured_languages,
      sync_install = false,
      auto_install = vim.fn.executable "tree-sitter" == 1,
      highlight = { enable = true },
      incremental_selection = { enable = true },
      indent = { enable = true, disable = { "nix" } },
      textobjects = {
        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            ["ak"] = { query = "@block.outer", desc = "around block" },
            ["ik"] = { query = "@block.inner", desc = "inside block" },
            ["ac"] = { query = "@class.outer", desc = "around class" },
            ["ic"] = { query = "@class.inner", desc = "inside class" },
            ["a?"] = { query = "@conditional.outer", desc = "around conditional" },
            ["i?"] = { query = "@conditional.inner", desc = "inside conditional" },
            ["af"] = { query = "@function.outer", desc = "around function " },
            ["if"] = { query = "@function.inner", desc = "inside function " },
            ["ao"] = { query = "@loop.outer", desc = "around loop" },
            ["io"] = { query = "@loop.inner", desc = "inside loop" },
            ["aa"] = { query = "@parameter.outer", desc = "around argument" },
            ["ia"] = { query = "@parameter.inner", desc = "inside argument" },
          },
        },
        move = {
          enable = true,
          set_jumps = true,
          goto_next_start = {
            ["]k"] = { query = "@block.outer", desc = "Next block start" },
            ["]f"] = { query = "@function.outer", desc = "Next function start" },
            ["]a"] = { query = "@parameter.inner", desc = "Next argument start" },
            ["]c"] = { query = "@class.outer", desc = "Next class start" },
          },
          goto_next_end = {
            ["]K"] = { query = "@block.outer", desc = "Next block end" },
            ["]F"] = { query = "@function.outer", desc = "Next function end" },
            ["]A"] = { query = "@parameter.inner", desc = "Next argument end" },
            ["]C"] = { query = "@class.outer", desc = "Next class end" },
          },
          goto_previous_start = {
            ["[k"] = { query = "@block.outer", desc = "Previous block start" },
            ["[f"] = { query = "@function.outer", desc = "Previous function start" },
            ["[a"] = { query = "@parameter.inner", desc = "Previous argument start" },
            ["[c"] = { query = "@class.outer", desc = "Previous class start" },
          },
          goto_previous_end = {
            ["[K"] = { query = "@block.outer", desc = "Previous block end" },
            ["[F"] = { query = "@function.outer", desc = "Previous function end" },
            ["[A"] = { query = "@parameter.inner", desc = "Previous argument end" },
            ["[C"] = { query = "@class.outer", desc = "Previous class end" },
          },
        },
        swap = {
          enable = true,
          swap_next = {
            [">K"] = { query = "@block.outer", desc = "Swap next block" },
            [">F"] = { query = "@function.outer", desc = "Swap next function" },
            [">A"] = { query = "@parameter.inner", desc = "Swap next argument" },
          },
          swap_previous = {
            ["<K"] = { query = "@block.outer", desc = "Swap previous block" },
            ["<F"] = { query = "@function.outer", desc = "Swap previous function" },
            ["<A"] = { query = "@parameter.inner", desc = "Swap previous argument" },
          },
        },
      },
      endwise = {
        enable = true,
      },
    }
  end)
  :keys({
    kmap(
      "n",
      ";",
      function() require("nvim-treesitter.textobjects.repeatable_move").repeat_last_move() end,
      "repeat last move"
    ),
    kmap(
      "n",
      ",",
      function() require("nvim-treesitter.textobjects.repeatable_move").repeat_last_move_opposite() end,
      "repeat last move previous"
    ),
    kmap(
      "i",
      "<M-n>",
      function() require("nvim-treesitter.textobjects.repeatable_move").repeat_last_move() end,
      "repeat last move"
    ),
  })
  :setup(function()
    vim.treesitter.language.register("bash", "dotenv")
    vim.treesitter.language.register("bash", "zsh")
    vim.treesitter.language.register("python", "bzl")
  end)
