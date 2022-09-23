{ settingsNix
, appPurescript
}: {
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
}
