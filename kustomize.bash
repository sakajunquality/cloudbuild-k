#!/bin/bash

if [ "$APPLY" = true ]; then
  if [ "$DEBUG" = true ]; then
    echo "Running: kustomize $@ | kubectl apply -f -"
  fi

  kustomize "$@" | kubectl apply -f -
else
  if [ "$DEBUG" = true ]; then
    echo "Running: kustomize $@"
  fi

  kustomize "$@"
fi
