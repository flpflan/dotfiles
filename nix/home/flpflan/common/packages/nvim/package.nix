{
  pkgs,
  makeBinPath,
  wrapNeovimUnstable,
  neovim-unwrapped,
}:

let
  lspAndRuntimeDeps = with pkgs; {
    general = [
      curl
      git

      ripgrep
      wl-clipboard
      # tree-sitter # Not needed on nixos
    ];
    nix = [
      nixd # LSP
      alejandra # Formatter
      deadnix statix # Linter
    ];
    lua = [
      lua-language-server # LSP
      stylua # Formatter
      selene # Linter
    ];
  };
  plugins = with pkgs.vimPlugins; {
    general = [
      lze
      lzextras

      nvim-dap
      # nvim-dap-ui
      nvim-dap-view
      nvim-dap-virtual-text

      nvim-tresitter.withAllGrammars
      nvim-treesitter-textobjects
      nvim-lspconfig
      nvim-lint
      conform-nvim

      vim-sleuth

      catppuccin-nvim
      noice-nvim
      snacks-nvim
      lualine-nvim
      lualine-lsp-progress
      # daylight-nvim

      mini-nvim
      vim-startuptime

      blink-cmp
      friendly-snippets # Auto sourced by blink-cmp
      telescope-nvim
      neo-tree-nvim

      gitsigns-nvim
      which-key-nvim
      comment-nvim
      trouble-nvim
    ];
    lua = [
      lazydev-nvim
    ];
  };
in
wrapNeovimUnstable neovim-unwrapped {
  # viAlias = true;
  # vimAlias = true;
  withRuby = false;
  withNodeJs = false;
  withPython3 = false;
  wrapRc = false;
  # luaRcContent = "print('hello')";
  wrapperArgs = ''--suffix PATH : "${makeBinPath (with lspAndRuntimeDeps; general ++ nix ++ lua)}"'';
  plugins = (with plugins; general ++ lua);
}
