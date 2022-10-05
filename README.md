# PHP Container Image.
This container image are useful for deploying base web php applications.

## Introduction

There are 2 variants provided in this repository. To know which variants are suitable for your use case
you need to take a look a detail of these variants. If you are using Laravel, then all of these images are fully compatible.
The images containing the php with already installed extensions below.
- gd \
- opcache \
- pgsql \
- zip \
- redis \
- pdo_pgsql \
- pdo_mysql \
- sockets \
- bz2 \
- pcntl \
- bcmath \
- rdkafka \
- sqlsrv \
- pdo_sqlsrv \
- exif

### Vanilla image
This image variant consist of several php versions
- 7.3
- 7.4
- 8.0
- 8.1

This vanilla images are usually used as a base image if you want to deploy your own web server. 
This variant also useful if used in the testing stage because it is already included composer. 
The php-fpm logs, will be redirected fully to the `os.stdout` and `os.stderr` that will make easier
if we want to aggregate the logs inside container orchestration tools without 3rd party app. 

### Nginx image
This image variant consist of several php versions
- 7.4
- 8.0
- 8.1

In this nginx variant, the php fpm not writing the logs in the container stdin and stdout, instead they're logging in the /var/log directories.
This is hard if we want to use this image in the container orchestration tools such as docker swarm or kubernetes.
Because we have two separated service, the logs need to be aggregated using 3rd party logger such as fluentd or logstash. 
Besides that, there is another things that author personally not preferred. It related to the service monitoring and health check.
If one of our services (nginx and php-fpm) die, we won't know unless we are setting up the health check script and look the details of the logs
present on the /var/log directories.

## How To Use
To use this image, we can pull the image by using this command.
```shell
docker pull docker.io/rendyananta/php-docker:<tag>
```

The `<tag>` value can be constructed with `version-variant`, for instance if we want to use the PHP 7.4 vanilla then the tag should be
`7.4`. If we want to use the nginx variant, then we can just append the `-nginx`, so the tag would be `7.4-nginx`.

## How To Build
This repository is shipped with `Makefile`, the rules already defined there.
If we want to build all the images concurrently, we can invoke 
```shell
make build
```

The command above will execute build for all the image variants provided in this repository.