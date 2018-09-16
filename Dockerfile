FROM alpine

# set version label
ARG BUILD_DATE
ARG VERSION
LABEL build_v="Durn's version: ${VERSION} Build-date: ${BUILD_DATE}"
LABEL maintainer="Durn"

# env settings
VOLUME /config

# run installs 
RUN \
apk update && \
apk --no-cache add \
npm && \
npm install --global godaddy-dns && \
echo "Installed lmammino's godaddy-dns package"

# add files and set cron
COPY run.sh /bin/run.sh
RUN chmod +x /bin/run.sh
COPY crontab /var/spool/cron/crontabs/root

# run init
CMD ["crond", "-f"]
