{ inputs, lib, config, pkgs, ... }:
{
  options.chromeModule.enable = lib.mkEnableOption "Enables chrome module";

  config = lib.mkIf config.chromeModule.enable {
    programs.chromium = {
      enable = true;
      extensions = [
        "gebbhagfogifgggkldgodflihgfeippi" # yt dislike
        "eimadpbcbfnmbkopoojfekhnkhdbieeh" # darkreader
        "cjpalhdlnbpafiamejdnhcphjbkeiagm" # ublock
        "ojbkmmcompidaghfnodmbeiankbbfckl" # fd blocker
        "hkedbapjpblbodpgbajblpnlpenaebaa" # elasticvue 
        "eokjikchkppnkdipbiggnmlkahcdkikp" # color picker

        "ajopnjidmegmdimjlfnijceegpefgped" # twitch
        "ammjkodgmmoknidbanneddgankgfejfh"
      ];
    };
  };
}
