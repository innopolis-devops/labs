let
  # app name coincides with app directory
  appName = lang: "app_${lang}";
  commandNames = {
    apps = lang:
      let app = "app-${lang}"; in
      {
        run = app;
        test = "${app}-test";
        dockerBuild = "${app}-docker-build";
        dockerRun = "${app}-docker-run";
        dockerStop = "${app}-docker-stop";
        dockerPush = "${app}-docker-push";
        dockerPull = "${app}-docker-pull";
      };
  };
  taskNames = {
    apps = lang:
      let app = appName lang; in
      {
        run = "${app}: Run";
        test = "${app}: Test";
        dockerBuild = "${app}: Docker build";
        dockerRun = "${app}: Docker run";
        dockerStop = "${app}: Docker stop";
        # TODO push a specific service name
        dockerPush = "${app}: Push '${serviceNames.${lang}.web}' to Docker Hub";
        dockerPull = "${app}: Pull '${serviceNames.${lang}.web}' from Docker Hub";
      };
  };
  actionNames = {
    apps = builtins.mapAttrs (name: _: name) (taskNames.apps "");
  };

  langPython = "python";
  langPurescript = "purescript";
  langs = [ langPython langPurescript ];
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
    # ports
    appName
    langPython
    langPurescript
    langs
    # dockerPorts
    appPurescript
    appPython
    serviceNames
    DOCKER_PORT
    HOST_PORT
    ;
}
