{
  pkgs,
  vim_pkgs,
  nvim_pkgs,
  ...
}: {
  startupPlugins = with vim_pkgs;
    [
      nvim-nio
      (nvim-treesitter.withPlugins (
        _: [
        # FIXME:
          # (pkgs.tree-sitter.buildGrammar rec {
          #   language = "dap_repl";
          #   src = nvim_pkgs.nvim-dap-repl-highlights;
          #   version = toString (src.lastModified or "master");
          #   location = "lua/tree-sitter";
          #   generate = false;
          # })
        ]
      ))
    ]
    ++ (with nvim_pkgs; [
      # nvim-dap-repl-highlights
    ]);

  optionalPlugins = with vim_pkgs; [
    nvim-dap
    nvim-dap-ui
    nvim-dap-virtual-text
    # nvim-dap-view
  ];
}
