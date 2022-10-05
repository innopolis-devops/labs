{ commands, drv-tools, system}:
let
  inherit (import ./data.nix)
    commandNames
    langs
    taskNames
    actionNames
    appName
    ;
  inherit (drv-tools.functions.${system})
    mkBin
    ;
  tasksLang = lang:
    let
      taskNames_ = taskNames.apps lang;
      commandNames_ = commandNames.apps lang;
      dir_ = appName lang;
      # cwd relative to the workspace folder
      mkCommand = { lang, taskName, commandName, cwd ? "." }:
        {
          command = mkBin commands.apps.${commandName};
          label = "${taskName}";
          options = {
            cwd = "\${workspaceFolder}/${cwd}";
          };
        };
      actionNames_ = builtins.attrValues actionNames.apps;
    in
    builtins.map
      (action: mkCommand
        (
          {
            inherit lang;
            taskName = taskNames_.${action};
            commandName = commandNames_.${action};
            cwd = dir_;
          }
        )
      )
      actionNames_;
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
