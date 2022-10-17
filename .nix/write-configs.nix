{ json2md
, system
, drv-tools
, pkgs
, commands
, env2json
, my-codium
, refmt
, hcl-terraform
}:
let
  inherit (drv-tools.functions.${system})
    mkShellApp writeJSON framedBrackets mkBin
    withLongDescription concatStringsNewline;
  inherit (my-codium.configs.${system})
    settingsNix;
  inherit (my-codium.functions.${system})
    writeSettingsJSON writeTasksJSON;
  inherit (import ./data.nix)
    commandNames taskNames appPurescript
    appPython DOCKER_PORT HOST_PORT;
  refmt_ = refmt.packages.${system}.default;
  # all scripts assume calling from the $PROJECT_ROOT
  writeDocs =
    let
      docsNix = import ./docs.nix { inherit pkgs env2json system; };
      docsFileJSON = "docs.json";
      docsJSON = writeJSON "docs" "./${docsFileJSON}" docsNix;
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
        docsJSON
        json2md_
        mdlint
      ];
      text = ''
        ${docsJSON.name};
        mkdir -p ${docsMdDir}
        ${json2md_.packageName} ${docsFileJSON} > ${docsMdPath}
        ${mdlint.packageName}-fix ${docsMdPath} || echo ""
        rm ${docsFileJSON}
        printf "${framedBrackets "%s"}" "ok ${name}"
      '';
      longDescription = ''
        Write `${docsMdDir}/${docsMdFile}` which documents the available commands and tasks
      '';
    };
  writeMarkdownlintConfig =
    writeJSON "markdownlint" "./configs/.markdownlint.json" (import ./markdownlint-config.nix);
  writeSettings = writeSettingsJSON (import ./settings.nix {
    inherit settingsNix;
  });
  writeTasks = writeTasksJSON (import ./tasks.nix { inherit commands drv-tools system; });
  writeRootPyproject =
    let
      script = "./scripts/update-root-pyproject.py";
      pyproject = "pyproject.toml";
      appPythonTOML = "${appPython}/${pyproject}";
      appPurescriptTOML = "${appPurescript}/${pyproject}";
      rootTOML = "${pyproject}";
      targets = [ appPython appPurescript ];
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
  inherit (pkgs.lib.strings) concatMapStringsSep;
  writeConfigs =
    mkShellApp {
      name = "write-configs";
      text = concatMapStringsSep "\n" mkBin
        (builtins.attrValues {
          inherit writeSettings writeTasks writeDocs
            writeMarkdownlintConfig writeRootPyproject writeWorkflows;
        })
      ;
    };
  writeTerraform =
    let
      inherit (hcl-terraform.functions.${system}) writeFiles;
      docker = import ./terraform/docker.nix { inherit pkgs system hcl-terraform; };
      yc = import ./terraform/yc.nix { inherit pkgs system hcl-terraform; };
      dirDocker = "terraform/docker";
      dirYC = "terraform/yc";
    in
    writeFiles [
      { expr = docker.tfvars; filePath = "${dirDocker}/terraform.tfvars"; }
      { expr = docker.variables; filePath = "${dirDocker}/variables.tf"; }
      { expr = docker.main; filePath = "${dirDocker}/main.tf"; }
      # { hclExpr = yc.tfvars; filePath = "${dirYC}/terraform.tfvars"; }
      # { hclExpr = yc.variables; filePath = "${dirYC}/variables.tf"; }
      # { hclExpr = yc.main; filePath = "${dirYC}/main.tf"; }
    ];
  writeWorkflows =
    let
      ciNix = import ./.github/ci.nix { inherit appPurescript appPython pkgs drv-tools system; };
      workflowsPath = ".github/workflows";
      ciJSON = "${workflowsPath}/ci-nix.json";
      ciYAML = "${workflowsPath}/ci.yaml";
      writeCIJSON = withLongDescription (writeJSON "ci-workflow" ciJSON ciNix) "write `${ciJSON}`";
    in
    mkShellApp
      {
        name = "write-yaml";
        text = ''
          ${mkBin writeCIJSON}
          cat ${ciJSON} | yq e -MP - > ${ciYAML}
          rm ${ciJSON}
        '';
        runtimeInputs = [ pkgs.yq-go ];
      }
  ;
in
{
  inherit
    writeWorkflows
    writeDocs
    writeTasks
    writeSettings
    writeMarkdownlintConfig
    writeConfigs
    writeRootPyproject
    writeTerraform
    ;
}
