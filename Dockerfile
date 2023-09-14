FROM alpine:3.15

# Install required packages
RUN apk update \
    && apk add --no-cache vim \
    python3 \
    py3-pip \
    curl \
    git  \
    bash \ 
    openrc

# Install Docker
RUN apk add --update docker
RUN apk add docker-cli-compose
RUN rc-update add docker default
RUN service docker start

# Clone repository
RUN git clone -b 2.0 https://github.com/QingdaoU/OnlineJudgeDeploy.git

WORKDIR /OnlineJudgeDeploy

CMD ["sh", "-c", "docker", "compose", "up", "-d"]
