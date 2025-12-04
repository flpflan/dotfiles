{
  pkgs,
  vim_pkgs,
  nvim_pkgs,
  inputs,
  ...
}: {
  startupPlugins = with vim_pkgs;
    [
      nvim-nio
    ]
    ++ (with nvim_pkgs; [
      nvim-dap-repl-highlights
    ]);

  optionalPlugins = with vim_pkgs; [
    nvim-dap
    nvim-dap-ui
    nvim-dap-virtual-text
    (nvim-treesitter.withPlugins (
      _: [
        (pkgs.tree-sitter.buildGrammar rec {
          language = "dap_repl";
          src = inputs.plugins-nvim-dap-repl-highlights;
          version = toString (src.lastModified or "master");
        })
      ]
    ))
  ];
}
