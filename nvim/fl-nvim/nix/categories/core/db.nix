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
      nvim-dbee
    ]
    ++ (with nvim_pkgs; [
      cmp-dbee
    ]);
}
