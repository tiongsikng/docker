#!/bin/sh
xhost local:docker

sudo docker run -it \
-p 8888:8888 \
--gpus all \
--network host \
-v /tmp/.X11-unix:/tmp/.X11-unix \
-v /home/tiongsik/dockerpython:/home/dockerpython \
-v /home/tiongsik/datasets:/home/datasets \
-v /home/tiongsik/PycharmProjects:/home/PycharmProjects \
--name tsng-cuda \
nvidia/cuda:10.0-base /bin/bash\
