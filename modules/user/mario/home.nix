{ pkgs, ... }:
let
  userData = {
    fullName = "Mario Sanchez Lara";
    email = "mario@mariosl.com";
  };
in
{
  # home-manager state version (DO NOT MODIFY)
  home.stateVersion = "24.11";

  # Home packages
  home.packages = [
    pkgs.gcc

    pkgs.tree
    pkgs.eza
    pkgs.ripgrep

    pkgs.tree-sitter

    pkgs.nixfmt-rfc-style
    pkgs.nixd
    pkgs.lua-language-server

    pkgs.fastfetch
  ];

  programs.zsh = {
    enable = true;

    dotDir = ".config/zsh";

    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    initExtra = ''
      . $ZDOTDIR/modules/prompt.zsh
    '';
  };

  # Git
  programs.git = {
    enable = true;

    userName = userData.fullName;
    userEmail = userData.email;

    extraConfig = {
      init.defaultBranch = "main";
      push.autoSetupRemote = true;
    };

    aliases = {
      s = "status";
      adog = "log --all --decorate --oneline --graph";
    };
  };

  # GitHub CLI
  programs.gh = {
    enable = true;
    gitCredentialHelper.enable = true;
  };

  # Neovim
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
  };

  # XDG
  xdg = {
    enable = true;

    configFile = {
      "ghostty/config" = {
        source = ../../xdg-config/ghostty/config;
      };
      "zsh/modules" = {
        source = ../../xdg-config/zsh-modules;
      };
      "homebrew" = {
        source = ../../xdg-config/homebrew;
      };
    };
  };
}
