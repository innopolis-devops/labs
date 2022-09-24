let
  inherit (import ./data.nix)
    shellNames
    langs
    taskNames
    ;
  tasksLang = lang:
    let
      taskNames_ = taskNames lang;
      shellNames_ = shellNames lang;
      commandTemplate = { lang, taskName, shellName }:
        {
          command = "nix";
          args = [
            "develop"
            ".#${shellName}"
          ];
          label = "${taskName}";
          options = {
            cwd = "\${workspaceFolder}";
          };
        };
      actions = builtins.attrNames taskNames_;
    in
    builtins.map
      (action: commandTemplate ({
        inherit lang;
        taskName = taskNames_.${action};
        shellName = shellNames_.${action};
      }))
      actions;
  tasks = builtins.concatMap tasksLang langs;
  tasksNix = {
    presentation = {
      panel = "new";
      reveal = "always";
    };
    version = "2.0.0";
    inherit tasks;
  };
in
tasksNix
