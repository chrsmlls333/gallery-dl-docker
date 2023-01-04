FROM python:3-alpine

RUN echo "**** install runtime packages ****" \
  && apk add --update --no-cache --virtual .build-deps \
    gcc musl-dev \
  && apk add --no-cache \
    bash bash-completion \
    ca-certificates coreutils curl jq procps shadow tzdata \
    su-exec \
    ffmpeg \
  && apk del .build-deps

RUN echo "**** install application packages ****" \
  && pip install --upgrade pip setuptools wheel \
  && pip install certifi brotli websockets mutagen pycryptodome xattr \
  && pip install yt-dlp \
  && pip install gallery-dl \
  && rm -rf ~/.cache/pip 

ENV PUID=911
ENV PGID=911
ENV UMASK=000

RUN echo "**** create abc user and make our folders ****" && \
  umask ${UMASK} && \
  useradd -u ${PUID} -U -d /config abc && \
  usermod -G users abc && \
  mkdir -p \
    /config \
    /output

COPY includes/gallery-dl-default.conf /etc/gallery-dl.conf
COPY includes/yt-dlp-default.conf /etc/yt-dlp.conf

COPY docker-entrypoint.sh /etc/docker-entrypoint.sh
RUN echo "**** prepare entrypoint ****" && \
  chmod +x /etc/docker-entrypoint.sh && \
  echo 'exec /etc/docker-entrypoint.sh' >> ~/.bashrc && \
  echo "Any root access of bash pushes into user abc. Use sh for root access"
ENTRYPOINT [ "/etc/docker-entrypoint.sh" ] 
CMD [ "/bin/bash" ]

WORKDIR /output

VOLUME ["/config", "/output"]