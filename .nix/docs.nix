{ pkgs }:
let
  inherit (import ./data.nix)
    appName
    langs
    shellNames
    ports
    taskNames
    actions
    ;
  runTask = task: "`Command palette` -> `Tasks: Run Task` -> `${task}`";
  nixDevelop = shell: "`nix develop .#${shell}`";
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
    taskNames_ = taskNames lang;
    appName_ = appName lang;
    appNameInHeading = "${appName_}";
    shellNames_ = shellNames lang;
    actions_ = actions // { stop = "stop"; };
    actionNames = builtins.attrNames actions_;
  in
  [{ h2 = "${appNameInHeading} actions"; }] ++
  (
    pkgs.lib.lists.forEach actionNames (action:
      if action == actions_.stop then
        let stopApp = "Stop ${appNameInHeading}"; in
        [
          { h3 = stopApp; }
          { ol = [ "Press `Ctrl` (`Cmd`) + `C` in the terminal" ]; }
        ]
      else
        let
          taskName = taskNames_.${action};
          shellName = shellNames_.${action};
        in
        [
          { h3 = taskName; }
          {
            ol =
              if
                action == actions_.run ||
                action == actions_.dockerRun ||
                action == actions_.dockerBuild ||
                action == actions_.dockerStop
              then
                let
                  port = ports.${lang}.${action};
                in
                [
                  "${runTask taskName}"
                  { ol = [ "Or ${nixDevelop shellName}" ]; }
                ]
                ++
                (
                  if action == actions_.run || action == actions_.dockerRun then
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
