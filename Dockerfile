FROM shokohsc/python-s6

# install packages
RUN \
 echo "**** install build packages ****" && \
 apk add --no-cache \
    inotify-tools \
    py3-gunicorn && \
 echo "**** fix logrotate ****" && \
 sed -i "s#/var/log/messages {}.*# #g" /etc/logrotate.conf

# add local files
ADD root/ /

# ports and volumes
EXPOSE 80
