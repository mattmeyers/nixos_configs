{ config, pkgs, lib, ... }:

{
  imports = [
    ./i3.nix
    ./polybar.nix
  ];

  home.packages = with pkgs; [
    htop
    font-awesome-ttf
    enpass
    slack
    spotify
    texlive.combined.scheme-full
    hugo
    sublime-merge
    discord
    tree
    graphviz
    virtualbox
  ];

  home.sessionVariables = {
    PATH = "$PATH:/home/matt/.local/bin";
  };

  services.dunst.enable = true;

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autocd = true;
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" ];
    };
    shellAliases = {
      ".." = "cd ..";
      "..." = "cd ../..";
      "...." = "cd ../../..";
      "dl" = "cd $HOME/Downloads";
      "dev" = "cd $HOME/code/github.com/mattmeyers";
      "ls" = "ls --color=auto";
    };
    sessionVariables = {
      PROMPT = "%F{green}%n@%M [%F{75}%~%F{green}]\n%F{white}Ω: ";
    };
  };

  programs.ssh = {
    enable = true;
    extraConfig = ''
    IdentityFile "~/.ssh/github"
    IdentityFile "~/.ssh/tyr"
    '';
  };

  programs.alacritty = {
    enable = true;
    settings = {
      font.size = 8;
    };
  };

  programs.rofi = {
    enable = true;
    theme = "sidebar";
  };

  services.picom = {
    enable = true;
    backend = "glx";
    refreshRate = 60;
  };

  programs.git = {
    enable = true;
    userName = "Matt Meyers";
    userEmail = "matt@mattmeyers.dev";
  };

  programs.vscode = {
    enable = true;
    extensions = [
      pkgs.vscode-extensions.bbenoist.Nix
    ];
  };

  programs.firefox = {
    enable = false;
    profiles = {
      myprofile = {
        settings = {
          "general.smoothScroll" = false;
        };
      };
    };
  };

  programs.go = {
    enable = true;
    goPath = ".go";
    goBin = ".local/bin";
  };

  xdg.userDirs = {
    enable = true;
    desktop = "\$HOME";
    documents = "\$HOME/documents";
    download = "\$HOME/downloads";
    music = "\$HOME";
    pictures = "\$HOME";
    publicShare = "\$HOME";
    templates = "\$HOME";
    videos = "\$HOME";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "20.03";

  nixpkgs.config = {
    allowUnfree = true;
  };
}
