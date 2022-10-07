{ pkgs, env2json, system }:
let
  inherit (import ./data.nix)
    appName
    langs
    commandNames
    taskNames
    actionNames
    ;
  runTask = task: "`Command palette` -> `Tasks: Run Task` -> `${task}`";
  nixDevelop = command: "`${command}`";
  link = title: source: "[${title}](${source})";
  page = link "page";
  projectRoot = "$PROJECT_ROOT";
  projectRoot_ = "`${projectRoot}`";
  dotenv = ".env";
in
[
  { h1 = "Available actions"; }
  ''
    These docs are generated from [docs.nix](../.nix/docs.nix) via [json2md](https://github.com/IonicaBizau/json2md) 
    and formatted via [markdownlint-cli2](https://github.com/DavidAnson/markdownlint-cli2). 
    The command to write the docs:

    ```terminal
    nix run .#writeDocs
    ```
  ''
  { h2 = "Keybindings"; }
  {
    ul = [
      "`Command palette` - press `Ctrl` (`Cmd`) + `Shift` + `P`"
      "Stop app - press `Ctrl` (`Cmd`) + `C` in the terminal where that app is running"
      ({ ul = [ "Alternatively, run the corresponding task" ]; })
    ];
  }
  {
    h2 = "Warnings";
  }
  {
    h3 = "Environment";
  }

  ''
    The commands below read from `${dotenv}` files both from app folders and from the ${projectRoot_}.
    I checked them into the repo to ease the project demonstration. 
    If you'd like to push to your [cachix](https://www.cachix.org/) cache or [Docker Hub](https://hub.docker.com/) repo, 
    make sure to edit the `${projectRoot}/${dotenv}` to use locally the tasks depending on it.
    Otherwise, you may supply these values as the environment variables 
    via the `set -a` - [trick](https://stackoverflow.com/a/45971167)
  ''
  {
    h3 = "Commands and Tasks";
  }
  ''
    If Tasks don't work inside VSCodium, try them in an ordinary terminal. 
    Open it in the ${projectRoot_} directory and explore the available commands (`packages`).
    I added the descriptions to some of them
  ''
  {
    code = {
      "language" = "terminal";
      "content" = ''
        $ nix flake show
        # may be not up to date
        ...
        └───packages
          ...
          └───x86_64-linux
              ...
              ├───createVenvs: package 'createVenvs'
              ├───default: package 'codium'
              ├───desc: package 'desc'
              ├───format: package 'flakes-format'
              ├───lintDockerfiles: package 'lintDockerfiles'
              ├───pushToCachix: package 'flakes-push-to-cachix-in-each-dir'
              ├───togglePaths: package 'flakes-toggle-relative-paths'
              ├───updateLocks: package 'flakes-update-in-each-dir'
              ├───writeConfigs: package 'write-configs'
              ├───writeDocs: package 'write-docs-md'
              ├───writeMarkdownlintConfig: package 'write-markdownlint-json'
              ├───writeRootPyproject: package 'write-root-project'
              ├───writeSettings: package 'write-settings-json'
              └───writeTasks: package 'write-tasks-json'
        $ nix run .#desc .#desc
        ... description in Markdown ...
        $ nix run .#desc .#writeTasks
        ... description in Markdown ...
      '';
    };
  }
  ''
    To make the commands from the next section available in your terminal, hit in the ${projectRoot_}:
    ```sh
    nix develop
    ```
    If you use VSCodium, they're bundled into it and should be available in its terminal
  ''
]
++
(
  let
    actionNames_ = actionNames.apps // { stop = "stop"; };
    mkJSON = env2json.functions.${system}.mkJSON;
    ports =
      builtins.foldl' (a: b: a // b) { } (builtins.map
        (lang:
          let
            f = envName: builtins.fromJSON (
              builtins.readFile "${(mkJSON ../${appName lang}/${envName}.env).out}/.json"
            );
          in
          {
            ${lang} = {
              ${actionNames_.run} = f "app";
              ${actionNames_.dockerRun} = f "";
            };
          }
        )
        langs
      );
  in
  (pkgs.lib.trivial.flip builtins.concatMap) langs (lang:
    let
      taskNames_ = taskNames.apps lang;
      appName_ = appName lang;
      appNameInHeading = "${appName_}";
      commandNames_ = commandNames.apps lang;
      actionNamesList = builtins.attrNames actionNames_;
    in
    [{ h2 = "`${appNameInHeading}` actions"; }] ++
    (
      pkgs.lib.lists.forEach actionNamesList (action:
        if action == actionNames_.stop then
          let stopApp = "${appNameInHeading}: Stop"; in
          [
            { h3 = stopApp; }
            { ol = [ "Press `Ctrl` (`Cmd`) + `C` in the terminal" ]; }
          ]
        else
          let
            taskName = taskNames_.${action};
            commandName = commandNames_.${action};
          in
          [
            { h3 = taskName; }
            {
              ol =
                if builtins.hasAttr action
                  {
                    inherit (actionNames_)
                      run dockerRun dockerBuild dockerStop dockerPush dockerPull;
                  }
                then
                  [
                    ''${runTask taskName}
                    ''
                    {
                      ol = [ ''Or ${nixDevelop "(cd ${appName_} && ${commandName})"}'' ];
                    }
                  ]
                  ++
                  (
                    if builtins.hasAttr action { inherit (actionNames_) run dockerRun; } then
                      let
                        belongsTo = val: set: builtins.elem val (builtins.attrValues set);
                        PORT = "PORT";
                        HOST_PORT = "HOST_PORT";
                        port = ports.${lang}.${action}.${if action == actionNames_.run then PORT else HOST_PORT};
                        HOST = "HOST";
                        host = ports.${lang}.${action}.${HOST};
                        address = "http://${host}:${port}";
                      in
                      [ "Open ${page address} in a browser" ]
                    else [ ]
                  )
                else [ ]
              ;
            }
          ])
    )
  )
)
