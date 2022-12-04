{ json2md
, system
, drv-tools
, pkgs
, commands
, env2json
, my-codium
, terrafix
}:
let
  inherit (drv-tools.functions.${system})
    mkShellApp writeJSON framedBrackets mkBin
    withLongDescription concatStringsNewline
    concatMapStringsNewline withMan indentStrings4
    mkBinName;
  man = drv-tools.configs.${system}.man;
  inherit (my-codium.configs.${system})
    settingsNix;
  inherit (my-codium.functions.${system})
    writeSettingsJSON writeTasksJSON;
  inherit (import ./data.nix)
    commandNames taskNames appPurescript
    appPython DOCKER_PORT HOST_PORT;
  inherit (builtins) map;

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
      name_ = "write-docs-md";
    in
    withMan
      (mkShellApp {
        name = name_;
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
          printf "${framedBrackets "%s"}" "ok ${name_}"
        '';
        description = "Write `${docsMdDir}/${docsMdFile}` that documents the available commands and tasks";
      })
      (x: ''
        ${man.DESCRIPTION}
        ${x.meta.description}.
      '');

  writeMarkdownlintConfig = writeJSON "markdownlint" ".markdownlint.jsonc" (import ./markdownlint-config.nix);
  writeSettings = writeSettingsJSON (import ./settings.nix { inherit settingsNix pkgs mkBinName; });
  writeTasks = writeTasksJSON (import ./tasks.nix { inherit commands drv-tools system; });

  writeTerraform =
    let
      inherit (terrafix.functions.${system}) writeFiles;
      docker = import ./terraform/docker.nix { inherit pkgs system terrafix; };
      yc = import ./terraform/yc.nix { inherit pkgs system terrafix; };
      github = import ./terraform/github.nix { inherit pkgs system terrafix; };
      dirDocker = "terraform/docker";
      dirYC = "terraform/yandex-cloud";
      dirGithub = "terraform/github";
    in
    writeFiles [
      { expr = docker.tfvars; filePath = "${dirDocker}/terraform.tfvars"; }
      { expr = docker.variables; filePath = "${dirDocker}/variables.tf"; }
      { expr = docker.main; filePath = "${dirDocker}/main.tf"; }
      { expr = yc.main; filePath = "${dirYC}/main.tf"; }
      { expr = yc.tfvars; filePath = "${dirYC}/terraform.tfvars"; }
      { expr = yc.variables; filePath = "${dirYC}/variables.tf"; }
      { expr = github.main; filePath = "${dirGithub}/main.tf"; }
      { expr = github.variables; filePath = "${dirGithub}/variables.tf"; }
    ];

  writeWorkflows =
    let
      ciNix = import ./github/ci.nix { inherit appPurescript appPython pkgs drv-tools system; };
      workflowsPath = ".github/workflows";
      ciJSON = "${workflowsPath}/ci-nix.json";
      ciYAML = "${workflowsPath}/ci.yaml";
      writeCIJSON = withLongDescription (writeJSON "ci-workflow" ciJSON ciNix) "write `${ciJSON}`";
    in
    withMan
      (
        mkShellApp
          {
            name = "write-workflows";
            text = ''
              ${mkBin writeCIJSON}
              cat ${ciJSON} | yq e -MP - > ${ciYAML}
              rm ${ciJSON}
            '';
            runtimeInputs = [ pkgs.yq-go ];
            description = "Write a `GitHub` workflow file";
          }
      )
      (
        x: ''
          ${man.DESCRIPTION}
          ${x.meta.description}
          ${indentStrings4 [ciYAML]}
        ''
      )
  ;
  writeConfigs =
    let writers = [
      writeSettings
      writeTasks
      writeDocs
      writeMarkdownlintConfig
      writeWorkflows
    ]; in
    withMan
      (
        mkShellApp {
          name = "write-configs";
          text = concatMapStringsNewline mkBin writers;
          description = "Write configs using the available config writers";
        }
      )
      (x: ''
        ${man.DESCRIPTION}
        ${x.meta.description}.
        These writers are:
        ${indentStrings4 (map (x: x.name) writers)}
      '');
in
{
  inherit
    writeWorkflows
    writeDocs
    writeTasks
    writeSettings
    writeMarkdownlintConfig
    writeConfigs
    ;
}
