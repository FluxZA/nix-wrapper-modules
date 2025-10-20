{ wlib, lib }:
lib.mapAttrs' (
  name: type: lib.nameValuePair name (import ./modules/${name}/module.nix { inherit wlib lib; })
) (lib.filterAttrs (_: type: type == "directory") (builtins.readDir ./modules))
