{ commands }:
let
  inherit (import ./data.nix)
    commandNames
    langs
    taskNames
    actionNames
    ;
  tasksLang = lang:
    let
      taskNames_ = taskNames.apps lang;
      commandNames_ = commandNames.apps lang;
      mkCommand = { lang, taskName, commandName }:
        {
          command = commands.apps.${commandName}.name;
          label = "${taskName}";
          options = {
            cwd = "\${workspaceFolder}";
          };
        };
      actionNames_ = builtins.attrValues actionNames.apps;
    in
    builtins.map
      (action: mkCommand ({
        inherit lang;
        taskName = taskNames_.${action};
        commandName = commandNames_.${action};
      }))
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
