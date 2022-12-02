{ settingsNix, pkgs, mkBinName }:
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
    markdown-all-in-one
    yaml
    ;
  add =
    let
      ide-purescript = settingsNix.ide-purescript //
        {
          "purescript.outputDirectory" = "./${appPurescript}/output/";
          "purescript.packagePath" = "./${appPurescript}";
          "purescript.sourcePath" = "./${appPurescript}/src";
        };
      python = settingsNix.python // {
        "python.defaultInterpreterPath" = "\${workspaceFolder}/.venv/bin/python3";
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
              "**/*.markdownlint.json"
            ];
            "url" = "https://raw.githubusercontent.com/DavidAnson/markdownlint/main/schema/markdownlint-config-schema.json";
          }
          {
            "fileMatch" = [
              "**/pyproject.toml"
            ];
            "url" = "https://json.schemastore.org/pyproject.json";
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
      terraform = {
        "terraform.languageServer.path" = mkBinName pkgs.terraform-ls "terraform-ls";
        "terraform.languageServer.terraform.path" = mkBinName pkgs.terraform "terraform";
      };
    in
    ide-purescript // python // formatters // linters // schemas // markdownlint // terraform;
}
