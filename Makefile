build:
	make -j 2 build-vanilla build-nginx

push:
	make -j 2 push-vanilla push-nginx

build-vanilla:
	make -j 4 build-7.3 build-7.4 build-8.0 build-8.1

build-nginx:
	make -j 3 build-7.4-nginx build-8.0-nginx build-8.1-nginx

push-vanilla:
	make -j 4 push-7.3 push-7.4 push-8.0 push-8.1

push-nginx:
	make -j 3 push-7.4-nginx push-8.0-nginx push-8.1-nginx

build-7.3:
	docker build -t docker.io/rendyananta/img-php:7.3 -f 7.3/Containerfile .

build-7.4:
	docker build -t docker.io/rendyananta/img-php:7.4 -f 7.4/Containerfile .

build-8.0:
	docker build -t docker.io/rendyananta/img-php:8.0 -f 8.0/Containerfile .

build-8.1:
	docker build -t docker.io/rendyananta/img-php:8.1 -f 8.1/Containerfile .

build-7.4-nginx:
	docker build -t docker.io/rendyananta/img-php:7.4-nginx -f nginx/7.4/Containerfile .

build-8.0-nginx:
	docker build -t docker.io/rendyananta/img-php:8.0-nginx -f nginx/8.0/Containerfile .

build-8.1-nginx:
	docker build -t docker.io/rendyananta/img-php:8.1-nginx -f nginx/8.1/Containerfile .

push-7.3:
	docker push docker.io/rendyananta/img-php:7.3

push-7.4:
	docker push docker.io/rendyananta/img-php:7.4

push-7.4-nginx:
	docker push docker.io/rendyananta/img-php:7.4-nginx

push-8.0:
	docker push docker.io/rendyananta/img-php:8.0

push-8.0-nginx:
	docker push docker.io/rendyananta/img-php:8.0-nginx

push-8.1:
	docker push docker.io/rendyananta/img-php:8.1

push-8.1-nginx:
	docker push docker.io/rendyananta/img-php:8.1-nginx
