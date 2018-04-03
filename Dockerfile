FROM compulsivecoder/jenkins-arm-iot

USER root

RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF && \
echo "deb http://download.mono-project.com/repo/debian wheezy main" | tee /etc/apt/sources.list.d/mono-xamarin.list

RUN apt-get update && apt-get -y upgrade && apt-get -y install \
  wget \
  git \
  mono-devel \
  mono-complete \
  ca-certificates-mono \
  msbuild \
  python \
  python-pip \
  && rm -rf /var/lib/apt/lists/*

USER ${user}

ENTRYPOINT ["/usr/bin/java", "-jar", "/usr/local/jenkins.war"]
EXPOSE 8080
CMD [""]
