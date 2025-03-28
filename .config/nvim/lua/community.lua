return {
  "AstroNvim/astrocommunity",

  { import = "astrocommunity.colorscheme.catppuccin" },
  -- { import = "astrocommunity.colorscheme.tokyonight-nvim" },
  -- { import = "astrocommunity.colorscheme.aurora" },

  { import = "astrocommunity.color.transparent-nvim" },

  -- { import = "astrocommunity.completion.blink-cmp" },
  { import = "astrocommunity.completion.avante-nvim" },

  { import = "astrocommunity.pack.typescript-all-in-one" },
  { import = "astrocommunity.pack.python-ruff" },
  -- { import = "astrocommunity.pack.tailwindcss" },
  { import = "astrocommunity.pack.toml" },
  { import = "astrocommunity.pack.rust" },
  { import = "astrocommunity.pack.bash" },
  { import = "astrocommunity.pack.lua" },
  -- { import = "astrocommunity.pack.go" },
  { import = "astrocommunity.pack.html-css" },
  { import = "astrocommunity.pack.markdown" },
  { import = "astrocommunity.pack.vue" },
  { import = "astrocommunity.pack.yaml" },
  { import = "astrocommunity.pack.cpp" },
  { import = "astrocommunity.pack.cmake" },
  { import = "astrocommunity.pack.json" },
  { import = "astrocommunity.pack.zig" },
  { import = "astrocommunity.pack.hyprlang" },
  { import = "astrocommunity.pack.haskell" },

  { import = "astrocommunity.debugging.nvim-dap-virtual-text" },
  { import = "astrocommunity.debugging.nvim-dap-repl-highlights" },
  { import = "astrocommunity.debugging.telescope-dap-nvim" },
  { import = "astrocommunity.debugging.persistent-breakpoints-nvim" },

  -- { import = "astrocommunity.indent.indent-blankline-nvim" },

  { import = "astrocommunity.lsp.garbage-day-nvim" },

  { import = "astrocommunity.bars-and-lines.lualine-nvim" },

  -- { import = "astrocommunity.markdown-and-latex.markview-nvim", lazy = false },

  -- { import = "astrocommunity.editing-support.todo-comments-nvim" }, -- Now it's part of AstroNvim
  { import = "astrocommunity.editing-support.nvim-treesitter-endwise" },
  -- { import = "astrocommunity.editing-support.nvim-devdocs" },

  { import = "astrocommunity.programming-language-support.web-tools-nvim", enabled = false },

  { import = "astrocommunity.utility.nvim-toggler" },

  -- { import = "astrocommunity.diagnostics.error-lens-nvim" },
  { import = "astrocommunity.diagnostics.trouble-nvim" },
  -- { import = "astrocommunity.diagnostics.lsp_lines-nvim" },
}
