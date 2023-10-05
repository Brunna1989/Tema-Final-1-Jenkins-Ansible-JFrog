FROM jenkins/jenkins:lts

# Instale o Packer e o Ansible
USER root
RUN apt-get update && apt-get install -y ansible unzip && rm -rf /var/lib/apt/lists/*
RUN curl -o /usr/local/bin/packer -L https://releases.hashicorp.com/packer/1.7.4/packer_1.7.4_linux_amd64 && chmod +x /usr/local/bin/packer

# Continue com a configuração do Jenkins, se necessário

USER jenkins
