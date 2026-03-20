deploy: FORCE
	@nixos-rebuild switch --flake ~/.dotfiles/nix --sudo
	
update: FORCE
	@nix flake update --flake ./nvim
	@nix flake update --flake ./nix
	
clean: FORCE
	@sudo nix profile wipe-history --profile /nix/var/nix/profiles/system
	@sudo nix store gc --debug
	@sudo nix-collect-garbage -d
	@nix-collect-garbage -d

FORCE: ;
