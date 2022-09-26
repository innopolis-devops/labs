let
  # app name coincides with app directory
  appName = lang: "app_${lang}";
  commandNames = {
    apps = lang:
      let app = "app-${lang}"; in
      {
        run = app;
        dockerBuild = "${app}-docker-build";
        dockerRun = "${app}-docker-run";
        dockerStop = "${app}-docker-rm";
      };
  };
  taskNames = {
    apps = lang:
      let app = appName.apps lang; in
      {
        run = "${app}: Run";
        dockerBuild = "${app}: Docker build";
        dockerRun = "${app}: Docker run";
        dockerStop = "${app}: Docker stop";
      };
  };
  actionNames = {
    apps = builtins.mapAttrs (name: _: name) (taskNames.apps "");
  };

  ports =
    let
      app = "app";
      docker = "docker";
    in
    {
      python = {
        run = 8000;
        dockerRun = 8002;
        dockerInternal = 80;
      };
      purescript = {
        run = 8001;
        dockerRun = 8003;
        dockerInternal = 80;
      };
    };

  langPython = "python";
  langPurescript = "purescript";
  langs = [ langPython langPurescript ];
  dockerPorts = [ ports.python.dockerRun ports.purescript.dockerRun ];
  appPython = appName langPython;
  appPurescript = appName langPurescript;
  DOCKER_PORT = "DOCKER_PORT";
  HOST_PORT = "HOST_PORT";
  serviceNames = {
    ${langPurescript}.web = "web";
    ${langPython}.web = "web";
  };
in
{
  inherit
    commandNames
    taskNames
    actionNames
    ports
    appName
    langPython
    langPurescript
    langs
    dockerPorts
    appPurescript
    appPython
    serviceNames
    DOCKER_PORT
    HOST_PORT
    ;
}
