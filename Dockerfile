FROM shokohsc/alpine-s6

ENV WORKDIR "/var/www/flask"

# install packages
RUN \
 echo "**** install build packages ****" && \
 apk add --no-cache \
    git \
    libressl2.7-libssl \
    logrotate \
    openssl \
    python3 \
    inotify-tools \
    py3-gunicorn && \
 echo "**** fix logrotate ****" && \
 sed -i "s#/var/log/messages {}.*# #g" /etc/logrotate.conf

# add local files
ADD root/ /

# ports and volumes
EXPOSE 80
VOLUME /var/www/flask

WORKDIR ${WORKDIR}
