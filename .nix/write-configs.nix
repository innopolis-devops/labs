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
    DOCKER_PORT
    HOST_PORT
    ;
  # all scripts assume calling from the root directory of the project
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
        ${json2md_.packageName} ${docsFileJson} > ${docsMdPath};
        ${mdlint.packageName}-fix ${docsMdPath}
        rm ${docsFileJson}
        printf "${framedBrackets "%s"}" "ok ${name}"
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
