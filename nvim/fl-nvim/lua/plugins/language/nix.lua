if not nixCats "language.nix" then return end
---------------
----- LSP -----
---------------
env.set("NIXD_FLAGS", "-log=error")

lsp("nixd"):settings {
  nixd = {
    nixpkgs = {
      expr = nixCats.extra "nixdExtras.nixpkgs" or [[import <nixpkgs> {}]],
    },
    formatting = {
      command = { "nixfmt" },
    },
    options = {
      nixos = {
        -- nixdExtras.nixos_options = ''(builtins.getFlake "path:${builtins.toString inputs.self.outPath}").nixosConfigurations.configname.options''
        expr = nixCats.extra "nixdExtras.nixos_options",
      },
      ["home-manager"] = {
        -- nixdExtras.nixos_options = ''(builtins.getFlake "path:${builtins.toString inputs.self.outPath}").nixosConfigurations.configname.options''
        expr = nixCats.extra "nixdExtras.home_manager_options",
      },
    },
    diagnostic = {
      suppress = {
        "sema-escaping-with",
      },
    },
  },
}
----------------
---- Linter ----
----------------
linter("nix", { "statix", "deadnix" })
-----------------
--- Formatter ---
-----------------
formatter("nix", "alejandra")
