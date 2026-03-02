{
  vim_pkgs,
  nvim_pkgs,
  ...
}: {
  startupPlugins = with vim_pkgs;
    [
      (nvim-treesitter.withPlugins (
        plugins:
          with plugins; [
            sql
          ]
      ))
    ];
  optionalPlugins = with vim_pkgs;
    [
      nui-nvim
    ]
    ++ (with nvim_pkgs; [
      nvim-dbee
      cmp-dbee
    ]);
}
