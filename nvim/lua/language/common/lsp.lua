-- TODO: Add the possibility for this to be triggered from the lsp definition
---@param client vim.lsp.Client
---@param buf integer
local function on_attach(client, buf)
  if client.name == "lua_ls" then
    require "neoconf"
  elseif client.name == "ruff" then
    client.server_capabilities.hoverProvider = false
  elseif client.name == "vtsls" or client.name == "ts_ls" then
    kmap("n", "gs", klazy("vtsls.commands").goto_source_definition(), "Goto Source Definition (vtsls)", {
      cond = function()
        local buf_clients = vim.lsp.get_clients { bufnr = 0 }
        for _, buf_client in ipairs(buf_clients) do
          if buf_client.name == "vtsls" then return true end
        end
        return false
      end,
    })
    if vim.bo.filetype == "vue" then
      client.server_capabilities.semanticTokensProvider.full = false
      vim.api.nvim_set_hl(0, "@lsp.type.component", { link = "@type" })
    else
      client.server_capabilities.semanticTokensProvider.full = true
    end
  elseif client.name == "clangd" then
    kmap("n", "gs", kcmd "LspClangdSwitchSourceHeader", "Goto Source/Header", {
      cond = function()
        local buf_clients = vim.lsp.get_clients { bufnr = 0 }
        for _, buf_client in ipairs(buf_clients) do
          if buf_client.name == "clangd" then return true end
        end
        return false
      end,
    })
  end
  if client.server_capabilities.inlayHintProvider then vim.lsp.inlay_hint.enable(true, {
    bufnr = buf,
  }) end
end

---@param buf integer
local function set_lsp_keymaps(buf)
  kopts({ buffer = buf }, {
    kmap({ "n" }, "K", vim.lsp.buf.hover, "Hover"),
    kmap({ "n" }, "<leader>ui", function()
      vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = vim.api.nvim_get_current_buf() })
    end, "Toggle Inlay Hint"),
    -- kmap({ "n" }, "gd", vim.lsp.buf.definition, "Goto Definition"),
    kmap({ "n" }, "gd", klazy("snacks.picker").lsp_definitions(), "Goto Definition"),
    kmap({ "n" }, "gD", klazy("snacks.picker").lsp_declarations(), "Goto Declarations"),
    kmap({ "n" }, "gt", klazy("snacks.picker").lsp_type_definitions(), "Goto Type Definition"),
    kmap({ "n" }, "gI", klazy("snacks.picker").lsp_implementations(), "Goto Implementation"),
    kmap({ "n" }, "gr", klazy("snacks.picker").lsp_references(), "Goto Reference"),
    kgroup("<leader>l", "Language Tools", {}, {
      kmap({ "n", "v" }, "a", vim.lsp.buf.code_action, "Code Actions"),
      kmap("n", "r", vim.lsp.buf.rename, "Rename"),
      kmap("n", "d", function()
        vim.diagnostic.open_float {
          border = "rounded",
          scope = "line",
          prefix = function(_, i, total)
            if total == 1 then return "", "" end
            return "(" .. i .. "/" .. total .. ") ", ""
          end,
          source = true,
        }
      end, "Diagnostic Float"),
      kmap("n", "s", klazy("snacks.picker").lsp_symbols(), "Symbols"),
      kmap("n", "S", klazy("snacks.picker").lsp_workspace_symbols(), "Workspace Symbols"),
      kmap("n", "c", klazy("snacks.picker").lsp_incoming_calls(), "Incoming Calls"),
      kmap("n", "C", klazy("snacks.picker").lsp_outgoing_calls(), "Outgoing Calls"),
    }),
  })
end

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client ~= nil then
      on_attach(client, args.buf)
      set_lsp_keymaps(args.buf)
    end
  end,
})

vim.keymap.del("n", "gra")
vim.keymap.del("n", "grn")
vim.keymap.del("n", "gri")
vim.keymap.del("n", "grr")

vim.fn.sign_define("DiagnosticSignError", { text = "", texthl = "DiagnosticSignError" })
vim.fn.sign_define("DiagnosticSignWarn", { text = "", texthl = "DiagnosticSignWarn" })
vim.fn.sign_define("DiagnosticSignInfo", { text = "", texthl = "DiagnosticSignInfo" })
vim.fn.sign_define("DiagnosticSignHint", { text = "󰌵", texthl = "DiagnosticSignHint" })

vim.lsp.config("*", {
  root_markers = { ".git" },
})

vim.diagnostic.config {
  virtual_text = {
    enabled = true,
    prefix = "●",
  },

  update_in_insert = true,
  underline = true,
  severity_sort = true,
  float = {
    border = "rounded",
    header = "",
    prefix = "",
  },
  signs = {
    --support diagnostic severity / diagnostic type name
    text = {
      [vim.diagnostic.severity.ERROR] = Symbols.error,
      [vim.diagnostic.severity.WARN] = Symbols.warn,
      [vim.diagnostic.severity.HINT] = Symbols.hint,
      [vim.diagnostic.severity.INFO] = Symbols.info,
    },
  },
}

vim.api.nvim_set_hl(0, "DiagnosticUnderlineError", { fg = "#db4b4b", undercurl = true })
vim.api.nvim_set_hl(0, "DiagnosticUnderlineWarn", { fg = "#e0af68", undercurl = true })
vim.api.nvim_set_hl(0, "DiagnosticDeprecated", { fg = "#e0af68" })
vim.api.nvim_set_hl(0, "DiagnosticUnderlineInfo", { fg = "#0db9d7", undercurl = true })
vim.api.nvim_set_hl(0, "DiagnosticInfo", { fg = "#0db9d7" })

-- vim.lsp.log.set_level(env.get("NVIM_LSP_LOG_LEVEL") or "OFF")

kgroup("<leader>l", "Language Tools", {}, {
  kmap("n", "i", kcmd "LspInfo", "Lsp Info"),
  kmap("n", "I", klazy("snacks.picker").lsp_config(), "Lsp Configs"),
  kmap("n", "R", function()
    local bufnr = vim.fn.bufnr()
    local clients = vim.lsp.get_clients { bufnr = bufnr }
    for _, client in ipairs(clients) do
      if client.name == "copilot" then goto continue end
      vim.lsp.stop_client(client.id, true)
      vim.defer_fn(function()
        vim.lsp.start(client.config, {
          bufnr = bufnr,
        })
      end, 1000)
      ::continue::
    end
  end, "Restart Language Server"),
})
plugin("neoconf.nvim"):on_require("neoconf"):opts {
  import = {
    vscode = true,
    coc = false,
    nlsp = false,
  },
  plugins = {
    lspconfig = {
      enabled = false,
    },
    lua_ls = {
      enabled = true,
    },
  },
}
plugin("garbage-day"):on_require("garbage-day"):event_defer()
