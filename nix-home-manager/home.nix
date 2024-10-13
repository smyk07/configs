{ config, pkgs, ... }:

{
  home.username = "clix";
  home.homeDirectory = "/home/clix";

  home.stateVersion = "24.05"; # Please read the comment before changing.

  home.packages = [];

  home.file = {};

  home.sessionVariables = {};

  programs.home-manager.enable = true;
}
