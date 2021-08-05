build-7.4:
	docker build -t rendyananta/php-docker:7.4 -f 7.4/Dockerfile .

build-8.0:
	docker build -t rendyananta/php-docker:8.0 -f 8.0/Dockerfile .

push-7.4:
	docker push rendyananta/php-docker:7.4

push-8.0:
	docker push rendyananta/php-docker:8.0