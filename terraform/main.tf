module "docker_app_python" {
  source = "./docker"

  image          = "chermnyx/inno-devops-python"
  container_name = "app_python-1"
}

module "docker_app_rust" {
  source = "./docker"

  image          = "chermnyx/inno-devops-rust"
  container_name = "app_rust"
  external_port  = 8081
}

module "cloud" {
  source = "./cloud"

  vm_name  = "test1"
  hostname = "test1"
}

module "github" {
  source = "./github"
}
