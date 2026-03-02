---------------
--- Options ---
---------------
local ensured_languages = {
  "comment",
  "dap_repl",
}
if require("nixCatsUtils").isNixCats then
  ensured_languages = {}
end
--------------------
--- Config Logic ---
--------------------
plugin("nvim-treesitter-endwise"):config(false)

plugin("treesitter-context")
  :event_defer()
  :for_cat("core")
  :keys(kmap("n", "<leader>uc", kcmd("TSContext toggle"), "Toggle TSContext"))
  :opts {
    mode = "cursor",
    max_lines = 3,
  }

vim.treesitter.language.register("bash", "dotenv")
vim.treesitter.language.register("bash", "zsh")
vim.treesitter.language.register("python", "bzl")
vim.treesitter.language.register("jinja", "j2")
vim.treesitter.language.register("tpp", "cpp")

-- Enable treesitter based highlighting
vim.api.nvim_create_autocmd('FileType', {
  group = vim.api.nvim_create_augroup("tree-sitter-enable", { clear = true }),
  callback = function() pcall(vim.treesitter.start) end,
})

plugin("nvim-treesitter-textobjects")
  :setup(function()
    vim.g.no_plugin_maps = true
  end)
  :event_defer()
  :opts({
    select = { lookahead = true },
    move = { set_jumps = true },
  })
  ------------
  -- Select --
  ------------
  :keys({
    kmap({ "x", "o" }, "ak", klazy("nvim-treesitter-textobjects.select").select_textobject("@block.outer", "textobjects"), "around block"),
    kmap({ "x", "o" }, "ik", klazy("nvim-treesitter-textobjects.select").select_textobject("@block.inner", "textobjects"), "inside block"),
    kmap({ "x", "o" }, "af", klazy("nvim-treesitter-textobjects.select").select_textobject("@function.outer", "textobjects"), "around function"),
    kmap({ "x", "o" }, "if", klazy("nvim-treesitter-textobjects.select").select_textobject("@function.inner", "textobjects"), "inside function"),
    kmap({ "x", "o" }, "a?", klazy("nvim-treesitter-textobjects.select").select_textobject("@conditional.outer", "textobjects"), "around conditional"),
    kmap({ "x", "o" }, "i?", klazy("nvim-treesitter-textobjects.select").select_textobject("@conditional.inner", "textobjects"), "inside conditional"),
    kmap({ "x", "o" }, "ac", klazy("nvim-treesitter-textobjects.select").select_textobject("@class.outer", "textobjects"), "around class"),
    kmap({ "x", "o" }, "ic", klazy("nvim-treesitter-textobjects.select").select_textobject("@class.inner", "textobjects"), "inside class"),
    kmap({ "x", "o" }, "ao", klazy("nvim-treesitter-textobjects.select").select_textobject("@loop.outer", "textobjects"), "around loop"),
    kmap({ "x", "o" }, "io", klazy("nvim-treesitter-textobjects.select").select_textobject("@loop.inner", "textobjects"), "inside loop"),
    kmap({ "x", "o" }, "aa", klazy("nvim-treesitter-textobjects.select").select_textobject("@parameter.outer", "textobjects"), "around argument"),
    kmap({ "x", "o" }, "ia", klazy("nvim-treesitter-textobjects.select").select_textobject("@parameter.inner", "textobjects"), "inside argument"),
    kmap({ "x", "o" }, "av", klazy("nvim-treesitter-textobjects.select").select_textobject("@assignment.outer", "textobjects"), "around assignment"),
    kmap({ "x", "o" }, "iv", klazy("nvim-treesitter-textobjects.select").select_textobject("@assignment.inner", "textobjects"), "inside assignment"),
  })
  ----------
  -- Swap --
  ----------
  :keys({
    kmap("n", ">a", klazy("nvim-treesitter-textobjects.swap").swap_next "@parameter.inner", "Swap next argument"),
    kmap("n", "<a", klazy("nvim-treesitter-textobjects.swap").swap_previous "@parameter.inner", "Swap previous argument"),
    kmap("n", ">f", klazy("nvim-treesitter-textobjects.swap").swap_next "@function.outer", "Swap next function"),
    kmap("n", "<f", klazy("nvim-treesitter-textobjects.swap").swap_previous "@function.outer", "Swap previous function"),
    kmap("n", ">k", klazy("nvim-treesitter-textobjects.swap").swap_next "@block.outer", "Swap next block"),
    kmap("n", "<k", klazy("nvim-treesitter-textobjects.swap").swap_previous "@block.outer", "Swap previous block"),
  })
  ----------
  -- Move --
  ----------
  :keys {
    kmap({ "n", "x", "o" }, "]k", klazy("nvim-treesitter-textobjects.move").goto_next_start("@block.outer", "textobjects"), "Next block start"),
    kmap({ "n", "x", "o" }, "]K", klazy("nvim-treesitter-textobjects.move").goto_next_end("@block.outer", "textobjects"), "Next block end"),
    kmap({ "n", "x", "o" }, "[k", klazy("nvim-treesitter-textobjects.move").goto_previous_start("@block.outer", "textobjects"), "Previous block start"),
    kmap({ "n", "x", "o" }, "[K", klazy("nvim-treesitter-textobjects.move").goto_previous_end("@block.outer", "textobjects"), "Previous block end"),
    kmap({ "n", "x", "o" }, "]f", klazy("nvim-treesitter-textobjects.move").goto_next_start("@function.outer", "textobjects"), "Next function start"),
    kmap({ "n", "x", "o" }, "]F", klazy("nvim-treesitter-textobjects.move").goto_next_end("@function.outer", "textobjects"), "Next function end"),
    kmap({ "n", "x", "o" }, "[f", klazy("nvim-treesitter-textobjects.move").goto_previous_start("@function.outer", "textobjects"), "Previous function start"),
    kmap({ "n", "x", "o" }, "[F", klazy("nvim-treesitter-textobjects.move").goto_previous_end("@function.outer", "textobjects"), "Previous function end"),
    kmap({ "n", "x", "o" }, "]a", klazy("nvim-treesitter-textobjects.move").goto_next_start("@parameter.outer", "textobjects"), "Next argument start"),
    kmap({ "n", "x", "o" }, "]A", klazy("nvim-treesitter-textobjects.move").goto_next_end("@parameter.outer", "textobjects"), "Next argument end"),
    kmap({ "n", "x", "o" }, "[a", klazy("nvim-treesitter-textobjects.move").goto_previous_start("@parameter.outer", "textobjects"), "Previous argument start"),
    kmap({ "n", "x", "o" }, "[A", klazy("nvim-treesitter-textobjects.move").goto_previous_end("@parameter.outer", "textobjects"), "Previous argument end"),
    kmap({ "n", "x", "o" }, "]c", klazy("nvim-treesitter-textobjects.move").goto_next_start("@class.outer", "textobjects"), "Next class start"),
    kmap({ "n", "x", "o" }, "]C", klazy("nvim-treesitter-textobjects.move").goto_next_end("@class.outer", "textobjects"), "Next class end"),
    kmap({ "n", "x", "o" }, "[c", klazy("nvim-treesitter-textobjects.move").goto_previous_start("@class.outer", "textobjects"), "Previous class start"),
    kmap({ "n", "x", "o" }, "[C", klazy("nvim-treesitter-textobjects.move").goto_previous_end("@class.outer", "textobjects"), "Previous class end"),

    kmap({ "n", "x", "o" }, "]?", klazy("nvim-treesitter-textobjects.move").goto_next("@conditional.outer", "textobjects"), "Next conditional"),
    kmap({ "n", "x", "o" }, "[?", klazy("nvim-treesitter-textobjects.move").goto_previous("@conditional.outer", "textobjects"), "Previous conditional"),
    kmap({ "n", "x", "o" }, "]o", klazy("nvim-treesitter-textobjects.move").goto_next("@loop.*", "textobjects"), "Next loop"),
    kmap({ "n", "x", "o" }, "[o", klazy("nvim-treesitter-textobjects.move").goto_previous("@loop.*", "textobjects"), "Previous loop"),

    kmap({ "n", "x", "o" }, ";", klazy("nvim-treesitter-textobjects.repeatable_move").repeat_last_move(), "Repeat last move next"),
    kmap({ "n", "x", "o" }, ",", klazy("nvim-treesitter-textobjects.repeatable_move").repeat_last_move_opposite(), "Repeat last move previous"),
    kmap({ "n", "x", "o" }, "f", klazy("nvim-treesitter-textobjects.repeatable_move").builtin_f_expr(), "", { expr = true }),
    kmap({ "n", "x", "o" }, "F", klazy("nvim-treesitter-textobjects.repeatable_move").builtin_F_expr(), "", { expr = true }),
    kmap({ "n", "x", "o" }, "t", klazy("nvim-treesitter-textobjects.repeatable_move").builtin_t_expr(), "", { expr = true }),
    kmap({ "n", "x", "o" }, "T", klazy("nvim-treesitter-textobjects.repeatable_move").builtin_T_expr(), "", { expr = true }),
    kmap({ "i" }, "<C-;>", klazy("nvim-treesitter-textobjects.repeatable_move").repeat_last_move(), "Repeat last move next"),
    kmap({ "i" }, "<C-,>", klazy("nvim-treesitter-textobjects.repeatable_move").repeat_last_move_opposite(), "Repeat last move previous"),
  }
