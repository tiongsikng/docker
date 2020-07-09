### docker
Tensorflow Docker with Jupyter

*Assuming that Ubuntu is used.*

## 0) Installing Docker:
Run `bash install-docker.sh` to install docker (half-automated). Installation instructions are similar to the one in [Docker Website](https://docs.docker.com/engine/install/ubuntu/).

## 1) Pulling Tensorflow Docker image and running in a container:
Run `ts-docker.sh` to pull docker image and mount volumes. 

Details:
The last line specifies the image being pulled, in this case tensorflow/tensorflow for Tensorflow Image, can be changed accordingly. 

Mounted volumes can be changed in the -v command (i.e. Assuming that you have a folder in home directory, the same folder that you want to mount will appear in the docker container, and any changes you make in that folder will also be changed in the Docker container automatically). 

Ports can be configured in the -p argument. 

To link a Docker container with another Docker container, use `--link <container_to_link>:<container_to_link>`. Details on container linking at [Legacy Container Links website](https://docs.docker.com/network/links/).

## 2) Installing packages in the container
Once in the container, run `bash install.sh` to install the packages. Packages installed using apt-get will be installed from `packages.sh`, while packages installed using pip will be installed from `requirements.txt`. Edit the files accordingly for packages to be installed.

*Note: The most straightforward way to do so is by putting `install.sh`, `packages.sh`, `requirements.txt` inside a mounted folder (and changing directory) to be able to install the necessary packages. Running the `bash install.sh` script will automatically install the packages inside the Docker container. Else, you may create your own script or manually install it yourself.*

## \*) Jupyter Notebook
To run Jupyter notebook, enter the command
`jupyter notebook --ip=127.0.0.1 --port=8888 --allow-root`

Port should first be changed accordingly in `ts_docker.sh` file to enable running. To enter Jupyter, click on the link in terminal, or enter [127.0.0.1:8888](127.0.0.1:8888). Enter the token provided in the terminal to start browsing. The IP and port should be changed accordingly based on how the Jupyter notebook command is run.
