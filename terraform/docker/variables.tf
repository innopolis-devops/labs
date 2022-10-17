variable "app_purescript" {
  type = object({
    DIR         = optional(string, "/app")
    DOCKER_PORT = optional(number, 80)
    HOST        = optional(string, "0.0.0.0")
    HOST_PORT   = number
    NAME        = optional(string, "renamed_app_purescript")
  })
}

variable "app_python" {
  type = object({
    DIR         = optional(string, "/app")
    DOCKER_PORT = optional(number, 80)
    HOST        = optional(string, "0.0.0.0")
    HOST_PORT   = number
    NAME        = optional(string, "renamed_app_python")
  })
}