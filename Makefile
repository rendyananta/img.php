build-7.3:
	docker build -t docker.io/rendyananta/php-docker:7.3 -f 7.3/Dockerfile .

build-7.4:
	docker build -t docker.io/rendyananta/php-docker:7.4 -f 7.4/Dockerfile .

build-8.0:
	docker build -t docker.io/rendyananta/php-docker:8.0 -f 8.0/Dockerfile .

build-8.1:
	docker build -t docker.io/rendyananta/php-docker:8.1 -f 8.1/Dockerfile .

build-7.4-nginx:
	docker build -t docker.io/rendyananta/php-docker:7.4-nginx -f nginx/7.4/Dockerfile .

build-8.0-nginx:
	docker build -t docker.io/rendyananta/php-docker:8.0-nginx -f nginx/8.0/Dockerfile .

build-8.1-nginx:
	docker build -t docker.io/rendyananta/php-docker:8.1-nginx -f nginx/8.1/Dockerfile .

push-7.4:
	docker push docker.io/rendyananta/php-docker:7.4

push-7.4-nginx:
	docker push docker.io/rendyananta/php-docker:7.4-nginx

push-8.0:
	docker push docker.io/rendyananta/php-docker:8.0

push-8.0-nginx:
	docker push docker.io/rendyananta/php-docker:8.0-nginx

push-8.1:
	docker push docker.io/rendyananta/php-docker:8.1

push-8.1-nginx:
	docker push docker.io/rendyananta/php-docker:8.1-nginx
