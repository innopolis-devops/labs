{ pkgs }:
let
  inherit (import ../../data.nix) appPython appPurescript;

  # Language constructs
  # block = type: args: ''${type} ${mkArgs args}'';
  eq = a: b: ''${a} = ${builtins.toString b}'';
  tf = definitions: concatStringsSep "\n\n" (pkgs.lib.lists.flatten definitions);

  apps = [ appPurescript appPython ];

  # types
  objectT = args: ''object(${mkArgs args})'';
  optionalT = type: defaultValue: ''optional(${type}, ${defaultValue})'';
  qq = str: ''"${str}"'';

  # blocks
  mkBlock = name: len: labels: args:
    assert builtins.length labels == len;
    ''${name} ${concatMapStringsSep " " qq labels} ${mkArgs args}'';

  # resourceB = mkBlock "resource" 2;
  # variableB = mkBlock "variable" 1;
  # terraformB = mkBlock "terraform" 0;
  _b = {
    resource = mkBlock "resource" 2;
    variable = mkBlock "variable" 1;
    terraform = mkBlock "terraform" 0;
    locals = mkBlock "locals" 0;
  };

  comment = comment_: "# " + (
    lib.strings.stringAsChars (x: if x == "\n" then "\n# " else x) (
      lib.strings.removeSuffix "\n" comment_
    )
  );

  inherit (pkgs) lib;
  inherit (lib.strings) concatMapStringsSep concatStringsSep;
  inherit (lib.attrsets) genAttrs mapAttrs';

  # Helpers
  mkIdentity = attrs: genAttrs attrs (name: name);

  # mkNamedSets = attrs@{ ... }: builtins.mapAttrs mkNamedSet attrs;
  # map = args: ''map({${concatStringsSep "\n" args}})'';

  mkNamedSets = attrs@{ ... }: mkNamedSets_ "" attrs;
  mkNamedSets_ = path: attrs@{ ... }:
    (builtins.mapAttrs
      (name: val:
        mkNamedSets_ "${path}${if path == "" then "" else "."}${name}" val)
      attrs) // {
      _ = path;
    };

  # namespace
  __ = mkNamedSets {
    path.root = { };
    var = builtins.foldl' { }
      (m: app:
        let app_ = arg__ app;
        in { "${app_.env}".DIR = { }; }
      );
  };

  # Literals
  # _l.keywords = mkIdentity [ "number" "string" "type" ];
  # _l.vars = mkIdentity [ "HOST" "HOST_PORT" "DOCKER_PORT" "DIR" "NAME" ];
  # _l.terraform = mkIdentity [ "terraform" "required_providers" "docker" "source" "version" ];
  _l = {
    keywords = mkIdentity [ "number" "string" "type" ];
    vars = mkIdentity [ "HOST" "HOST_PORT" "DOCKER_PORT" "DIR" "NAME" ];
    terraform = mkIdentity [ "terraform" "required_providers" "docker" "source" "version" ];
  };
  mkArgs = args: ''{
    ${concatStringsSep "\n" (
    builtins.attrValues (builtins.mapAttrs (name: val: eq name val) args)
    )}
  }'';

  # stripTabs
  variablesTF = with (_l.vars // _l.keywords); tf [
    (
      builtins.map
        (app:
          [
            (_b.variable [ "${app}" ]
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
        apps
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

  abspath = arg: "abspath(${arg})";
  bb = arg: "$" + "{${arg}}";

  # prefix an argument
  __arg = arg: {
    try = "try_${arg}";
    path = "path_${arg}";
  };
  # suffix an argument
  arg__ = arg: {
    env = "${arg}_env";
  };

  mainTF =
    with _l.terraform;
    tf ([
      (_b.terraform [ ] {
        required_providers = mkArgs {
          docker = mkArgs {
            source = qq "kreuzwerker/docker";
            version = qq "~> 2.22.0";
          };
        };
      })
      (_b.resource [ "docker_image" "try_app_python" ] {
        name = qq "dademd/app_python:latest";
        keep_locally = qq "false";
      })
      (_b.locals [ ] (mapAttrs'
        (app: _:
          let app_ = arg__ app; in
          {
            name = app_.path name;
            value = abspath (qq "${bb __.path.root._}/../../${name}");
          })
        (mkIdentity [ appPurescript appPython ])
      ))
      (
        comment ''
          reference vars via var
          https://www.terraform.io/language/values/variables#using-input-variable-values
        ''
      )
      (builtins.map
        (app:
          let
            _app = __arg app;
            app_ = arg__ app;
          in
          (_b.resource [ "docker_container" "${_app.try}" ] {
            image = "docker_image.try_app_python.image_id";
            name = qq (try_ app);
            restart = qq "always";
            volumes = mkArgs {
              container_path = var."${app_.env}".DIR;
              host_path = local.${_app.path};
              read_only = false;
            };
            ports = mkArgs {
              internal = var.app_python_env.DOCKER_PORT;
              external = var.app_python_env.HOST_PORT;
            };
            env = [
              (qq "HOST=${var.app_python_env.HOST}")
              (qq "PORT=${var.app_python_env.DOCKER_PORT}")
            ];
            host = mkArgs {
              host = "localhost";
              ip = var.${app_.env}.HOST;
            };
          })
        )
      )
    ]);
in
{
  inherit variablesTF tfvars mainTF;
}
