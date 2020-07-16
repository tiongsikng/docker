### docker
NVIDIA Cuda Docker

*Assuming that Ubuntu is used.*

## 0) Installing Docker and NVIDIA Container Runtime:
Run `bash install-docker.sh` to install docker (half-automated). Installation instructions are similar to the one in [Docker Website](https://docs.docker.com/engine/install/ubuntu/).

Run `nvidia-container-runtime.sh` to install NVIDIA Docker container runtime. Installation instructions are from [NVIDIA Docker Github](https://github.com/NVIDIA/nvidia-docker). After the script is executed completely, run `docker run --gpus all nvidia/cuda:10.0-base nvidia-smi` to test if NVIDIA is working properly with the container.

## 1) Pulling Cuda Docker Image and running in a container:
Run `ts_docker.sh` to pull docker image and mount volumes.

Details:
The last line specifies the image being pulled, (i.e. tensorflow/tensorflow for Tensorflow Image, nvidia/cuda:10.0-base for Cuda 10.0 Image), can be changed accordingly. If Cuda Image is pulled, run `nvidia-smi` to test if NVIDIA is working in the container.

Mounted volumes can be changed in the -v command (i.e. Assuming that you have a folder in home directory, the same folder that you want to mount will appear in the docker container, and any changes you make in that folder will also be changed in the Docker container automatically). 

`--gpus all argument` is to enable running the computer with GPU.

Ports can be configured in the -p argument. 

`-- name *name*` specifies the container name, instead of randomly generated names.

To link a Docker container with another Docker container, use `--link <container_to_link>:<container_to_link>`. Details on container linking at [Legacy Container Links website](https://docs.docker.com/network/links/).

## 2) Installing packages in the container
Once in the container, run `bash install.sh` to install the packages. Packages installed using apt-get will be installed from `packages.sh`, while packages installed using pip will be installed from `requirements.txt`. Edit the files accordingly for packages to be installed.

*Note: The most straightforward way to do so is by putting `install.sh`, `packages.sh`, `requirements.txt` inside a mounted folder (and changing directory) to be able to install the necessary packages. Running the `bash install.sh` script will automatically install the packages inside the Docker container. Else, you may create your own script or manually install it yourself.*

## 3) Jupyter Notebook (Optional)
To run Jupyter notebook, enter the command
`jupyter notebook --ip=127.0.0.1 --port=8888 --allow-root`

Port should first be changed accordingly in `ts_docker.sh` file to enable running. To enter Jupyter, click on the link in terminal, or enter [127.0.0.1:8888](127.0.0.1:8888). Enter the token provided in the terminal to start browsing. The IP and port should be changed accordingly based on how the Jupyter notebook command is run.

## \* Basic Docker commands
* *Check (active) containers:* `docker ps (-a)`
* *Check images:* `docker images`
* *Pull images from Docker repository:* `docker pull image(/image):image-tags`
* *Start existing container:*
  * `docker start <container id>`
  * `docker attach <container id>`
* *Start new container:* `docker exec -it <container-id> /bin/bash - to run as bash for detached containers (-d)`
* *Stop container:* `docker stop <container id>`
* *Delete* **(Note: You must delete all containers related to an image before deleting the image)**:
  * *Container:* `docker rm <container id>`
  * *Image:* `docker rmi <container id>`

