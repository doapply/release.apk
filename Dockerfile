FROM debian:10.1

LABEL "version"="0.0.1"
LABEL "com.github.actions.name"="Release Apk Publisher"
LABEL "com.github.actions.description"="Build & Publish Release Apk in on Github"
LABEL "com.github.actions.icon"="package"
LABEL "com.github.actions.color"="red"

LABEL "repository"="https://github.com/doapply/release"
LABEL "maintainer"="doapply"

RUN apt update \
	&& apt -y upgrade \
	&& apt install -y hub \
	&& apt autoremove \
	&& apt autoclean \
	&& apt clean

ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
