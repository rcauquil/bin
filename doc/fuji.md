# Fuji

## Run fujix cam on ubuntu

### Setup

```
sudo apt install gphoto2 v4l2loopback-utils v4l2loopback-dkms ffmpeg
```

### Create dummy video

```
sudo modprobe v4l2loopback exclusive_caps=1 max_buffers=2
```

### Run the capture

```
gphoto2 --stdout --capture-movie --set-config /main/capturesettings/focusmode=2 | ffmpeg -i - -vcodec rawvideo -pix_fmt yuv420p -threads 0 -f v4l2 /dev/video2
```
