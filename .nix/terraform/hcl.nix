{ pkgs }:
let
  inherit (pkgs.lib.strings) concatMapStringsSep concatStringsSep;
  inherit (pkgs.lib.attrsets) genAttrs filterAttrs recursiveUpdate;
  inherit (builtins) mapAttrs elem isAttrs isList isString isBool hasAttr head map typeOf;
  inherit (pkgs.lib.asserts) assertMsg;

  qq = arg: ''"${arg}"'';
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
          mapAttrs (name: val: "${name} = ${toStringPrimitive val}") (
            filterOutNonTypes args
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
    __arg = type;
  };


  mkBody_ = arg: if isAttrs arg then mkBody arg else arg;
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

  # these aren't types that belong to HCL's typesystem
  filterOutNonTypes = args@{ ... }: with builtins;
    filterAttrs (name: val: !(elem (typeOf val) [ "lambda" "null" ])) args;

  mkVariables = attrs@{ ... }:
    (mapAttrs (name: value: value // { __toString = toStringBody; }) attrs
    ) // {
      __toString = self: concatStringsSep "\n\n" (
        with builtins; attrValues (
          mapAttrs (name: value: ''variable ${qq name} ${value}'') (filterOutNonTypes self)
        )
      );
    };

  L = genAttrs [ "optional" "list" "tuple" "set" "string" "number" "bool" "object"] (x: x);

  isOptionalSet = set@{ ... }: set.__type == L.optional;
  isPrimitive = arg@{ ... }: elem arg.__type [ L.string L.number L.bool ];

  mapToValue_ = attrs@{ ... }:
    let
      # let only elements with potential default values remain
      # TODO check if other types contain any default values
      # attrs_ = 

      type_ = attrs.__type;
    in
    if type_ == L.object then
      let
        possiblyWithDefaultValues = filterAttrs
          (name: val:
            (val.__type == L.optional && val.__args.default != null) ||
            (elem val.__type [ L.object L.list L.set L.tuple ])
          )
          (filterOutNonTypes attrs.__attrs);
        actualValues = mapAttrs (name: val: mapToValue_ val) possiblyWithDefaultValues;
        nonEmptyValues = filterAttrs (_: val_: !(isNull val_)) actualValues;
      in
      # in case this object didn't have any optional values
      if nonEmptyValues == { } then null else nonEmptyValues
    # TODO keep both values to use the values from the type if default is overwritten

    else if type_ == L.optional then {
      __type = L.optional;
      __args = {
        type = let type = attrs.__args.type; in
          if isPrimitive type then null else mapToValue_ type;
        default = attrs.__args.default;
      };
    }
    else if type_ == L.list then
      let actualValue = mapToValue_ attrs.__arg; in
      # no need in an empty list
      if actualValue == null then null else [ actualValue ]
    else builtins.throw "${type_} not yet implemented";

  # TODO how to represent a list of objects with optional values?
  # TODO how to update lists with such values

  # TODO can there be no type?
  # this is a top set of variables, so, we should to filter out the __toString
  mapToValue = attrs@{ ... }: mapAttrs (name: val: mapToValue_ val.type) (filterOutNonTypes attrs);

  noBraces = arg: assert isString arg;
    let inherit (pkgs.lib.strings) removePrefix removeSuffix; in
    removePrefix "{" (removeSuffix "}" arg);

  ofEqualTypes = x: y: assertMsg (typeOf x == typeOf y) "type mismatch: x of ${typeOf x}, y of ${typeOf y}";

  # x - data from a variable
  # y - a given value
  # we overwrite the default values (data)
  updateSet = x@{ ... }: y@{ ... }: x // (
    mapAttrs
      (yName: yVal:
        if hasAttr yName x then updateValue x."${yName}" yVal
        else yVal
      )
      y
  );

  # TODO list(list(object))
  # object without default values?
  updateList = x: y:
    assert (isList x && isList y);
    # we expect that a list is nonempty
    # because it was set to null when mapping the variable to a value
    assert assertMsg (x != [ ]) "x should be a nonempty list!";
    let xVal = head x; in map (yVal: updateValue xVal yVal) y;

  updateValue = x: y: assert (ofEqualTypes x y);
    if isAttrs y then updateSet x y
    else if isList y then updateList x y else
    throw "update not yet implemented for ${typeOf y}"
  ;

  # TODO use default values of variables supplied via default

  mkVars = attrs@{ ... }: (mapAttrs
    (name: val: mkBody_ (
      let variableValue = mapToValue variable."${name}"; in updateValue variableValue val
    ))
    attrs) // {
    __toString = self: noBraces (toStringBody_ "\n\n" self);
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


  variable = mkVariables (genAttrs apps (app: {
    type = object {
      DIR = optional string "/app";
      DOCKER_PORT = optional number 80;
      HOST = optional string "0.0.0.0";
      NAME = optional string "renamed_${app}";
      HOST_PORT = number;
    };
  }));


  appPurescript = "app_purescript";
  appPython = "app_python";
  apps = [ appPurescript appPython ];


  var = mkVars {
    "${appPython}" = {
      HOST_PORT = 8002;
    };
    "${appPurescript}" = {
      HOST_PORT = 8003;
    };
  };

  tvar = mkVariables {
    t = {
      type = t;
    };
  };
in
{
  inherit t var variable mapToValue tvar;
}
