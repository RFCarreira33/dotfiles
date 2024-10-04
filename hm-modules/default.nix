{ vars, lib, pkgs, ... }:
let
  is_nixos =
    if pkgs.system == "x86_64-linux"
      then true 
    else 
      false;
in
{
  imports = [
    ./graphical/default.nix
    ./terminal/default.nix
  ];

  nixpkgs = {
    config = {
      allowUnfree = true;
      allowUnfreePredicate = _: true;
    };
  };

  programs = {
    home-manager.enable = true;
    git = {
      enable = true;
      userName = "RFCarreira33";
      userEmail = "rodrigocarreira33@gmail.com";
    };

    zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;
      history.size = 10000;
      oh-my-zsh.enable = true;

      initExtra = "
        source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme
        [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
      ";

      shellAliases = {
        rebuild = if is_nixos then 
          "sudo nixos-rebuild switch --flake $DOTFILES"
        else 
          "darwin-rebuild switch --flake $DOTFILES";

        ls = "eza -l --git --icons=always --group-directories-first";
        c = "clear";
        cat = "bat";
        grep = "rg";
        dots = "cd $DOTFILES && nvim";
        gc = "nix-collect-garbage -d";
        neofetch = "fastfetch";
      };

    };
  };

  home = {
    username = vars.username;
    homeDirectory = lib.mkDefault "/home/${vars.username}";
    sessionVariables.DOTFILES =
    if is_nixos
      then "/home/${vars.username}/dotfiles/"
    else 
      "/Users/${vars.username}/dotfiles/";

    file = {
      ".p10k.zsh" = {
        source = ../home/.p10k.zsh;
        executable = true;
      };
      ".ideavimrc" = {
        source = ../home/.ideavimrc;
        executable = true;
      };
    };
  };

  systemd.user.startServices = "sd-switch";

  home.stateVersion = "24.05";
}
