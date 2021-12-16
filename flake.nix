{
  description = "An assortment of VapourSynth plugins";

  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem
      (system:
        let
          pkgs = import nixpkgs {
            inherit system;
            overlays = [ (import ./overlay.nix) ];
            config.allowUnfree = true;
          };
        in
        {
          devShell = import ./default.nix { inherit pkgs; };
        }
      );
}
