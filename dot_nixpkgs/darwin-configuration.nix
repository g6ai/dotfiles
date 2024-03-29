{ config, pkgs, ... }:

{
  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = [
    pkgs.aria
    pkgs.asciiquarium
    pkgs.coreutils
    pkgs.cowsay
    pkgs.ffmpeg
    pkgs.fzf
    pkgs.git
    pkgs.gnuplot
    pkgs.go
    pkgs.graphviz
    pkgs.gwyddion
    pkgs.htop
    pkgs.irssi
    pkgs.lolcat
    pkgs.neofetch
    pkgs.neovim
    pkgs.nmap
    pkgs.nodejs
    pkgs.octave
    pkgs.pandoc
    pkgs.ripgrep
    pkgs.smartmontools
    pkgs.thefuck
    pkgs.tintin
    pkgs.tldr
    pkgs.tmux
    pkgs.toilet
    pkgs.tree
    pkgs.wget
    pkgs.you-get
    pkgs.youtube-dl
    pkgs.zstd # a Python package, required by emacs-mac
  ];

  # Use a custom configuration.nix location.
  # $ darwin-rebuild switch -I darwin-config=$HOME/.config/nixpkgs/darwin/configuration.nix
  # environment.darwinConfig = "$HOME/.config/nixpkgs/darwin/configuration.nix";

  # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;
  # nix.package = pkgs.nix;

  # Create /etc/bashrc that loads the nix-darwin environment.
  programs.zsh.enable = true;  # default shell on catalina
  # programs.fish.enable = true;

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 4;
}
