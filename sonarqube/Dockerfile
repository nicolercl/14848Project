FROM sonarqube
COPY . /usr/src/myapp
SHELL ["/bin/bash", "-c"]

# install sonarscanner
RUN apk update && apk add npm && mkdir downloads/sonarqube -p && cd downloads/sonarqube/ && \
    wget https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-3.3.0.1492.zip && \
    unzip sonar-scanner-cli-3.3.0.1492.zip && mv sonar-scanner-3.3.0.1492/ /opt/sonar-scanner 
ENV PATH $PATH:/opt/sonar-scanner/bin

RUN apk add --update python3 py3-pip && apk add curl