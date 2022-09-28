# Time apps

## Descriptions

## app_python

- [PYTHON.md](./app_python/PYTHON.md)
- [README.md](./app_python/README.md)

## app_purescript

- [PYTHON.md](./app_purescript/PURESCRIPT.md)
- [README.md](./app_purescript/README.md)

## Nix

I used Nix to make a reproducible project environment. Now, the project ships with:

- VSCodium with all necessary extensions, settings (if you use our `codium`), and tasks
- dev shells
- startup scripts

## Setup

- Install [Nix](https://nixos.org/download.html) (Single-user installation)

  ```sh
  sh <(curl -L https://nixos.org/nix/install) --no-daemon
  ```

- Enable [flakes](https://nixos.wiki/wiki/Flakes#Permanent)

- Install [direnv](https://direnv.net/#basic-installation) - steps 1, 2

- Enter this project

```sh
git clone https://github.com/br4ch1st0chr0n3/devops-labs
cd devops-labs
git checkout lab2
nix registry add devops-labs github:br4ch1st0chr0n3/devops-labs
# wait
start-codium
```

- Next time, after entering the project, run

  ```sh
  nix profile update devops-labs/lab2
  ```

- In case the wrong Python `.venv` is sourced, run `Command Palette` -> `Python: Select Interpreter` -> `Python 3.10.6 ('.venv':poetry) ./.venv/bin/python` `Workspace`

- Use `nix show-derivation nixpkgs#spago` to look at its derivation's values

## Actions

See available actions documentation [here](./README/docs.md).

It's generated via [json2md](https://github.com/IonicaBizau/json2md) and formatted via [markdownlint-cli2](https://github.com/DavidAnson/markdownlint-cli2).

<!-- TODO created local configuration https://python-poetry.org/docs/configuration/ -->

- For Docker, I used a caching trick described [here](https://fastapi.tiangolo.com/deployment/docker/#docker-cache)

- Also, a [dotenv](https://hexdocs.pm/dotenvy/dotenv-file-format.html) file

- Followed 12-factor-app [guide](https://12factor.net/dev-prod-parity)

- [Adapted](https://github.com/svx/poetry-fastapi-docker)

- Used [heredocs](https://www.docker.com/blog/introduction-to-heredocs-in-dockerfiles/) in Dockerfile

## Miscellaneous

- Sometimes, Firefox refuses to connect to a docker container. In this case, one needs to open a new tab

- What are Docker image tags? - [src]
  - How to correctly tag?

- VSCodium can't execute a command line `nix` if there is a dir called `nix` - [src](https://github.com/OmniSharp/omnisharp-vscode/pull/3372#issuecomment-546447471)

- Environment variables aren't supported by `CMD` in `exec` mode - [src](https://docs.docker.com/engine/reference/builder/#cmd)

- You can bring any packages into shell from `nixpkgs`, e.g. `nix shell nixpkgs#poetry`

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

<!-- TODO cache to cachix during build -->

- Install:


<!-- TODO how to get size of a project in terms of its nix store part? -->
<!-- 
TODO add command to remove dangling images
https://docs.docker.com/engine/reference/commandline/images/#show-untagged-images-dangling
 
 
 -->

<!-- 
TODO add docker lock
https://github.com/safe-waters/docker-lock -->

 <!-- 
 TODO add task for spago2nix
 TODO build with spago -->


<!-- TODO rename commands to start with app_name -->

<!-- TODO 

1. Build project
   1. this creates devshells.env file in each dir
   2. When enter the dir, direnv sources this file
2. When need a devshell, run its command (sourced above)
   1. This will bring its set of deps into shell
3. We can build such devshells.envs
   1. project-wise
   2. module-wise

-->
<!-- TODO disable automatic numeration markdown -->