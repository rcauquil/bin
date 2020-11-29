# Services

## Plex

Official Docker container for Plex Media Server:   
[plexinc/pms-docker](https://hub.docker.com/r/plexinc/pms-docker)

ex:

```
docker run -d --name=plex --network=host --env-file=.env -v ~/Plex/database:/config -v ~/Plex/transcode:/transcode -v ~/Videos:/data/videos -v ~/Music:/data/music plexinc/pms-docker:latest
```

## Syncthing

Open Source Continuous File Synchronization   
[syncthing/syncthing](https://hub.docker.com/r/syncthing/syncthing)

ex: 

```
docker run --network=host -v ~:/var/syncthing syncthing/syncthing:latest
```
