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
      vim-startuptime
      snacks-nvim
      nvim-lspconfig
    ];
  optionalPlugins = with vim_pkgs;
    [
      substitute-nvim
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
      # comment-nvim
      better-escape-nvim
      blink-cmp
      blink-compat
      neoconf-nvim
      # neo-tree-nvim
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
      # quicker-nvim
      # undotree
      guess-indent-nvim
      # live-command-nvim
      # harpoon2
      overseer-nvim
      nvim-lint
      lualine-nvim
      oil-nvim
      oil-git-nvim
      oil-lsp-diagnostics-nvim
    ]
    ++ (with nvim_pkgs; [
      oil-vcs-status
      yazi-nvim
      smart-paste
      smart-motion
      garbage-day
      nvim-toggler
      nvim-better-n
      # lualine-lsp-progress
      # esqueleto
      # easycolor
      # dir-telescope
      # search-replace
      # gotmpl
      # yaml
      neotab
      toggleterm-nvim
    ]);
}
