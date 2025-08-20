{
  pkgs,
  vim_pkgs,
  nvim_pkgs,
  ...
}: {
  lspsAndRuntimeDeps = with pkgs; [
    gitMinimal
  ];
  optionalPlugins = with vim_pkgs;
    [
      diffview-nvim
      gitsigns-nvim
      mini-diff
      telescope-git-conflicts-nvim
    ]
    ++ (with nvim_pkgs; [
      git-conflict
      neogit
    ]);
}
