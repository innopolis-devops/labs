{ json2md
, system
, drv-tools
, pkgs
, commands
, env2json
, my-codium
, refmt
, terrafix
}:
let
  inherit (drv-tools.functions.${system})
    mkShellApp writeJSON framedBrackets mkBin
    withLongDescription concatStringsNewline
    concatMapStringsNewline;
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

  # prepare directories and files
  # write ansible yaml files
  writeAnsible =
    let
      inherit (pkgs.lib.strings) escapeShellArg;
      inherit (pkgs.lib.lists) flatten unique;
      inherit (pkgs.lib.attrsets) mapAttrsToList genAttrs;
      inherit (pkgs.lib.generators) toYAML;
      inherit (pkgs.lib.trivial) id;
      inherit (builtins)
        map dirOf toJSON hasAttr isString
        isAttrs typeOf trace filter readFile;
      ansibleDir = "ansible";
      extensions = genAttrs [ "yml" "cfg" ] id;
      ansibleExpressions = import ./ansible/ansible.nix extensions;
      # String -> Set -> [...[{path, expression, extension}]...]
      getLeaves = path: attrs@{ ... }:
        assert isString path;
        if hasAttr "__extension" attrs
        then
          [
            {
              inherit path;
              expression = attrs.__expression;
              extension = attrs.__extension;
            }
          ]
        else
          map
            ({ path, attrs }: getLeaves path attrs)
            (mapAttrsToList (name: value: { path = "${path}/${name}"; attrs = value; }) attrs);
      leaves = flatten (getLeaves ansibleDir ansibleExpressions);
      dirsToCreate = unique (map ({ path, ... }: dirOf path) leaves);
      mkYaml = name: value: pkgs.runCommand name
        {
          nativeBuildInputs = [ pkgs.yq-go ];
          value = builtins.toJSON value;
          passAsFile = [ "value" ];
        } ''yq -PM "$valuePath" > "$out"'';
        
      mkFile = { extension, expression, ... }:
        escapeShellArg (
          if extension == extensions.yml
          then readFile (mkYaml "name" expression)
          else if extension == extensions.cfg
          then readFile ((pkgs.formats.toml { }).generate "name" expression)
          else "unsupported extension ${typeOf extension}"
        );
    in
    mkShellApp {
      name = "write-ansible";
      text = ''
        ${concatMapStringsNewline (x: "mkdir -p ${x}") dirsToCreate}
        ${concatMapStringsNewline (
          x@{extension, expression, path}: ''printf "%s" ${mkFile x} > ${path}.${extension}'') leaves}
      '';
      runtimeInputs = [ pkgs.yq-go ];
    };
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
  writeConfigs =
    mkShellApp {
      name = "write-configs";
      text = concatMapStringsNewline mkBin
        (builtins.attrValues {
          inherit writeSettings writeTasks writeDocs
            writeMarkdownlintConfig writeRootPyproject writeWorkflows;
        })
      ;
    };
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
    writeAnsible
    # writeTf2Nix
    ;
}
