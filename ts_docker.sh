#!/bin/sh
xhost local:docker

sudo docker run -it \
-p 8888:8888 \
--network host \
-v /tmp/.X11-unix:/tmp/.X11-unix \
-v /home/zeke/dockerpython:/home/dockerpython \
-v /home/zeke/datasets:/home/datasets \
-v /media/videoDB:/media/videoDB \
-v /media/imageDB:/media/imageDB \
--name tsng-tf \
tensorflow/tensorflow /bin/bash\

