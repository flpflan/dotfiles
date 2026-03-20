{
  pkgs,
  vim_pkgs,
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
      neogit
      # telescope-git-conflicts-nvim
      git-conflict-nvim
      lensline-nvim
    ];
}
