#!/bin/bash
set -e

echo "🛠 Installing cert-manager..."
kubectl apply -f cert-manager.yaml

echo "⏳ Waiting for cert-manager pods to be ready..."
kubectl wait --namespace cert-manager --for=condition=Available --timeout=120s deployment/cert-manager

echo "✅ Applying ClusterIssuer..."
kubectl apply -f cluster-issuer.yaml
