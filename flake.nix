# flake.nix

{
  description = "Mamelon Hi-Regular flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    systems.url = "github:nixos/nixpkgs/nixos-unstable";
  };
  outputs =
    {
      self,
      nixpkgs,
      # systems,
      ...
    }@inputs:
    let
      forEachSystem =
        function:
        nixpkgs.lib.genAttrs [ "x86_64-linux" ] (system: function nixpkgs.legacyPackages.${system});
    in
    {
      packages = forEachSystem (pkgs: rec {
        mamelon = pkgs.callPackage ./package.nix {
          #   version =
          #     if self ? "shortRev" then
          #       self.shortRev
          #     else
          #       nixpkgs.lib.replaceStrings [ "-dirty" ] [ "" ] self.dirtyShortRev;
        };
        default = mamelon;
      });
    };
}
