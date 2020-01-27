ARG FROM_TAG='latest'
FROM shokohsc/alpine-s6:${FROM_TAG:-latest}

# install packages
RUN \
 echo "**** install build packages ****" && \
 apk update && \
 apk add --no-cache \
    inotify-tools \
    py3-gunicorn && \
 echo "**** fix logrotate ****" && \
 sed -i "s#/var/log/messages {}.*# #g" /etc/logrotate.conf

# add local files
ADD root/ /

# ports and volumes
EXPOSE 80
