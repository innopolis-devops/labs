terraform {
   required_providers {
     github = {
       source  = "integrations/github"
       version = "~> 4.0"
     }
   }
 }

 # Configure the GitHub Provider
 provider "github" {
   token = "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"
 }