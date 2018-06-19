#!/usr/bin/env bash

url="http://kube-apiserver-0-instance.kubernetes.mesos:9000"
kubectl config set-cluster dcos-k8s --server=$url
kubectl config set-context dcos-k8s --cluster=dcos-k8s --namespace=default
kubectl config use-context dcos-k8s
