FROM gcr.io/cloud-builders/gcloud

ENV KUSTOMIZE_VERSION 1.0.11

COPY kustomize.bash /builder/kustomize.bash

RUN apt-get update && \
    apt-get install -y wget && \
    wget https://github.com/kubernetes-sigs/kustomize/releases/download/v${KUSTOMIZE_VERSION}/kustomize_${KUSTOMIZE_VERSION}_linux_amd64 && \
    mv kustomize_${KUSTOMIZE_VERSION}_linux_amd64 /usr/local/bin/kustomize && \
    chmod +x /usr/local/bin/kustomize && \
    chmod +x /builder/kustomize.bash && \
    apt-get remove --purge -y curl && \
    apt-get --purge -y autoremove && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
