{ config, pkgs, ... }:

{
    imports = [<home-manager/nixos> ];

    users.users.matt = {
        isNormalUser = true;
        extraGroups = [ "wheel" "networkmanager"  ];
        shell = pkgs.zsh;
    };

    home-manager.users.matt = (import ./matt/core.nix);
}