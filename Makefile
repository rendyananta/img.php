build-7.4:
	docker build -t ghcr.io/rendyananta/php-docker:7.4 -f 7.4/Dockerfile .

build-8.0:
	docker build -t ghcr.io/rendyananta/php-docker:8.0 -f 8.0/Dockerfile .

build-8.1:
	docker build -t ghcr.io/rendyananta/php-docker:8.1 -f 8.1/Dockerfile .

push-7.4:
	docker push ghcr.io/rendyananta/php-docker:7.4

push-8.0:
	docker push ghcr.io/rendyananta/php-docker:8.0

push-8.1:
	docker push ghcr.io/rendyananta/php-docker:8.1