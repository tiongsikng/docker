#!/bin/sh
xhost local:docker

sudo docker run -it \
-p 8888:8888 \
--network host \
-v /tmp/.X11-unix:/tmp/.X11-unix \
-v /home/tiongsik/dockerpython:/home/dockerpython \
-v /home/tiongsik/datasets:/home/datasets \
--name tsng-tf \
tensorflow/tensorflow /bin/bash\

