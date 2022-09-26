{ pkgs }:
let
  inherit (import ./data.nix)
    appName
    langs
    commandNames
    ports
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
(pkgs.lib.trivial.flip builtins.concatMap) langs (lang:
  let
    taskNames_ = taskNames.apps lang;
    appName_ = appName lang;
    appNameInHeading = "${appName_}";
    packageNames_ = commandNames.apps lang;
    actionNames_ = actionNames.apps // { stop = "stop"; };
    actionNamesList = builtins.attrNames actionNames_;
  in
  [{ h2 = "${appNameInHeading} actions"; }] ++
  (
    pkgs.lib.lists.forEach actionNamesList (action:
      if action == actionNames_.stop then
        let stopApp = "Stop ${appNameInHeading}"; in
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
              if
                action == actionNames_.run ||
                action == actionNames_.dockerRun ||
                action == actionNames_.dockerBuild ||
                action == actionNames_.dockerStop
              then
                let
                  port = ports.${lang}.${action};
                in
                [
                  "${runTask taskName}"
                  { ol = [ "Or ${nixDevelop packageName}" ]; }
                ]
                ++
                (
                  if action == actionNames_.run || action == actionNames_.dockerRun then
                    let
                      address = port: "http://127.0.0.1:${builtins.toString port}";
                    in
                    [ "Open ${page (address port)} in a browser" ]
                  else [ ]
                )
              else [ ]
            ;
          }
        ])
  )
)
