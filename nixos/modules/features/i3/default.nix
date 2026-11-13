{ self, inputs, moduleWithSystem, ... }: {
  flake.nixosModules.i3 = moduleWithSystem({ pkgs, self', lib, ... }: {
    services = {
      displayManager.defaultSession = "xfce+i3";

      xserver = {
        enable = true;
        # videoDrivers = [ "intel" ];
        # deviceSection = ''
        #   Option "DRI" "2"
        #   Option "TearFree" "true"
        # '';

        desktopManager = {
          xterm.enable = false;
          xfce = {
            enable = true;
            noDesktop = true;
            enableXfwm = false;
          };
        };

        windowManager.i3 = {
          enable = true;
          package = self'.packages.i3;
          extraPackages = with pkgs; [
            rofi
            # i3status-rust
            rofi-power-menu
            rofi-file-browser
            nerd-fonts.hack
          ] ++ (with self'.packages; [
            i3status-rust
          ]);
        };
      };
    };
  });

  perSystem = { pkgs, lib, self', ... }: {
    packages.i3 = inputs.wrapper-modules.lib.wrapPackage({...}: {
        inherit pkgs;
        package = pkgs.i3;

        runtimePkgs = with pkgs; [
          xrandr
          xclip
        ]
        ++ ([
          {
            data = self'.packages.alacritty;
            prefix = true;
          }
          self'.packages.zsh
        ]);

        flags = {
          "-c" = ./config;
        };
      });
  };
}

