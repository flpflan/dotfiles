{ config, lib, inputs, nixCats, ... }:

let
  utils = nixCats.utils;
in
{
  imports = [ nixCats.homeModule ];
  config = {
    nixCats = {
      enable = true;
      addOverlays = [
        (utils.standardPluginOverlay inputs)
      ];
      packageNames = [ "fl-nvim" ];
      luaPath = ./.;
      categoryDefinitions.replace = (
        packageDef@{ pkgs, settings, categories, extra, name, mkPlugin, ... }: {
          lspAndRuntimeDeps = {
            general = with pkgs; [
              lazygit
            ];
            lua = with pkgs; [
              lua-language-server
              stylua
            ];
            nix = with pkgs; [
              nixd
              alexandria
            ];
            go = with pkgs; [
              gopls
              delve
              golint
              golangci-lint
              gotools
              go-tools
              go
            ];
          };
          startupPlugins = {
            general = with pkgs.vimPlugins; [
              lze
              lzextras
              snacks-nvim
              onedark-vim
              vim-sleuth
            ];
          };
          optionalPlugins = {
            go = with pkgs.vimPlugins; [
              nvim-dap-go
            ];
            lua = with pkgs.vimPlugins; [
              lazydev-nvim
            ];
            general = with pkgs.vimPlugins; [
              mini-nvim
              nvim-lspconfig
              vim-startuptime
              blink-cmp
              nvim-tresitter.withAllGrammars
              lualine-nvim
              lualine-lsp-progress
              gitsigns-nvim
              which-key-nvim
              nvim-lint
              conform-nvim
              nvim-dap
              nvim-dap-ui
              nvim-dap-virtual-text
            ];
          };
          sharedLibraries = {
            general = with pkgs; [];
          };
          environmentVariables = {

          };
          python3.libraries = {

          };
          extraWrapperArgs = {

          };
        }
      );
      packageDefinitions.replace = {
        fl-nvim = { pkgs, name, ... }: {
          settings = {
            suffix-path = true;
            suffix-LD = true;
            wrapRc = true;
            aliases = [ "vim" "fl-nvim" ];
            hosts.python3.enable = true;
            hosts.node.enable = true;
          };
          categories = {
            general = true;
            lua = true;
            nix = true;
            go = false;
          };
          extra = {
            nixdExtras.nixpkgs = ''import ${pkgs.path} {}'';
          };
        };
      };
    };
  };
}
