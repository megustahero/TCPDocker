FROM centos:latest

MAINTAINER João Ferreira <jmdf@protonmail.com>

RUN yum -y update
RUN yum -y install java-1.8.0-openjdk-headless wget unzip

RUN useradd -r -m -U -d /opt/minecraft -s /bin/bash -u 10001 minecraft

RUN wget http://files.theclassicpack.com/SERVER/TCP-v3.3.3c-hotfix_SERVER.zip
RUN unzip -d /opt/minecraft TCP-v3.3.3c-hotfix_SERVER.zip

COPY eula.txt /opt/minecraft/
RUN chown -R minecraft:minecraft /opt/minecraft/

USER minecraft

WORKDIR /opt/minecraft

EXPOSE 25565

CMD ["java", "-Xms3024M", "-Xmx12288M", "-jar", "Forge.jar", "nogui"]
