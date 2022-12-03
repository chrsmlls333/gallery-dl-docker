FROM python:3-alpine

RUN apk add --update --no-cache --virtual .build-deps gcc musl-dev \
  && apk add --no-cache bash bash-completion \
  && pip install --upgrade pip setuptools wheel \
  && pip install certifi brotli websockets mutagen pycryptodome \
  && pip install yt-dlp \
  && pip install gallery-dl \
  && rm -rf ~/.cache/pip \
  && apk del .build-deps \
  && apk add ffmpeg \
  && mkdir -p /config/etc/ && chmod o+w /config \
  && mkdir -p /output/ && chmod o+w /output 

# COPY yt-dlp.conf /etc/yt-dlp.conf 
COPY gallery-dl-default.conf /etc/gallery-dl.conf

WORKDIR /output

ENTRYPOINT [ "gallery-dl" ] 