{
  description = "Try-phi front end";

  inputs = {
    inputs.url = "github:br4ch1st0chr0n3/flakes?dir=inputs";
    nixpkgs.follows = "inputs/nixpkgs";
    flake-utils.follows = "inputs/flake-utils";
    gitignore.follows = "inputs/gitignore";
    # poetry2nix.follows = "inputs/poetry2nix";
    poetry2nix = {
      url = "github:br4ch1st0chr0n3/poetry2nix/patch-1";
      # flake = false;
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    { self
    , inputs
    , nixpkgs
    , flake-utils
    , gitignore
    , poetry2nix
    }:
      with flake-utils.lib;
      eachDefaultSystem (system:
      let
        myTools =
          builtins.attrValues {
            inherit (pkgs) poetry python310;
          };
        pkgs = nixpkgs.legacyPackages.${system};
        overlay = pkgs.lib.composeManyExtensions [
          poetry2nix.overlay
          (final: prev: {
            env = prev.poetry2nix.mkPoetryEnv {
              projectDir = ./.;
              python = pkgs.python310;
            };
            editablePackageSources = {
              my-app = ./app;
            };
          })
        ];
        p2nix = pkgs.extend overlay;
      in
      {
        inherit p2nix;
        devShells = {
          default = pkgs.mkShell {
            buildInputs = myTools;
          };
          poetry-env = p2nix.env;
        };
      });
  nixConfig = {
    extra-substituters = [
      https://nix-community.cachix.org
      https://br4ch1st0chr0n3-nix-managed.cachix.org
      https://br4ch1st0chr0n3-flakes.cachix.org
    ];
    extra-trusted-public-keys = [
      nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs=
      br4ch1st0chr0n3-nix-managed.cachix.org-1:sDKsfgu5fCCxNwVhZg+AWeGvbLlEtZoyzkSNKRM/KAo=
      br4ch1st0chr0n3-flakes.cachix.org-1:Dyc2yLlRIkdbq8CtfOe24QQhQVduQaezkyV8J9RhuZ8=
    ];
  };
}
