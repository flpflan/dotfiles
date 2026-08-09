deploy: FORCE
	@nixos-rebuild switch --flake ~/.dotfiles/nix --sudo

deploy-debug: FORCE
	@nixos-rebuild switch --flake ~/.dotfiles/nix --sudo --show-trace --verbose
	
update: FORCE
	@nix flake update --flake ./nvim
	@nix flake update --flake ./nix
	
clean: FORCE
	@sudo nix profile wipe-history --profile /nix/var/nix/profiles/system
	@sudo nix store gc --debug
	@nix-collect-garbage -d
	@sudo nix-collect-garbage -d

FORCE: ;
