#!/bin/bash

echo "
.  /opt/ros/noetic/setup.bash
.  ~/catkin_ws/devel/setup.bash" >> ~/.bashrc

## source the ros setup script for every new shell
.  /opt/ros/noetic/setup.bash

## update, install ###################################
packages=(
    iputils-ping
    mpv
    neovim
    git
    python-is-python3
    python3-torch
    python3-torchvision
    python3-torchaudio
    # python3-matplotlib (installed already)
)

apt update
## bash array, not zsh array
print ${packages[@]}
apt install ${packages[@]}

## set the catkin workspace only once #####################
cd ## refer to gist
mkdir -p catkin_ws/src
pushd catkin_ws
catkin_make
popd

## update ###################################
apt update
apt install iputils-ping neovim python-is-python3 git

## torch2rt
# git clone https://github.com/NVIDIA-AI-IOT/torch2trt
cd /data/torch2rt
python setup.py install --plugins
# pip install tqdm cython pycocotools

## trt_pose
# git clone https://github.com/u0251077/trt_pose_docker.git
cd /data/trt_pose_docker
python setup.py install

echo "export QT_X11_NO_MITSHM=1" >> ~/.profile 
