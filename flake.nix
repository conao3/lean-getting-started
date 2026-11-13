{
  description = "Independent Lean practice projects";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
    treefmt-nix = {
      url = "github:numtide/treefmt-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs:
    inputs.flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [
        "x86_64-linux"
        "aarch64-darwin"
      ];
      imports = [ inputs.treefmt-nix.flakeModule ];
      perSystem = { pkgs, ... }: {
        treefmt = {
          projectRootFile = "flake.nix";
          programs.nixfmt.enable = true;
        };
        devShells.default = pkgs.mkShell {
          packages = [
            pkgs.lean4
            pkgs.gnumake
          ];
        };
        packages.default = pkgs.stdenv.mkDerivation {
          pname = "lean-getting-started";
          version = "0.1.0";
          src = ./.;
          nativeBuildInputs = [ pkgs.lean4 ];
          buildPhase = ''
            runHook preBuild
            export HOME="$TMPDIR"
            make build
            runHook postBuild
          '';
          installPhase = ''
            runHook preInstall
            install -Dm755 src/01-basics/.lake/build/bin/demo "$out/bin/basics"
            install -Dm755 src/02-proofs/.lake/build/bin/demo "$out/bin/proofs"
            runHook postInstall
          '';
          meta = {
            mainProgram = "basics";
            license = pkgs.lib.licenses.asl20;
          };
        };
      };
    };
}
