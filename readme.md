# Gallery-DL Docker  

Simple small Docker image for [gallery-dl](https://github.com/mikf/gallery-dl).  

View the [gallery-dl](https://gitlab.shortcord.com/shortcord/gallery-dl-docker/master/gallery-dl.sh) script for basic usage.  

Custom configuration can be provided/overridden as shown in the official repo [here](https://github.com/mikf/gallery-dl#configuration), keep in mind this container overrides the configuration located at `/etc/gallery-dl.conf`.  

You can view the overrides [here](https://gitlab.shortcord.com/shortcord/gallery-dl-docker/master/gallery-dl.conf) or by running `docker run -it --rm shortcord/gallery-dl cat /etc/gallery-dl.conf`.  

Repo is public on my [Selfhosted Gitlab](https://gitlab.shortcord.com/shortcord/gallery-dl-docker/).

![Pipeline Status](https://gitlab.shortcord.com/shortcord/gallery-dl-docker/badges/master/pipeline.svg)