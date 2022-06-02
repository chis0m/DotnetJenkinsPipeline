FROM jenkins/slave:latest-jdk11

USER root

RUN apt-get update && apt-get install -y --no-install-recommends curl libunwind8 gettext apt-transport-https gpg
RUN curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
RUN mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
RUN sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/microsoft-debian-stretch-prod stretch main" > /etc/apt/sources.list.d/dotnetdev.list'
RUN apt-get update



# Install the .Net Core framework, set the path, and show the version of core installed.
RUN apt-get install -y dotnet-sdk-3.1 && \
    export PATH=$PATH:$HOME/dotnet && \
    dotnet --version

RUN usermod -a -G root jenkins

# Good idea to switch back to the jenkins user.
USER jenkins

