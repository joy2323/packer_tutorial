packer {
  required_plugins {
    docker = {
      version = ">= 0.0.7"
      source = "github.com/hashicorp/docker"
    }
  }
}

source "docker" "ubuntu" {
  image  = "ubuntu:xenial"
  commit = true
}

build {
  name    = "learn-packer"
  provisioner "shell" {
  environment_vars = [
    "FOO=hello world!!!",
  ]
  inline = [
    "echo Adding file to Docker Container",
    "echo \"FOO is $FOO\" > example.txt",
  ]
  }
  sources = [
    "source.docker.ubuntu"
  ]
}
