# Use a imagem oficial do Jenkins como base
FROM jenkins/jenkins:lts

# Instale o Packer e o Ansible
USER root

RUN apt-get update && apt-get install -y ansible unzip curl && rm -rf /var/lib/apt/lists/*
RUN curl -o /tmp/packer.zip -L https://releases.hashicorp.com/packer/1.7.4/packer_1.7.4_linux_amd64.zip && \
    unzip /tmp/packer.zip -d /usr/local/bin/ && \
    chmod +x /usr/local/bin/packer

# Instale o Docker
RUN apt-get update && \
    apt-get install -y apt-transport-https ca-certificates curl software-properties-common && \
    curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add - && \
    add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable" && \
    apt-get update && \
    apt-get install -y docker-ce

# Adicione o usuário Jenkins ao grupo docker para permitir que ele use o Docker
RUN usermod -aG docker jenkins

# Altere de volta para o usuário Jenkins
USER jenkins
