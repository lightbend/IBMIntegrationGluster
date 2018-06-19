# From https://hub.docker.com/r/lenart/heketi-turnkey/~/dockerfile/ and https://github.com/lenartj/gluster-kubernetes/blob/master/deploy/Dockerfile
#
#
# This image is to be used with the heketi-turnkey deployment.
# See https://github.com/lenartj/gluster-kubernetes/tree/master/deploy/kube-templates/heketi-turnkey.yaml
#
#
#The docker image includes:
# - gk-deploy from the gluster-kubernetes project
# - heketi-cli binary built from source (github master)
# - kubectl binary from apt.kubernetes.io
# - run time dependencies for gk-deploy
#
FROM debian:sid

RUN apt-get clean && \
    apt-get update && \
    apt-get install -y python-minimal curl wget

RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl && \
    chmod +x ./kubectl && \
    mv ./kubectl /usr/local/bin/kubectl

RUN wget https://github.com/heketi/heketi/releases/download/v6.0.0/heketi-client-v6.0.0.linux.amd64.tar.gz && \
    tar -xzf heketi-client-v6.0.0.linux.amd64.tar.gz && \
    mv heketi-client/bin/* /usr/local/bin && \
    rm heketi-client-v6.0.0.linux.amd64.tar.gz && \
    rm -R heketi-client

RUN mkdir -p /opt/gk-deploy && \
    chmod -R 777 /opt/gk-deploy

COPY ./gluster-kubernetes/deploy /opt/gk-deploy
WORKDIR /opt/gk-deploy
