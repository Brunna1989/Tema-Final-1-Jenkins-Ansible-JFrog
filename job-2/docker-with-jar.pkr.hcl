packer {
  required_plugins {
    docker = {
      version = ">= 1.0.1"
      source  = "github.com/hashicorp/docker"
    }
  }
}

source "docker" "ubuntu" {
  image  = "ubuntu:20.04"
  commit = true
  changes = [
    "EXPOSE 8085",
    "ENTRYPOINT [\"java\", \"-jar\", \"/Tema-final-1-0.0.1-SNAPSHOT.jar\"]"
  ]
}

variable "token" {
  type    = string
  default = ""
}

build {
  name = "job-2"
  sources = [
    "source.docker.ubuntu"
  ]

  provisioner "shell" {
    inline = [
      "apt-get update",
      "apt-get install -y ansible"
    ]
  }

  provisioner "file" {
    source      = "Tema-final-1-0.0.1-SNAPSHOT.jar"
    destination = "/Tema-final-1-0.0.1-SNAPSHOT.jar"
  }

  provisioner "ansible-local" {
    playbook_file = "./job-2/playbook.yml"
  }

  post-processors {
    post-processor "docker-tag" {
      repository = "brunnadocker/tema-final-1"
      tags       = ["0.1"]
    }

    post-processor "docker-push" {
      login = true
      token = var.token
    }
  }
}
