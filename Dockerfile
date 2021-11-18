FROM python:3-alpine
RUN python3 -m pip install -U gallery-dl
COPY gallery-dl.conf /etc/gallery-dl.conf
ENTRYPOINT [ "gallery-dl" ]
