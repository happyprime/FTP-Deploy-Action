FROM alpine:3.10

LABEL version="2.0.1"
LABEL repository="https://github.com/HappyPrime/FTP-Deploy-Action"
LABEL homepage="https://github.com/HappyPrime/FTP-Deploy-Action"
LABEL maintainer="Jeremy Felt <jeremy@happyprime.co>"

LABEL "com.github.actions.name"="Happy Prime FTP Deploy Action"
LABEL "com.github.actions.description"="Deploy Happy Prime repos via FTP"
LABEL "com.github.actions.icon"="upload-cloud"
LABEL "com.github.actions.color"="orange"

RUN apk update
RUN apk add openssh sshpass lftp

COPY entrypoint.sh /entrypoint.sh
RUN chmod 777 entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
