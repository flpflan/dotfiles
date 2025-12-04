{
  vim_pkgs,
  nvim_pkgs,
  ...
}: {
  optionalPlugins = with vim_pkgs;
    [
      nvim-treesitter-textobjects
      nvim-treesitter-endwise
      (nvim-treesitter.withPlugins (
        plugins:
          with plugins; [
            bash
            make
            regex
            vim
            vimdoc
            comment
            diff
            git_config
            git_rebase
            gitattributes
            gitcommit
            gitignore
          ]
      ))
    ]
    ++ (with nvim_pkgs; [
      treesitter-context
    ]);
}
