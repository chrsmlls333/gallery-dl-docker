FROM python:3-alpine

RUN apk add --update --no-cache --virtual .build-deps gcc musl-dev \
  && pip install --upgrade pip setuptools wheel \
  && pip install certifi brotli websockets mutagen pycryptodome \
  && pip install yt-dlp \
  && pip install gallery-dl \
  && rm -rf ~/.cache/pip \
  && apk del .build-deps \
  && apk add ffmpeg \
  && chmod o+w /output \
  && adduser -D gdluser

# COPY yt-dlp.conf /etc/yt-dlp.conf 
COPY gallery-dl.conf /etc/gallery-dl.conf
# WORKDIR /output
USER gdluser
ENTRYPOINT [ "gallery-dl" ] 