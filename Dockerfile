FROM lsiobase/alpine.nginx
MAINTAINER Mike Weaver

# set version label
ARG BUILD_DATE
ARG VERSION
LABEL build_version="Linuxserver.io version:- ${VERSION} Build-date:- ${BUILD_DATE}"

# install packages
RUN \
 apk add --no-cache \
	curl \
	git \
	php7-apcu \
	php7-curl \
	php7-dom \
	php7-gd \
	php7-iconv \
	php7-intl \
	php7-json \
	php7-mcrypt \
	php7-mysqli \
	php7-mysqlnd \
	php7-pcntl \
	php7-pdo_mysql \
	php7-posix \
	tar && \

 curl -sS https://getcomposer.org/installer | php && \
 mv composer.phar /usr/local/bin/composer

# link php7 to php, fix update daemon
 ln -sf /usr/bin/php7 /usr/bin/php

# copy local files
COPY root/ /

# ports and volumes
EXPOSE 80 443
VOLUME /config