FROM centos:7 
MAINTAINER Teerapat Khunpech <ball@engineerball.com>

RUN rpm --import http://mirror.centos.org/centos/RPM-GPG-KEY-CentOS-7 \
    && rpm --import http://dl.fedoraproject.org/pub/epel/RPM-GPG-KEY-EPEL-7 \
    && rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm \
    && rpm -Uvh https://mirror.webtatic.com/yum/el7/webtatic-release.rpm


VOLUME ["/app"]

RUN yum -y update && \
    yum -y install \
    pcre-devel gcc make \
    httpd \
    epel-release \
    curl \
    git \
    php70w \
    php70w-devel \
    php70w-opcache \
    php70w-cli \
    php70w-common \
    php70w-gd \
    php70w-intl \
    php70w-mcrypt \
    php70w-ldap \
    php70w-mbstring \
    php70w-mysql \
    php70w-pecl-xdebug \
    php70w-pgsql \
    php70w-soap \
    php70w-xml \
    php70w-xmlrpc


#Install Phalcon
RUN git clone git://github.com/phalcon/cphalcon.git && \
    cd /cphalcon/build && \
    ./install

COPY apache_default /etc/httpd/conf.d/000-default.conf
COPY run /usr/local/bin/run
RUN chmod +x /usr/local/bin/run
#RUN a2enmod rewrite

EXPOSE 80
CMD ["/usr/local/bin/run"]
