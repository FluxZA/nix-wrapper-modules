{
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs =
    { self, nixpkgs }:
    {
      lib = import ./lib.nix { lib = nixpkgs.lib; };
      wrapperModules = import ./modules.nix {
        lib = nixpkgs.lib;
        wlib = self.lib;
      };
      formatter = nixpkgs.lib.genAttrs [
        "x86_64-linux"
        "aarch64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ] (arch: nixpkgs.legacyPackages.${arch}.nixfmt-tree);
    };
}
