{ inputs, ... }: {
  flake.nixosModules.gtk = { pkgs, lib, ... }: {
    environment.systemPackages = with pkgs; [
      gruvbox-dark-gtk
      gruvbox-dark-icons-gtk
    ];

    programs = {
      xfconf.enable = true;
      dconf = {
        enable = true;
        profiles.user.databases = [
          {
            lockAll = false;
            settings = {
              "org/gnome/desktop/interface" = {
                gtk-theme = "gruvbox-dark";
                icon-theme = "oomox-gruvbox-dark";
                color-scheme = "prefer-dark";
              };
            };
          }
        ];
      };
    };
  };
}
