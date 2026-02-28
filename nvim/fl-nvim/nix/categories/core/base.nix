{
  pkgs,
  vim_pkgs,
  nvim_pkgs,
  ...
}: {
  lspsAndRuntimeDeps = with pkgs; [
    ripgrep
    # fd
    # ast-grep
    # jq
  ];
  startupPlugins = with vim_pkgs;
    [
      lze
      lzextras
      plenary-nvim
      # promise-async
      nvim-web-devicons
      mini-icons
      which-key-nvim
      alpha-nvim
      nui-nvim
      nvim-notify
      arrow-nvim
      # marks-nvim
      oil-git-status-nvim
      nvim-ts-context-commentstring
      friendly-snippets # INFO: Auto sourced by luasnip
      vim-illuminate
    ]
    ++ (with nvim_pkgs; [
      lspconfig
      oil
      oil-git
      oil-vcs-status
      oil-lsp-diagnostics
    ]);
  optionalPlugins = with vim_pkgs;
    [
      snacks-nvim
      nvim-autopairs
      nvim-surround
      nvim-ts-autotag
      neoscroll-nvim
      # vim-startuptime
      noice-nvim
      todo-comments-nvim
      # mini-indentscope
      nvim-highlight-colors
      smart-splits-nvim
      # mini-ai
      # mini-surround
      # mini-move
      comment-nvim
      better-escape-nvim
      blink-cmp
      neoconf-nvim
      neo-tree-nvim
      nvim-lsp-file-operations
      # fidget-nvim
      # telescope-nvim
      # telescope-zf-native-nvim
      # telescope-fzf-native-nvim
      # telescope-dap-nvim
      hop-nvim
      conform-nvim
      nvim-ufo
      luasnip
      # grug-far-nvim
      trouble-nvim
      treesj
      flash-nvim
      # yanky-nvim
      neogen
      # vim-sleuth
      statuscol-nvim
    ]
    ++ (with nvim_pkgs; [
      smart-paste
      smart-motion
      garbage-day
      nvim-toggler
      lualine-nvim
      # lualine-lsp-progress
      # harpoon
      # esqueleto
      # easycolor
      # live-command
      blink-compat
      # dir-telescope
      nvim-lint
      overseer
      guess-indent
      # search-replace
      # undotree
      # quicker
      # gotmpl
      # yaml
      neotab
    ]);
}
