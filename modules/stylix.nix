{ inputs, lib, config, pkgs, ... }:
{
  options.stylixModule.enable = lib.mkEnableOption "Enables Stylix module";

  config = lib.mkIf config.stylixModule.enable {
    stylix = with pkgs; {
      enable = true;
      base16Scheme = {
        yaml = "${base16-schemes}/share/themes/gruvbox-dark-hard.yaml";
        use-ifd = "auto";
      };
      polarity = "dark";
      fonts = lib.mkDefault {
        monospace = {
          package = nerd-fonts.hack;
          name = "Hack Nerd Font Mono";
        };
        sansSerif = {
          package = dejavu_fonts;
          name = "DejaVu Sans";
        };
        serif = {
          package = dejavu_fonts;
          name = "DejaVu Serif";
        };
        emoji = {
          package = noto-fonts-color-emoji;
          name = "Noto Color Emoji";
        };
      };
      image = ../resources/wall.jpg;
    };

    fonts.packages = with pkgs; [
      nerd-fonts.hack
      noto-fonts
      noto-fonts-color-emoji
      noto-fonts-cjk-sans
    ];
  };
}
