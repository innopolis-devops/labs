{
  description = "Try-phi front end";

  inputs = {
    my-inputs.url = "github:br4ch1st0chr0n3/flakes?dir=inputs";
    nixpkgs.follows = "my-inputs/nixpkgs";
    flake-utils.follows = "my-inputs/flake-utils";
    gitignore.follows = "my-inputs/gitignore";
    easy-purescript-nix.follows = "my-inputs/easy-purescript-nix";
    dream2nix.follows = "my-inputs/dream2nix";
    spago-nix.url = "github:ngua/spago.nix";
    my-codium.follows = "my-inputs/my-codium";
  };

  outputs =
    { self
    , my-inputs
    , nixpkgs
    , easy-purescript-nix
    , flake-utils
    , gitignore
    , dream2nix
    , spago-nix
    , my-codium
    }:
      with flake-utils.lib;
      eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};

        # spago-pkgs = pkgs.extend spago-nix.overlays.default;
        myTools =
          let
            easy-ps = import easy-purescript-nix { inherit pkgs; };
          in
          {
            inherit (easy-ps) purs-0_15_4 spago;
          };
        # project = spago-pkgs.spago-nix.spagoProject {
        #   name = "app_purescript";
        #   src = ./.;
        #   shell = {
        #     tools = [ ];
        #     #   # builtins.attrValues myTools;
        #   };
        # };
        # packages = project.flake.packages // {
        #   bundled-module = project.bundleModule { main = "Main"; };
        #   bundled-app = project.bundleApp { main = "Main"; };
        #   node-module = project.nodeApp { main = "Main"; };
        # };
      in
      {
        packages = {
          default = pkgs.writeShellApplication
            {
              name = "app-purescript";
              runtimeInputs = [ myTools.spago myTools.purs-0_15_4 pkgs.esbuild ];
              text = ''
                spago bundle-app --to dist/index.js --minify
              '';
            };
        };
        # shells = project.flake.devShells;
        devShells = {
          inherit (project.flake.devShells) default;
          dev = pkgs.mkShell {
            shellHook = ''
              dotenv -f app.env run x-var parcel serve -p %PORT% --host %HOST% dev/index.html
            '';
          };
        };
      });

  nixConfig = {
    extra-substituters = [
      https://haskell-language-server.cachix.org
      https://nix-community.cachix.org
      https://hydra.iohk.io
      https://br4ch1st0chr0n3.cachix.org
    ];
    extra-trusted-public-keys = [
      haskell-language-server.cachix.org-1:juFfHrwkOxqIOZShtC4YC1uT1bBcq2RSvC7OMKx0Nz8=
      nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs=
      hydra.iohk.io:f/Ea+s+dFdN+3Y/G+FDgSq+a5NEWhJGzdjvKNGv0/EQ=
      br4ch1st0chr0n3.cachix.org-1:o1FA93L5vL4LWi+jk2ECFk1L1rDlMoTH21R1FHtSKaU=
    ];
  };
}
