{ json2md
, system
, drv-tools
, pkgs
, commands
, env2json
, my-codium
}:
let
  inherit (drv-tools.functions.${system})
    mkShellApp
    writeJson
    framedBrackets
    mkBin
    ;
  inherit (my-codium.configs.${system})
    settingsNix
    ;
  inherit (my-codium.functions.${system})
    writeSettingsJson
    writeTasksJson
    ;
  inherit (import ./data.nix)
    commandNames
    taskNames
    appPurescript
    appPython
    DOCKER_PORT
    HOST_PORT
    ;
  # all scripts assume calling from the $PROJECT_ROOT
  writeDocs =
    let
      docsNix = import ./docs.nix { inherit pkgs env2json system; };
      docsFileJson = "docs.json";
      docsJson = writeJson "docs" "./${docsFileJson}" docsNix;
      docsMdFile = "docs.md";
      docsMdDir = "README";
      docsMdPath = "${docsMdDir}/${docsMdFile}";
      json2md_ = json2md.packages.${system}.default;
      mdlint = pkgs.nodePackages.markdownlint-cli2;
    in
    mkShellApp rec {
      name = "write-docs-md";
      runtimeInputs = [
        pkgs.nodejs-16_x
        docsJson
        json2md_
        mdlint
      ];
      text = ''
        ${docsJson.name};
        mkdir -p ${docsMdDir}
        ${json2md_.packageName} ${docsFileJson} > ${docsMdPath}
        ${mdlint.packageName}-fix ${docsMdPath} || echo ""
        rm ${docsFileJson}
        printf "${framedBrackets "%s"}" "ok ${name}"
      '';
      longDescription = ''
        Write `${docsMdDir}/${docsMdFile}` which documents the available commands and tasks
      '';
    };
  writeMarkdownlintConfig =
    writeJson "markdownlint" "./configs/.markdownlint.json" (import ./markdownlint-config.nix);
  writeSettings = writeSettingsJson (import ./settings.nix {
    inherit settingsNix;
  });
  writeTasks = writeTasksJson (import ./tasks.nix { inherit commands drv-tools system; });
  writeConfigs =
    mkShellApp {
      name = "write-configs";
      text = ''
        ${mkBin writeSettings}
        ${mkBin writeTasks}
        ${mkBin writeDocs}
        ${mkBin writeMarkdownlintConfig}
        ${mkBin writeRootPyproject}
      '';
    };
  writeRootPyproject =
    let
      script = "./scripts/update-root-pyproject.py";
      pyproject = "pyproject.toml";
      appPythonTOML = "${appPython}/${pyproject}";
      appPurescriptTOML = "${appPurescript}/${pyproject}";
      rootTOML = "${pyproject}";
      targets = [appPython appPurescript];
      python = pkgs.python310.withPackages (x: with x; [ pkgs.python310Packages.tomlkit ]);
    in
    mkShellApp {
      runtimeInputs = [ pkgs.poetry python ];
      name = "write-root-project";
      text = ''
        chmod +w ${rootTOML}
        python ${script} ${appPythonTOML} ${rootTOML}
        python ${script} ${appPurescriptTOML} ${rootTOML}
        poetry update
      '';
    };
in
{
  inherit
    writeDocs
    writeTasks
    writeSettings
    writeMarkdownlintConfig
    writeConfigs
    writeRootPyproject;
}
