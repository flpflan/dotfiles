{
  pkgs,
  vim_pkgs,
  nvim_pkgs,
  ...
}: {
  lspsAndRuntimeDeps = with pkgs; [
    marksman
    prettierd
  ];
  optionalPlugins = with vim_pkgs;
    [
      (nvim-treesitter.withPlugins (
        plugins:
          with plugins; [
            markdown
            markdown_inline
          ]
      ))
    ]
    ++ (with nvim_pkgs; [
      render-markdown
    ]);
}
