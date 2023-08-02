FROM debian:buster
LABEL org.opencontainers.image.authors="Ivan Dmitriev <idmitriev@webmonitorx.ru>"

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get -y update \
    && apt-get -y upgrade \
    && apt-get -y --no-install-recommends install \
        nginx \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY geo/GeoIP.dat geo/GeoIPCity.dat /usr/share/geoip/
COPY nginx/nginx.conf /etc/nginx/nginx.conf

EXPOSE 80 443

CMD ["nginx", "-c", "/etc/nginx/nginx.conf"]
