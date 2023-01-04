FROM ubuntu:20.04

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y apache2 \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y libapache2-mod-php \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y php-mysql

COPY lwt_v_2_0_3 /var/www/html
RUN rm /var/www/html/index.html

EXPOSE 80

CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]