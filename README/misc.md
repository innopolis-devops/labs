# Miscellaneous

What I learned while working on this repo

- If a command in a `Dockerfile` expects a string as a parameter, it should look like `["bash", "-c" "command" ]`

- Sometimes, Firefox refuses to connect to a `Docker` container. In this case, one needs to open a new tab

- VSCodium can't execute a command line `nix` if there is a dir called `nix` - [src](https://github.com/OmniSharp/omnisharp-vscode/pull/3372#issuecomment-546447471). That's why, I created `nix-files` directories

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

- Interactive diagrams of `/nix/store` - [nix-du](https://github.com/symphorien/nix-du)

- can't un-ignore a file if its parent dir is ignored `.gitignore` - [SO](https://stackoverflow.com/a/5285539)

- Get branch from `upstream` into fork - [src](https://stackoverflow.com/a/4410502)

## Stuff I made along the way

- [Tutorials and Notes](https://github.com/deemp/the-little-things) (also on Nix)
- [flakes](https://github.com/deemp/flakes) - library-monorepo with nix my flakes
- [vscodium-extensions](https://github.com/deemp/vscodium-extensions)
  - customizable list of extensions - [here](https://github.com/deemp/vscodium-extensions/tree/master)
  - a larger list of extensions - [here](https://github.com/deemp/vscodium-extensions/tree/fix-ci)

## TODO

- [ ] Pure Nix builds for:

  - [ ] `app_purescript` - via [spago.nix](https://github.com/ngua/spago.nix)
  - [ ] `app_python` - via [poetry2nix](https://github.com/nix-community/poetry2nix)

- [ ] Additional tasks.
  - [ ] `Docker`: remove dangling images - [src](https://docs.docker.com/engine/reference/commandline/images/#show-untagged-images-dangling)
  - [ ] Lint files
- [ ] `desc` - use this nix eval

  ```terminal
  nix eval nix#checks.x86_64-linux --apply builtins.attrNames
  ```

## Ansible

- If write 2 roles with `vars` in a step, they will both run. Example - 2 docker containers
- If playbooks are in two separate steps, only 1 of them will run
