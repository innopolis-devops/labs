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
      taskNames_ = taskNames lang;
      commandNames_ = commandNames lang;
      mkCommand = { lang, taskName, commandName }:
        {
          command = commands.${commandName}.name;
          label = "${taskName}";
          options = {
            cwd = "\${workspaceFolder}";
          };
        };
      actionNames = builtins.attrNames taskNames_;
    in
    builtins.map
      (action: mkCommand ({
        inherit lang;
        taskName = taskNames_.${action};
        commandName = commandNames_.${action};
      }))
      actionNames;
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
