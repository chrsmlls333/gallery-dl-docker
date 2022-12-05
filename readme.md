# Gallery-DL Docker  

Simple small Docker image for [gallery-dl](https://github.com/mikf/gallery-dl). 
Forked from [Shortcord](https://gitlab.shortcord.com/shortcord/gallery-dl-docker/) to add ytp-dl and ffmpeg!

View the [gallery-dl](./gallery-dl.sh) script for basic usage.  

Custom configuration can be provided/overridden as shown in the official repo [here](https://github.com/mikf/gallery-dl#configuration), keep in mind this container overrides the configuration located at `/etc/gallery-dl.conf`.  

You can view the overrides [here](./gallery-dl.conf) or by running `docker run -it --rm --entrypoint "" shortcord/gallery-dl cat /etc/gallery-dl.conf`.  

Repo is public on [Github](https://github.com/chrsmlls333/gallery-dl-docker).
Docker Registry is [Docker Hub](https://hub.docker.com/r/chrisemills/gallerydl).

## Parameters

Container images are configured using parameters passed at runtime (such as those above). These parameters are separated by a colon and indicate `<external>:<internal>` respectively. For example, `-p 8080:80` would expose port `80` from inside the container to be accessible from the host's IP on port `8080` outside the container.

| Parameter | Function |
| :----: | --- |
| `-e 'UMASK'=___` | set perms of newly created files in  /output |
| `-e 'PUID'=___` | set main user id |
| `-e 'PGID'=___` | set main group id |
| `-v ____:/config:rw` | main config, archive, and cookies location |
| `-v ____:/output:rw` | Location of download output! |

## TODO

- https://docs.github.com/en/actions/publishing-packages/publishing-docker-images
- https://selfhosters.net/docker/templating/templating/
