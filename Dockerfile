FROM jenkins/jenkins:lts

USER root

# Instalação do Packer
RUN apt-get update && \
    apt-get install -y unzip && \
    curl -O https://releases.hashicorp.com/packer/1.7.0/packer_1.7.0_linux_amd64.zip && \
    unzip packer_1.7.0_linux_amd64.zip && \
    mv packer /usr/local/bin/

# Instalação do Ansible
RUN apt-get update && \
    apt-get install -y software-properties-common && \
    apt-add-repository --yes --update ppa:ansible/ansible && \
    apt-get install -y ansible

USER jenkins
