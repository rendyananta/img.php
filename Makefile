build-7.3:
	podman build -t docker.io/rendyananta/php-docker:7.3 -f 7.3/Dockerfile .

build-7.4:
	podman build -t docker.io/rendyananta/php-docker:7.4 -f 7.4/Dockerfile .

build-8.0:
	podman build -t docker.io/rendyananta/php-docker:8.0 -f 8.0/Dockerfile .

build-8.1:
	podman build -t docker.io/rendyananta/php-docker:8.1 -f 8.1/Dockerfile .

push-7.3:
	podman push docker.io/rendyananta/php-docker:7.3

push-7.4:
	podman push docker.io/rendyananta/php-docker:7.4

push-8.0:
	podman push docker.io/rendyananta/php-docker:8.0

push-8.1:
	podman push docker.io/rendyananta/php-docker:8.1