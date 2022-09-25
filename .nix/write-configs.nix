{ my-json2md
, system
, codiumTools
, pkgs
}:
let
  inherit (codiumTools)
    writeShellApplicationUnchecked
    writeSettingsJson
    writeTasksJson
    settingsNix
    writeJson
    ;
  inherit (import ./data.nix)
    shellNames
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
      # gives write-docs-json executable
      docsJson = writeJson "docs" "./" docsFileJson docsNix;
      docsMdFile = "docs.md";
      docsMdDir = "README";
      docsMdPath = "${docsMdDir}/${docsMdFile}";
      json2md = my-json2md.packages.${system}.default;
    in
    writeShellApplicationUnchecked rec {
      name = "write-docs-md";
      runtimeInputs = [
        pkgs.nodejs-16_x
        docsJson
        json2md
        pkgs.nodePackages.markdownlint-cli2
      ];
      text = ''
        write-docs-json
        mkdir -p ${docsMdDir}
        json2md ${docsFileJson} > ${docsMdPath};
        markdownlint-cli2-fix ${docsMdPath}
        rm ${docsFileJson}
        printf "\n[%s]\n" "ok ${name}"
      '';
    };
  writeMarkdownlintConfig =
    writeJson "markdownlint" "./configs" ".markdownlint.json" (import ./markdownlint-config.nix);
  writeSettings = writeSettingsJson (import ./settings.nix {
    inherit settingsNix;
  });
  writeTasks = writeTasksJson (import ./tasks.nix);
  writeConfigs =
    writeShellApplicationUnchecked {
      name = "write-configs";
      runtimeInputs = [
        writeSettings
        writeTasks
        writeDocs
        writeMarkdownlintConfig
      ];
      text = ''
        write-settings-json
        write-tasks-json
        write-docs-md
        write-markdownlint-json
      '';
    };
in
{
  inherit
    writeDocs
    writeTasks
    writeSettings
    writeMarkdownlintConfig
    writeConfigs;
}
