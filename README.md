# Handbrake for Kubernetes
This is a fork of https://github.com/jlesage/docker-handbrake that has been
modified to run in parallel on Kubernetes.

* Inject custom preferences or hooks. Create a folder
  mimicking the structure under `rootfs` in this repo, like `rootfs/defaults/ghb/preferences.json`,
  and then add any files that you want to be included. They are copied when you
  build your Docker container.
* The watch logic can handle multiple workers pointed at the same directory.
* Includes a post conversion webhook. I use it to refresh my Plex library.
* Copies the file from the volumes back to the local file system during transcoding.
