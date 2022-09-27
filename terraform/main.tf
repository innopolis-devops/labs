module "py_app" {
  source = "./docker"

  image          = "wat4er/inno_devops:python"
  container_name = "web_py"
  external_port  = 5000
  internal_port  = 5000
}

module "dart_app" {
  source = "./docker"

  image          = "wat4er/inno_devops:dart"
  container_name = "best_app_ever"
  external_port  = 5050
  internal_port  = 5000
}

module "cloud" {
  source = "./cloud"

  vm_name  = "asdfffff"
  hostname = "asdfffff"
}

module "github" {
  source = "./git"

  test_repo_name = "this_should_not_exist"
}