FROM gcr.io/cloud-builders/gcloud

ENV KUSTOMIZE_VERSION 1.0.11
ENV KUBEVAL_VERSION 0.7.3

COPY kustomize.bash /builder/gcloud_credential.bash
COPY kustomize.bash /builder/kustomize.bash
COPY kustomize.bash /builder/wait_for_job.bash

RUN apt-get update && \
    apt-get install -y wget && \
    wget https://github.com/kubernetes-sigs/kustomize/releases/download/v${KUSTOMIZE_VERSION}/kustomize_${KUSTOMIZE_VERSION}_linux_amd64 && \
    mv kustomize_${KUSTOMIZE_VERSION}_linux_amd64 /usr/local/bin/kustomize && \
    chmod +x /usr/local/bin/kustomize && \
    wget  https://github.com/garethr/kubeval/releases/download/${KUBEVAL_VERSION}/kubeval-linux-amd64.tar.gz && \
    tar xzvf kubeval-linux-amd64.tar.gz &&\
    chmod +x kubeval && \
    mv kubeval /usr/local/bin && \
    chmod +x /builder/gcloud_credential.bash && \
    chmod +x /builder/kustomize.bash && \
    chmod +x /builder/wait_for_job.bash && \
    apt-get remove --purge -y curl && \
    apt-get --purge -y autoremove && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
