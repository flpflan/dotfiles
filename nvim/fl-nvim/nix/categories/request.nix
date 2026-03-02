{
  pkgs,
  vim_pkgs,
  nvim_pkgs,
  ...
}: {
  lspsAndRuntimeDeps = with pkgs; [
    curl
    grpcurl
    jq
    libxml2
    websocat
    kulala-fmt
  ];
  startupPlugins = with vim_pkgs; [
    (nvim-treesitter.withPlugins (
      plugins:
        with plugins; [
          http
          html
          javascript
          typescript
        ]
    ))
  ];
  optionalPlugins = with nvim_pkgs; [
    kulala
  ];
}
