# Centos7 + Apache2.4 + PHP7 + phalcon

docker image based on centos7 with last stable PHP Phalcon framework with apache 2.4 webserver installed

This image using centos7 image as based image

### Installation

```
$ docker pull engineerball/centos-apache24-php7-phalcon
```

### Usage
```
$ docker run -v /var/www/html:/app -p 8080:80 engineerball/centos-apache24-php7-phalcon
```

The apache webserver with Phalcon PHP framework will available on TCP port 8080 on your machine. The document root will be the folder you specified after the -v switch.
