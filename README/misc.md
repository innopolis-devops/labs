# Miscellaneous

What I learned while working on this repo

- If a command in a `Dockerfile` expects a string as a parameter, it should look like `["bash", "-c" "command" ]`

- Sometimes, Firefox refuses to connect to a `Docker` container. In this case, one needs to open a new tab

- VSCodium can't execute a command line `nix` if there is a dir called `nix` - [src](https://github.com/OmniSharp/omnisharp-vscode/pull/3372#issuecomment-546447471). That's why, I created `.nix` directories

- Environment variables aren't supported by `CMD` in `exec` mode - [src](https://docs.docker.com/engine/reference/builder/#cmd)

- One can bring any packages from `nixpkgs` into shell (provided there already is [bashInteractive](https://search.nixos.org/packages?channel=unstable&show=bashInteractive&from=0&size=50&sort=relevance&type=packages&query=bashinteractive)), e.g. `nix shell nixpkgs#poetry`

- It's possible to specify a `build` script for `dream2nix`'s package like this

```nix
dream2nix.lib.makeFlakeOutputs {
  systems = [ system ];
  config.projectRoot = ./.;
  source = gitignore.lib.gitignoreSource ./.;
  settings = [
    {
      subsystemInfo.nodejs = 16;
    }
  ];
  packageOverrides = {
    app_purescript = {
      "build" = {
        buildScript = ''
          PATH=${myTools.purs-0_15_4}/bin:$PATH
          ${myTools.spago}/bin/spago bundle-app --to dist/index.js --minify
        '';
      };
    };
  };
```
