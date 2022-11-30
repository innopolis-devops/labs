{ pkgs, terrafix, system }:
with (terrafix.hcl.${system} { inherit pkgs; });
let
  variables = mkVariables {
    token = b {
      type = string;
      description = "GITHUB_TOKEN";
      sensitive = true;
    };

    repo_name = b {
      description = "GitHub repo name";
      type = string;
      default = "terraform-repo";
    };

    repo_description = b {
      description = "GitHub repo description";
      type = string;
      default = "This repo was created via Terraform";
    };
  };

  tfvars = mkVariableValues variables { };

  main = mkBlocks_ tfvars.__
    {
      terraform = b {
        required_providers = b {
          github = a {
            source = "integrations/github";
            version = "5.5.0";
          };
        };
      };
    }
    (__: with __; {
      provider.github = b {
        token = var.token;
      };
    })
    (__: with __; {
      resource.github_repository.repo = b {
        name = var.repo_name;
        description = var.repo_description;
        visibility = "public";
        auto_init = true;
        license_template = "mit";
        gitignore_template = "";
        allow_rebase_merge = false;
        allow_squash_merge = false;
      };
    })
    (__: with __;{
      resource.github_branch_default.main = b {
        repository = github_repository.repo.name;
        branch = "main";
      };
    })
    (__: with __;{
      resource.github_branch_protection.default = b {
        repository_id = github_repository.repo "id";
        pattern = github_branch_default.main.branch;
        require_conversation_resolution = true;
        enforce_admins = true;
      };
    });
in
{
  inherit variables main;
  tfvars = builtins.removeAttrs tfvars ["repo_description" "repo_name" ];
}
