build:
	docker build -t ghcr.io/juangubio/juanpo:1.0.1 .

deploy:
	docker stack deploy --with-registry-auth -c stack.yml backend

rm:
	docker stack rm backend