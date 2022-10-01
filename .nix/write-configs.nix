{ my-json2md
, system
, codiumTools
, pkgs
, commands
}:
let
  inherit (codiumTools)
    mkShellApp
    writeSettingsJson
    writeTasksJson
    settingsNix
    writeJson
    ;
  inherit (import ./data.nix)
    commandNames
    taskNames
    appPurescript
    DOCKER_PORT
    HOST_PORT
    ;
  # all scripts assume calling from the root directory of the project
  writeDocs =
    let
      docsNix = import ./docs.nix { inherit pkgs; };
      docsFileJson = "docs.json";
      docsJson = writeJson "docs" "./${docsFileJson}" docsNix;
      docsMdFile = "docs.md";
      docsMdDir = "README";
      docsMdPath = "${docsMdDir}/${docsMdFile}";
      json2md = my-json2md.packages.${system}.default;
      mdlint = pkgs.nodePackages.markdownlint-cli2;
    in
    mkShellApp rec {
      name = "write-docs-md";
      runtimeInputs = [
        pkgs.nodejs-16_x
        docsJson
        json2md
        mdlint
      ];
      text = ''
        ${docsJson.name};
        mkdir -p ${docsMdDir}
        ${json2md.packageName} ${docsFileJson} > ${docsMdPath};
        ${mdlint.packageName}-fix ${docsMdPath}
        rm ${docsFileJson}
        printf "\n[%s]\n" "ok ${name}"
      '';
    };
  writeMarkdownlintConfig =
    writeJson "markdownlint" "./configs/.markdownlint.json" (import ./markdownlint-config.nix);
  writeSettings = writeSettingsJson (import ./settings.nix {
    inherit settingsNix;
  });
  writeTasks = writeTasksJson (import ./tasks.nix { inherit commands; });
  writeConfigs =
    mkShellApp {
      name = "write-configs";
      runtimeInputs = [
        writeSettings
        writeTasks
        writeDocs
        writeMarkdownlintConfig
        writeRootPyproject
      ];
      text = ''
        ${writeSettings.name}
        ${writeTasks.name}
        ${writeDocs.name}
        ${writeMarkdownlintConfig.name}
        ${writeRootPyproject.name}
      '';
    };
  writeRootPyproject =
    let
      script = "./scripts/update-root-pyproject.py";
      appPythonTOML = "./app_python/pyproject.toml";
      rootTOML = "./pyproject.toml";
      python = pkgs.python310.withPackages (x: with x; [ python310Packages.tomlkit ]);
      poetry = pkgs.poetry;
    in
    mkShellApp {
      runtimeInputs = [ poetry ];
      name = "write-root-project";
      text = ''
        ${poetry.pname} run python ${script} ${appPythonTOML} ${rootTOML}
        chmod +w ${rootTOML}
        ${poetry.pname} update
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
