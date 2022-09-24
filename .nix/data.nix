let
  # app name coincides with app directory
  appName = lang: "app_${lang}";
  shellNames = lang:
    let app = "app-${lang}"; in
    {
      run = app;
      dockerBuild = "${app}-docker-build";
      dockerRun = "${app}-docker-run";
      dockerStop = "${app}-docker-rm";
    };
  taskNames = lang:
    let app = appName lang; in
    {
      run = "Run ${app}";
      dockerBuild = "Build ${app} in Docker";
      dockerRun = "Run ${app} in Docker";
      dockerStop = "Stop ${app} in Docker";
    };
  actions = (builtins.mapAttrs (name: val: name) (taskNames ""));
  ports =
    let
      app = "app";
      docker = "docker";
    in
    {
      python = {
        run = 8000;
        dockerRun = 8002;
      };
      purescript = {
        run = 8001;
        dockerRun = 8003;
      };
    };

  langPython = "python";
  langPurescript = "purescript";
  langs = [ langPython langPurescript ];
  dockerPorts = [ ports.python.docker ports.purescript.docker ];
  appPython = appName langPython;
  appPurescript = appName langPurescript;
in
{
  inherit
    shellNames
    taskNames
    actions
    ports
    appName
    langPython
    langPurescript
    langs
    dockerPorts
    appPurescript
    appPython
    ;
}
