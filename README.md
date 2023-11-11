# Trilha Cloud Native: Tema-Final-1 Jenkins Jobs

## Visão Geral

Este projeto tem como propósito a automação da execução de uma aplicação de Calculadora, baseada no Tema-4 da trilha Cloud Native, totalmente integrada em um ambiente Jenkins. Para alcançar esse objetivo, a instância da aplicação é dividida em três etapas distintas, denominadas "Jobs" na interface do Jenkins.

### Conteúdo Relevante

Na tabela abaixo, você encontrará recursos essenciais para compreender e executar este projeto:

| Conteúdo               | Link                                |
|------------------------|-------------------------------------|
| Vídeo de Demonstração  | [Assista ao vídeo de demonstração](https://youtu.be/Q4DWSBz7duA) |
| Repositório do GitHub   | [Acesse o repositório no GitHub](https://github.com/Brunna1989/tema-final-1.git)  |
| Repositório do Docker Hub | [Acesse o repositório no Docker Hub](https://hub.docker.com/repository/docker/brunnadocker/tema-final-1/tags?page=1&ordering=last_updated) |

Certifique-se de que o repositório público no GitHub contenha as implementações dos três Jobs necessários para a execução deste projeto.

## Tecnologias Utilizadas e Passos Necessários para Instalação

Este projeto faz uso de diversas tecnologias que requerem uma instalação e configuração prévia para garantir o funcionamento adequado da aplicação. A seguir, estão listados os passos necessários, com links para manuais oficiais:

| Tecnologia/Plataforma   | Manual de Instalação no Windows                                      |
|-------------------------|---------------------------------------------------------------------|
| Java 11                | [Instruções de Instalação do Java 11](https://openjdk.java.net/install/)  |
| Git                    | [Instruções de Instalação do Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)  |
| Gradle                 | [Instruções de Instalação do Gradle](https://gradle.org/install/)         |
| Docker                 | [Instruções de Instalação do Docker](https://docs.docker.com/engine/install/windows/)  |
| Jenkins                | [Instruções de Instalação do Jenkins](https://www.jenkins.io/doc/book/installing/windows/)  |
| JFrog Artifactory      | [Instruções de Instalação do JFrog Artifactory](https://www.jfrog.com/confluence/display/JFROG/Installing+Artifactory)  |
| Packer                 | [Instruções de Instalação do Packer](https://learn.hashicorp.com/tutorials/packer/get-started-install-cli)  |
| Ansible                | [Instruções de Instalação do Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html#installing-ansible-on-windows)  |

Observação: Para este projeto, utilizei um arquivo "docker-compose.yml" e um "Dockerfile" para criar e configurar contêineres Docker que hospedam o Jenkins e o JFrog. No contêiner Jenkins, o Packer, o Ansible e o Docker estão devidamente instalados, proporcionando um ambiente integrado para a execução do mesmo, através do comando "docker-compose up".

Certifique-se de que as configurações do Docker e dos contêineres estejam alinhadas com as suas necessidades.

# Instruções de Configuração do Jenkins

Para iniciar a utilização do Jenkins neste projeto, siga os passos descritos abaixo:

## Acesso ao Jenkins

1. Acesse o Jenkins por meio do seguinte link: [https://localhost:8080](https://localhost:8080).

## Desbloqueio de Uso e Instalação de Plugins

2. Siga cuidadosamente as instruções fornecidas para desbloquear o uso do Jenkins e instalar os plugins recomendados, conforme orientado no tutorial de instalação.

## Autenticação e Criação de Credenciais

3. Utilize a senha temporária fornecida via terminal para acessar a sua conta no Jenkins. É altamente recomendável alterar a senha temporária a fim de reforçar a segurança da sua conta. Adicionalmente, crie credenciais personalizadas para uso futuro.

## Confirmação das Configurações

4. Verifique se todas as etapas anteriores foram concluídas com êxito. Após a conclusão, salve as configurações por meio da opção "Save and Finish".

## Instalação do Plugin Artifactory

5. Acesse a seção "Manage Jenkins" no menu e selecione a opção "Manage Plugins". Certifique-se de que o plugin Artifactory esteja instalado, a menos que já o tenha feito.

Agora, o Jenkins está pronto para ser utilizado neste projeto.

Lembre-se de manter as suas credenciais e senhas de forma segura.

# Configuração do JFrog Artifactory

A configuração do JFrog Artifactory é um passo crucial no gerenciamento dos artefatos do seu projeto. Siga rigorosamente as etapas a seguir para configurar o JFrog Artifactory corretamente:

## Download e Instalação

1. Comece por fazer o download da versão Open Source (OSS) do JFrog Artifactory a partir do link fornecido acima.

2. Em seguida, siga as instruções detalhadas fornecidas no manual de instalação para garantir uma instalação bem-sucedida.

## Acesso ao JFrog Artifactory

3. Acesse o JFrog Artifactory através do endereço [https://localhost:8082](https://localhost:8082).

4. Ao acessar, uma página de boas-vindas será exibida, solicitando um nome de usuário e senha. O sistema fornece uma credencial pré-configurada com um usuário "admin" e uma senha "password".

5. Utilize essas credenciais, pelo menos para o primeiro acesso, porém é imperativo alterar a senha imediatamente por razões de segurança.

## Configuração de Repositórios

6. No JFrog Artifactory, selecione a opção "Add Repositories". Crie um repositório como "Local Repository" e selecione o tipo de pacote como "Gradle". O nome escolhido para este projeto foi "tema-final-01-job-1". Caso prefira outro nome, assegure-se de ajustar as referências no código de acordo com a sua escolha.

| Configuração         | Nome                      |
| -------------------- | -------------------------  |
| JFrog Repository Key |       tema-final-01-job-1                    |


# Configuração do Projeto

Este guia descreve os passos necessários para configurar e executar o projeto de forma adequada. Certifique-se de seguir cada etapa atentamente.

## Configuração do JFrog Artifactory

1. Acesse o Jenkins e vá para a seção "Manage Jenkins". Procure as configurações e credenciais do JFrog Artifactory.

2. Escolha a opção "Add JFrog Platform" e preencha os campos vazios. O "Instance ID" será o nome que você usará para se referir ao seu Artifactory posteriormente. A "URL" geralmente é mantida em 8082, especialmente se a configuração estiver local. As credenciais são aquelas criadas previamente para acesso à plataforma.

   | Configuração                | Nome                                                         |
       | --------------------------- |--------------------------------------------------------------|
   | Instance ID                 | tema-final-1-job-1                                           |
   | JFrog Platform URL          | http://artifactory:8082                                      |
   | Default Deployer Credentials | Usuário e Senha do JFrog Artifactory configurados no Jenkins |

3. Você pode alterar os nomes conforme necessário, mas lembre-se de atualizar os trechos que se referem a eles posteriormente.

Agora, o JFrog Artifactory está pronto para uso.

## Docker Hub

O Docker Hub é necessário para os Jobs 02 e 03. Esses Jobs requerem o envio e o download de uma imagem Docker de um repositório no Docker Hub. Siga as etapas abaixo para configurá-lo.

1. Acesse [Docker Hub](https://hub.docker.com/signup) e siga o processo de registro.

2. Selecione a opção "Create Repository". Defina o nome e marque a opção "Public". Preste atenção ao nome escolhido, pois ele será usado mais tarde.

   | Configuração           | Nome                      |
       | ---------------------- |---------------------------|
   | Docker Hub Repository  | brunnadocker/tema-final-1 |

3. Vá para "Account Settings" -> "Security" e gere um novo token com permissões de leitura, escrita e exclusão. Salve este token em um local seguro, pois você não poderá vê-lo novamente.

4. Retorne ao Jenkins e vá para "Manage Jenkins" -> "Manage Credentials" -> "Domain (global)" -> "Add Credentials". Preencha os campos de usuário e senha (token) com as informações que acabou de criar. Escolha a opção "Username with Password" e salve a configuração.

   | Configuração          | Nome                          |
       | --------------------- |-------------------------------|
   | Kind                  | Username with Password        |
   | ID                    | dockerhub_token               |
   | Username, Password    | Usuário e Token do Docker Hub |

Agora, o Docker Hub está pronto para uso.

## Execução dos Jobs

### job-1 - Build

O objetivo do job-1 é recuperar a aplicação Calculadora de um repositório GitHub, testá-la e criar um arquivo jar. Este arquivo jar deve ser publicado no repositório do JFrog Artifactory.

Siga estas instruções para executar o job-1:

1. No painel de controle do Jenkins, selecione "New Item". Escolha um nome adequado e selecione "Pipeline".

2. No campo "Definition", escolha "Pipeline script from SCM". Selecione "Git" como a opção de SCM.

3. Preencha o campo "Repository URL" com o repositório público criado especificamente para este projeto: https://github.com/Brunna1989/tema-final-1.git.

4. Certifique-se de que a opção "*/master" está preenchida em "Branch Specifier".

5. No campo "Script Path", preencha o caminho para o Jenkinsfile apropriado: job-1/Jenkinsfile.

6. Salve as configurações.

7. Agora o job-1 está configurado. Volte para o painel e clique no Job recém-criado. Escolha "Build Now" e aguarde a execução do Pipeline.

A indicação de sucesso é a presença de um arquivo "Tema-final-1-0.0.1-SNAPSHOT.jar" no repositório do JFrog Artifactory.

### job-2 - Infraestrutura (Provisionamento)

O objetivo do job-2 é criar uma imagem Docker a partir do arquivo jar gerado no Job anterior. Isso envolve o download do arquivo jar do JFrog Artifactory e a construção de uma imagem Docker usando Packer e Ansible.

A aplicação é implantada em um servidor Apache Tomcat 10 e a imagem Docker resultante é enviada para um repositório apropriado no Docker Hub.

Siga estas instruções para executar o job-2:

1. Repita os passos iniciais do job-1 até o momento de preencher o "Script Path". Nesse caso, o caminho é "job-2/Jenkinsfile" e o nome será diferente.

2. Execute o job-2 da mesma maneira. Este Job tem uma duração de execução mais longa do que os outros, portanto, seja paciente.

A indicação de sucesso é a presença de uma imagem Docker com a tag "0.1" no repositório do Docker Hub.

### job-3 - Execução

O objetivo do job-3 é recuperar a imagem Docker gerada no Job anterior do Docker Hub e executá-la em um container Docker na máquina.

Siga estas instruções para executar o job-3:

1. Repita os passos anteriores para configurar o job-3, mas lembre-se de alterar apenas o campo "Script Path", que agora deve ser "job-3/Jenkinsfile".

2. Execute o job-3 da mesma maneira. A indicação de sucesso é a verificação de um container Docker em execução na máquina.

Para verificar a execução da aplicação Calculadora, digite o seguinte comando no terminal:

docker container ls -a

# Uso da Aplicação Calculadora

Neste guia, explicaremos como utilizar a aplicação Calculadora e suas funcionalidades.

## Visão Geral

Após a configuração bem-sucedida, a interface apresentará um novo contêiner com status "Up" e em execução na porta 8085, mapeada para a porta 8085 TCP.

Isso significa que a aplicação Calculadora está funcionando corretamente no endereço [https://localhost:8085](https://localhost:8085).

Você pode interromper a aplicação a qualquer momento com o seguinte comando:

docker stop + id do contêiner

## Acessando as Plataformas Necessárias

- **Jenkins:** [http://localhost:8080](http://localhost:8080)
- **JFrog Artifactory:** [http://localhost:8082](http://localhost:8082)
- **Aplicação Calculadora via contêiner:** [http://localhost:8085/calculator/operação/number1/number2
- **Aplicação Calculadora via App:** [http://localhost:8083/calculator/operação/number1/number2

## Utilizando a Calculadora

A aplicação oferece as seguintes operações:

- **Adição (sum)**
- **Subtração (subtraction)**
- **Multiplicação (multiplication)**
- **Divisão (division)**
- **Exponenciação (exponentiation)**

Para executar uma operação, forneça aperação desejada, como acima descrito e os dois números como parâmetros para os campos "number1" e "number2" para a função. 

O histórico de operações é apresentado na página, junto ao resultado da operação atual. Divirta-se e bons cálculos!
