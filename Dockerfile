FROM ubuntu

# Expecting bind mount at
ENV PROJECT_DIR=/project/
# Expect volume mount at
ENV GATORGRADER_DIR=/root/.local/share/

WORKDIR ${PROJECT_DIR}

VOLUME ${PROJECT_DIR} ${GATORGRADER_DIR}

# hadolint ignore=DL3008,DL3013,DL3015,DL3016,DL3018,DL3028
RUN apt-get update
RUN echo "Installing packages..." \
    && apt-get install -y python3 git ruby default-jdk gradle npm \
    && rm -rf /var/cache/apk/* \
    && gem install mdl \
    && npm install -g htmlhint
RUN apt-get install -y python3-pip \
    && pip3 install pipenv proselint \
    && mkdir -p /root/.gradle/ \
    && echo "org.gradle.daemon=true" >> /root/.gradle/gradle.properties \
    && echo "systemProp.org.gradle.internal.launcher.welcomeMessageEnabled=false" >> /root/.gradle/gradle.properties \
    && echo "Testing Gradle..." && gradle --version
   
RUN apt-get update
RUN apt-get install -y xorg openbox
RUN apt-get install -y default-jdk
RUN export PATH_TO_FX=/project/plugins/lib

CMD ["gradle", "grade"]
