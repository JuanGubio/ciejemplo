#!/bin/bash

USER="juangubio"
REGISTRY="ghcr.io"
IMAGE_NAME="juanpi"
TAG="1.0.1"
FULL_IMAGE="$REGISTRY/$USER/$IMAGE_NAME:$TAG"

echo "Construyendo imagen Docker..."
docker build -t $FULL_IMAGE .

echo "Iniciando sesión en GitHub Container Registry..."
echo $GHCR_PAT | docker login ghcr.io -u $USER --password-stdin

echo "Subiendo imagen a GHCR..."
docker push $FULL_IMAGE

echo "Subiendo cambios a GitHub..."
git add .
git commit -m "Deploy version $TAG"
git push origin main

echo "Imagen subida correctamente."
echo "Verifica aquí: https://github.com/JuanGubio/ciejemplo/pkgs/container/juan-gubio"
echo "Nombre de la imagen: $FULL_IMAGE"
echo ""
echo "La imagen está disponible en GitHub Packages."