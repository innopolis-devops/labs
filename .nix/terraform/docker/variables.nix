{ pkgs }:
let
  inherit (import ../../data.nix) appPython appPurescript;

  # Language constructs
  # block = type: args: ''${type} ${mkArgs args}'';
  eq = a: b: ''${a} = ${builtins.toString b}'';
  tf = definitions: concatStringsSep "\n\n" (pkgs.lib.lists.flatten definitions);


  # types
  objectT = args: ''object(${mkArgs args})'';
  optionalT = type: defaultValue: ''optional(${type}, ${defaultValue})'';
  qq = str: ''"${str}"'';

  # blocks
  mkBlock = name: len: labels: args:
    assert builtins.length labels == len;
    ''${name} ${concatMapStringsSep " " qq labels} ${mkArgs args}'';

  resourceB = mkBlock "resource" 2;
  variableB = mkBlock "variable" 1;
  terraformB = mkBlock "terraform" 0;

  comment = comment_: "# " + (
    lib.strings.stringAsChars (x: if x == "\n" then "\n# " else x) (
      lib.strings.removeSuffix "\n" comment_
    )
  );

  inherit (pkgs) lib;
  inherit (lib.strings) concatMapStringsSep concatStringsSep;
  inherit (lib.attrsets) genAttrs mapAttrs';

  # Helpers
  mkNamedSet = attrs: genAttrs attrs (name: name);

  # mkNamedSets = attrs@{ ... }: builtins.mapAttrs mkNamedSet attrs;
  # map = args: ''map({${concatStringsSep "\n" args}})'';

  # Literals
  keywordsL = mkNamedSet [ "number" "string" "type" ];
  varsL = mkNamedSet [ "HOST" "HOST_PORT" "DOCKER_PORT" "DIR" "NAME" ];

  mkArgs = args: ''{
    ${concatStringsSep "\n" (
    builtins.attrValues (builtins.mapAttrs (name: val: eq name val) args)
    )}
  }'';

  # stripTabs
  variablesTF = with (varsL // keywordsL); tf [
    (
      builtins.map
        (app:
          [
            (variableB [ "${app}" ]
              {
                type = (
                  objectT {
                    HOST = string;
                    HOST_PORT = number;
                    DOCKER_PORT = number;
                    DIR = string;
                    NAME = (optionalT string (qq "renamed_${app}"));
                  }
                );
              })
          ]
        )
        [ appPurescript appPython ]
    )
  ];

  tfvars =
    let
      mkApp = app: args: eq app (mkArgs args);
      mkApps = apps@{ ... }: builtins.attrValues (builtins.mapAttrs (name: val: mkApp name val) apps);
    in
    tf (
      mkApps {
        "${appPython}" = {
          HOST = qq "0.0.0.0";
          HOST_PORT = 8002;
          DOCKER_PORT = 80;
          DIR = qq "/app";
        };
        "${appPurescript}" = {
          HOST = qq "0.0.0.0";
          HOST_PORT = 8003;
          DOCKER_PORT = 80;
          DIR = qq "/app";
        };
      }
    );

  localsB = mkBlock "locals" 0;
  terraformL = mkNamedSet [ "terraform" "required_providers" "docker" "source" "version" ];
  abspath = arg: "abspath(${arg})";
  bb = arg: "$" + "{${arg}}";
  try_ = arg: "try_${arg}";
  mainTF =
    with terraformL;
    tf ([
      (terraformB [ ] {
        required_providers = mkArgs {
          docker = mkArgs {
            source = qq "kreuzwerker/docker";
            version = qq "~> 2.22.0";
          };
        };
      })
      (resourceB [ "docker_image" "try_app_python" ] {
        name = qq "dademd/app_python:latest";
        keep_locally = qq "false";
      })
      (localsB [ ] (mapAttrs'
        (name: val: {
          name = "path_${name}";
          value = abspath (qq "${bb "path.root"}/../../${name}");
        })
        (mkNamedSet [ appPurescript appPython ])
      ))
      (
        comment ''
          reference vars via var
          https://www.terraform.io/language/values/variables#using-input-variable-values
        ''
      )
      (resourceB [ "docker_container" "${try_ app}" ] {
        image = "docker_image.try_app_python.image_id";
        name = qq (try_ app);
        restart = qq "always";
        volumes = mkArgs {
          container_path = var.app_python_env.DIR;
          host_path = local.path_app_python;
          read_only = false;
        };
      })
    ]);


in
{
  inherit variablesTF tfvars mainTF;
}
