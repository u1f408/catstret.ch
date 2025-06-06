{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/release-24.11";
    fu.url = "github:numtide/flake-utils";
    compat = {
      url = "github:edolstra/flake-compat";
      flake = false;
    };
  };

  outputs = { self, fu, ... }@inputs: 
    fu.lib.eachDefaultSystem (system:
      let
        pkgs = import inputs.nixpkgs { inherit system; };
        inherit (pkgs) lib;

        devLibraries = with pkgs; [
          curl
          libffi
        ];

      in {
        devShells.default = pkgs.mkShell {
          LD_LIBRARY_PATH = lib.makeLibraryPath devLibraries;
          buildInputs = devLibraries ++ (with pkgs; [
            ruby_3_2
            jpegoptim
          ]);
        };
      });
}
