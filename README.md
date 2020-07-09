# docker

Tensorflow Docker with Jupyter

1. Run ts-docker.sh to pull docker image and mount volumes. The image being pulled is tensorflow/tensorflow, change accordingly. Mounted volumes can be changed in the -v command. Ports can be configured in the -p argument. To link a container with another, use `--link <container_to_link>:<container_to_link>`.
2. Once in the container, run `bash install.sh` to install the packages. Packages installed using apt-get will be installed from packages.sh, while packages installed using pip will be installed from requirements.txt. Edit the files accordingly for packages to be installed.


To run Jupyter notebook, enter the command
`jupyter notebook --ip=127.0.0.1 --port=8888 --allow-root`
Port should first be changed accordingly in ts_docker.sh file to enable running. To enter Jupyter, click on the link in terminal, or enter [127.0.0.1:8888](127.0.0.1:8888). Enter the token provided in the terminal to start browsing. The IP and port should be changed accordingly based on how the Jupyter notebook command is run.
