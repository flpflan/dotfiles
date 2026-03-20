{
  vim_pkgs,
  nvim_pkgs,
  ...
}: {
  startupPlugins = with vim_pkgs;
    [
      nvim-treesitter-endwise
      (nvim-treesitter.withPlugins (
        plugins:
          with plugins; [
            bash
            zsh
            fish
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
            ssh_config
            desktop
            zathurarc
          ]
      ))
    ];
  optionalPlugins = with vim_pkgs;
    [
      nvim-treesitter-textobjects
      nvim-treesitter-context
    ];
}
