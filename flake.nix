{
  description = "Yuki Code flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    systems.url = "github:nix-systems/default";
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
        yuki = pkgs.callPackage ./package.nix { };
        default = yuki;
      });
    };
}
