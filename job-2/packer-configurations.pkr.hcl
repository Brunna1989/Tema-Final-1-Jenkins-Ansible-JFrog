packer {
  required_plugins {
    docker = {
      version = ">= 1.0.1"
      source = "github.com/hashicorp/docker"
    }
  }
}

source "docker" "ubuntu" {
  image  = "ubuntu:20.04"
  commit = true
  changes = [
    "EXPOSE 8085",
    "ENTRYPOINT [\"java\", \"-jar\", \"/calculator-0.0.1-SNAPSHOT.ja\"]"
  ]
}

variable "username" {
  type = string
  default = ""
}

variable "password" {
  type = string
  default = ""
}

build {
  name = "Job2"
  sources = [
    "source.docker.ubuntu"
  ]

  provisioner "shell" {
    inline = [
      "apt-get update",
      "apt-get install ansible -y"
    ]
  }

  provisioner "file" {
    source = "./calculator-0.0.1-SNAPSHOT.ja"
    destination = "/calculator-0.0.1-SNAPSHOT.ja"
  }

  provisioner "ansible-local" {
    playbook_file = "./playbook.yml"
  }

  post-processors {
    post-processor "docker-tag" {
      repository =  "brunnadocker/brunna-dornelles-tema-final-1"
      tags = ["0.1"]
    }
    post-processor "docker-push" {
      login = true
      login_username = var.username
      login_password = var.password
    }
  }
}