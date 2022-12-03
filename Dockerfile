FROM python:3-alpine

WORKDIR /output

RUN apk add --update --no-cache --virtual .build-deps gcc musl-dev \
  && apk add --no-cache bash bash-completion \
  && pip install --upgrade pip setuptools wheel \
  && pip install certifi brotli websockets mutagen pycryptodome \
  && pip install yt-dlp \
  && pip install gallery-dl \
  && rm -rf ~/.cache/pip \
  && apk del .build-deps \
  && apk add ffmpeg \
  && chmod o+w /output 

# COPY yt-dlp.conf /etc/yt-dlp.conf 
COPY gallery-dl-default.conf /etc/gallery-dl.conf
ENTRYPOINT [ "gallery-dl" ] 