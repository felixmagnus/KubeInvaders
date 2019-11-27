#!/bin/bash

helm del --purge kubeinvaders

kubectl delete namespace kubeinvaders --now

docker build . --tag felixmagnus/kubeinvaders

docker push felixmagnus/kubeinvaders

helm install --set-string target_namespace="hackergarten" --name kubeinvaders --namespace kubeinvaders ./helm-charts/kubeinvaders