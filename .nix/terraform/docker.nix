{ pkgs, system, terrafix }:
with (terrafix.hcl.${system} { inherit pkgs; });
let
  inherit (import ../data.nix) appPurescript appPython;
  apps = [ appPurescript appPython ];

  # x may have a custom __toString
  _mod = x: { _ = "${toString x}"; try = "try_${x}"; path = "path_${x}"; renamed = "renamed_${x}"; };

  # we can apply a modifier _mod to consistently use the forms of `app`
  variables = mkVariables (modifyMapMerge apps _mod (app:
    {
      "${app._}" = {
        type = object {
          DIR = optional string "/app";
          DOCKER_PORT = optional number 80;
          HOST = optional string "0.0.0.0";
          NAME = optional string "${app.renamed}";
          HOST_PORT = number;
        };
      };
    }));

  tfvars = mkVariableValues variables {
    "${appPython}" = {
      HOST_PORT = 8002;
    };
    "${appPurescript}" = {
      HOST_PORT = 8003;
    };
  };

  # should place expr A before and separately from expr B:
  # if B depends on A (uses its accessors)
  # if we want A to be rendered before B
  main = with _lib;
    mkBlocks_ tfvars.__
      {
        terraform = b {
          required_providers = b {
            docker = a {
              source = "kreuzwerker/docker";
              version = "~> 2.22.0";
            };
          };
        };
      }
      (__: with __; modifyMapMerge apps _mod (app: {
        resource.docker_image = {
          "${app.try}" = b {
            name = "dademd/${app._}:latest";
            keep_locally = false;
          };
        };
        locals = b {
          # bb means x: "${x}"
          "${app.path}" = abspath [ "${bb path.root}/../../${app._}" ];
        };
      }))
      # this __ is to pass variables created in previous expressions into this one
      # alternatively, here, we can write __.var."${app}".DIR;
      (__: with __; modifyMapMerge apps _mod (app: {
        resource.docker_container.${app.try} = b {
          image = docker_image.${app.try} "image_id";
          name = app.try;
          restart = "always";
          volumes = b {
            container_path = var.${app._}.DIR;
            host_path = local."${app.path}";
            read_only = false;
          };
          ports = b {
            internal = var.${app._}.DOCKER_PORT;
            external = var.${app._}.HOST_PORT;
          };
          env = [ "HOST=${bb var.${app._}.HOST}" "PORT=${bb var.${app._}.DOCKER_PORT}" ];
          host = b {
            host = "localhost";
            ip = var.${app._}.HOST;
          };
        };
      }));
in
{
  inherit variables tfvars main;
}
