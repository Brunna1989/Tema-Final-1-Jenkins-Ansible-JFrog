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

variable "username" {
  type    = string
  default = ""
}

variable "password" {
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
      "apt-get install ansible -y",
      "ls ./Tema-final-1/.gradle/build/libs"  # Comando ls para listar o conteúdo do diretório
    ]
  }
  
  provisioner "file" {
    source      = "./Tema-final-1/.gradle/build/libs/Tema-final-1-0.0.1-SNAPSHOT.jar"  # Caminho relativo para o arquivo JAR
    destination = "/Tema-final-1-0.0.1-SNAPSHOT.jar"
  }
  
  provisioner "ansible-local" {
     playbook_file = "./job-2/playbook.yml"
  }
  
  post-processors {
    post-processor "docker-tag" {
        repository =  "brunnadocker/brunna-dornelles-tema-final-1"
        tags       = ["0.1"]
    }
    post-processor "docker-push" {
        login          = true
        login_username = var.username
        login_password = var.password
    }
  }
}

