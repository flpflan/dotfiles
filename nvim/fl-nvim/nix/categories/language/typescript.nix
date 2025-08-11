{
  pkgs,
  vim_pkgs,
  nvim_pkgs,
  ...
}: {
  lspsAndRuntimeDeps = with pkgs; [
    # TODO:
  ];
  optionalPlugins = with vim_pkgs; [
    (nvim-treesitter.withPlugins (
      plugins:
        with plugins; [
          javascript typescript tsx jsdoc
        ]
    ))
  ]
  ++ (with nvim_pkgs; [
    ts-error-translator
  ]);
}
