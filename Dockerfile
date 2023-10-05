FROM jenkins/jenkins:lts

# Instale o Packer e o Ansible
USER root
RUN apt-get update && apt-get install -y ansible unzip curl && rm -rf /var/lib/apt/lists/*
RUN curl -o /tmp/packer.zip -L https://releases.hashicorp.com/packer/1.7.4/packer_1.7.4_linux_amd64.zip && \
    unzip /tmp/packer.zip -d /usr/local/bin/ && \
    chmod +x /usr/local/bin/packer

USER jenkins
