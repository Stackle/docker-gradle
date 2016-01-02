FROM java:8-jdk
MAINTAINER Tanapol Nearunchorn

# In case someone loses the Dockerfile
RUN rm -rf /etc/Dockerfile
ADD Dockerfile /etc/Dockerfile

# Gradle
ENV GRADLE_VERSION 2.10
WORKDIR /usr/bin
RUN wget https://downloads.gradle.org/distributions/gradle-${GRADLE_VERSION}-all.zip && \
    unzip gradle-${GRADLE_VERSION}-all.zip && \
    ln -s gradle-${GRADLE_VERSION} gradle && \
    rm gradle-${GRADLE_VERSION}-all.zip

# Set Appropriate Environmental Variables
ENV GRADLE_HOME /usr/bin/gradle
ENV PATH $PATH:$GRADLE_HOME/bin

# Cache
RUN mkdir -p /root/.gradle
ENV GRADLE_USER_HOME /root/.gradle/
VOLUME /root/.gradle/

# Default command is "/usr/bin/gradle -version" on /app dir
# (ie. Mount project at /app "docker --rm -v /path/to/app:/app gradle <command>")
RUN mkdir /app
WORKDIR /app
ENTRYPOINT ["gradle"] 
CMD ["-version"]
