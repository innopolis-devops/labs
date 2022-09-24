{ settingsNix
}:
let
  inherit (import ./data.nix) appPurescript;
in
{
  inherit (settingsNix)
    todo-tree
    files
    editor
    gitlens
    git
    nix-ide
    workbench
    ;
  ide-purescript =
    (settingsNix.ide-purescript or { }) // {
      "purescript.outputDirectory" = "./${appPurescript}/output/";
      "purescript.packagePath" = "./${appPurescript}";
      "purescript.sourcePath" = "./${appPurescript}/src";
    };

  python = settingsNix.python // {
    "python.defaultInterpreterPath" = "\${workspaceFolder}/app_python/.venv/bin/python3";
  };
  formatters = {
    "[html]" = {
      "editor.defaultFormatter" = "monosans.djlint";
    };
    "[markdown]" = {
      "editor.defaultFormatter" = "DavidAnson.vscode-markdownlint";
    };
  };
  linters = {
    "python.linting.pylintEnabled" = true;
  };
  schemas = {
    "json.schemas" = [
      {
        "fileMatch" = [
          "/*.markdownlint.json"
        ];
        "url" = "https://raw.githubusercontent.com/DavidAnson/markdownlint/main/schema/markdownlint-config-schema.json";
      }
    ];
  };
  markdownlint = {
    "markdownlint.lintWorkspaceGlobs" = [
      "**/*.{md,mkd,mdwn,mdown,markdown,markdn,mdtxt,mdtext,workbook}"
      "!**/bower_components"
      "!**/node_modules"
      "!**/vendor"
      "!**/.*"
    ];
    "markdownlint.config" = import ./markdownlint-config.nix;
  };
}
