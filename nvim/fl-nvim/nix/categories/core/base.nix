{
  pkgs,
  vim_pkgs,
  nvim_pkgs,
  ...
}: {
  lspsAndRuntimeDeps = with pkgs; [
    # ripgrep
    # fd
    # ast-grep
    # jq
  ];
  startupPlugins = with vim_pkgs;
    [
      lze
      lzextras
      mini-pairs
      plenary-nvim
      # promise-async
      nvim-web-devicons
      which-key-nvim
      alpha-nvim
      snacks-nvim
      nui-nvim
      nvim-notify
    ]
    ++ (with nvim_pkgs; [
      oil
      oil-vcs-status
    ]);
  optionalPlugins = with vim_pkgs;
    [
      neoscroll-nvim
      # vim-startuptime
      noice-nvim
      # todo-comments-nvim
      # mini-indentscope
      # nvim-highlight-colors
      smart-splits-nvim
      # nvim-ts-autotag
      # mini-ai
      # mini-surround
      # mini-move
      # nvim-surround
      mini-icons
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
      # hop-nvim
      conform-nvim
      # tabout-nvim
      # nvim-ufo
      luasnip
      friendly-snippets # INFO: Auto sourced by luasnip
      # grug-far-nvim
      trouble-nvim
      # treesj
      # flash-nvim
      # yanky-nvim
      # neogen
      # vim-sleuth
    ]
    ++ (with nvim_pkgs; [
      lualine-nvim
      # lualine-lsp-progress
      # harpoon
      # esqueleto
      # easycolor
      # live-command
      # render-markdown
      blink-compat
      # dir-telescope
      nvim-lint
      overseer
      # guess-indent
      # search-replace
      # undotree
      # quicker
      # gotmpl
      # yaml
    ]);
}
