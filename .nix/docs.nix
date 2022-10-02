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
  nixDevelop = command: "`$ ${command}`";
  link = title: source: "[${title}](${source})";
  page = link "page";
in
[
  { h1 = "Available actions"; }
  { h2 = "Keybindings"; }
  { ul = [ "`Command palette` - press `Ctrl` (`Cmd`) + `Shift` + `P`" ]; }
  {
    h2 = "Warning";
  }
  {
    p = [
      "Commands may not work inside VSCodium."
      "In this case, you may use an ordinary terminal."
      "Open it in the project's root directory and explore the available `devShells`."
    ];
  }
  {
    code = {
      "language" = "sh";
      "content" = ''
        $ nix repl
        nix-repl> :lf .
        nix-repl> devShells.<TAB>
        # formatted for demo purpose
        devShells.aarch64-darwin  
        devShells.aarch64-linux   
        devShells.i686-linux      
        devShells.x86_64-darwin   
        devShells.x86_64-linux
        nix-repl> p = devShells.x86_64-linux
        nix-repl> p.<TAB>
        # formatted for demo purpose
        p.app-purescript               
        p.app-purescript-docker-build  
        p.app-purescript-docker-rm     
        p.app-purescript-docker-run    
        p.app-python                   
        p.app-python-docker-build      
        p.app-python-docker-rm         
        p.app-python-docker-run        
        p.codium
        p.default
        p.update-flakes
        nix-repl> :?
        # list of available commands
        nix-repl> :q
        # the line below is a command in a terminal
        $ nix develop .#app-python
      '';
    };
  }
]
++
(
  let
    actionNames_ = actionNames.apps // { stop = "stop"; };
    mkJSON = env2json.tools.${system}.mkJSON;
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
      packageNames_ = commandNames.apps lang;
      actionNamesList = builtins.attrNames actionNames_;
    in
    [{ h2 = "${appNameInHeading} actions"; }] ++
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
            packageName = packageNames_.${action};
          in
          [
            { h3 = taskName; }
            {
              ol =
                if builtins.hasAttr action { inherit (actionNames_) run dockerRun dockerBuild dockerStop; }
                then
                  [
                    "${runTask taskName}"
                    { ol = [ "Or ${nixDevelop packageName}" ]; }
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
