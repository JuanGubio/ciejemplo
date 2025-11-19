# Makefile

# Variables
IMAGE_NAME = juanpi38818/juan-gubio
STACK_NAME = backend

# Construir la imagen Docker
build:
    docker build -t $(IMAGE_NAME) .

# Subir la imagen a GitHub Container Registry (GHCR)
push: build
    docker push $(IMAGE_NAME)

# Desplegar el stack en Docker Swarm
deploy: push
    docker stack deploy --with-registry-auth -c stack.yml $(STACK_NAME)