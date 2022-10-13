{ pkgs }:
let
  qq = arg: ''"${arg}"'';
  inherit (pkgs.lib.strings) concatMapStringsSep concatStringsSep;
  inherit (pkgs.lib.attrsets) genAttrs filterAttrs;

  inherit (genAttrs [ "string" "bool" "number" "any" ] (
    name: { __type = name; __toString = self: "${self.__type}"; }
  )) string bool number any;

  toStringPrimitive = arg:
    with builtins;
    if isBool arg then (if arg then "true" else "false")
    else if isString arg then (qq arg)
    else if isList arg then { __toString = self: ''[${concatStringsSep ", " arg}]''; }
    else if elem (typeOf arg) [ "int" "float" "set" ] then "${toString arg}"
    # "path", "lambda", "null"
    else "";

  toStringBody_ = nl: args@{ ... }: with builtins; ''{
    ${
        concatMapStringsSep nl (x: "${x}") (attrValues (
          mapAttrs (name: val: "${name} = ${toString val}") (
            filterAttrs (name: val: !(elem (typeOf val) ["lambda" "null"])) args
          )
        ))
      }
    }'';
  toStringBody = toStringBody_ "\n";

  optional_ = type: optional type null;
  optional = type: default: {
    __type = "optional";
    __args = {
      inherit type;
      default = mkBody_ default;
      __toString = self:
        let default_ = toStringPrimitive self.default; in
        ''${type}${
          if default_ == ""
          then "" else ", ${default_}"
        }'';
    };
    __toString = self: ''${self.__type}(${self.__args})'';
  };

  object = args@{ ... }: {
    __type = "object";
    __attrs = (mkBody_ args) // {
      __toString = self: toStringBody args;
    };
    __toString = self: ''${self.__type}(${self.__attrs})'';
  };

  list = type: {
    __type = "list";
    __toString = self: ''${self.__type}(${type})'';
  };


  mkBody_ = arg: if builtins.isAttrs arg then mkBody arg else arg;
  # we want to be able to print nested objects
  # that's why, we supplement nested objects with __toString
  mkBody = attrs@{ ... }: with builtins;
    (mapAttrs
      (_: value:
        if isAttrs value
        then
          let body_ = mkBody value; in
          body_ // { __toString = self: toStringBody body_; }
        else value
      )
      attrs) // {
      __toString = toStringBody;
    };

  mkVar = attrs@{ ... }: (builtins.mapAttrs (_: x: mkBody_ x) attrs) // {
    __toString = self:
      let inherit (pkgs.lib.strings) removePrefix removeSuffix; in
      removePrefix "{" (removeSuffix "}" (toStringBody_ "\n\n" self));
  };

  t = list (object {
    name = string;
    enabled = optional bool true;
    website = optional_
      (object {
        index_document = optional string "index.html";
        error_document = optional string "error.html";
        routing_rules = optional_ string;
      });
  });

  appPurescript = "app_purescript";
  appPython = "app_python";
  apps = [ appPurescript appPython ];

  variable = genAttrs apps (app: {
    "${app}" = {
      type = object {
        DIR = string;
        DOCKER_PORT = number;
        HOST = string;
        HOST_PORT = number;
        NAME = optional string "renamed_${app}";
      };
    };
  });

  var = mkVar {
    "${appPython}" = {
      DIR = qq "/app";
      DOCKER_PORT = 80;
      HOST = qq "0.0.0.0";
      HOST_PORT = 8002;
    };
    "${appPurescript}" = {
      DIR = qq "/app";
      DOCKER_PORT = 80;
      HOST = qq "0.0.0.0";
      HOST_PORT = 8003;
    };
  };

in
{
  inherit t var variable;
}
