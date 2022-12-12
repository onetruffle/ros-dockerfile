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
    python3-pip
    # python3-torch
    # python3-torchvision
    # python3-torchaudio
    # python3-matplotlib (installed already)
)

apt-get update
## bash array, not zsh array
print ${packages[@]}
apt-get install -y --no-install-recommends ${packages[@]}

## set the catkin workspace only once #####################
cd ## refer to gist
mkdir -p catkin_ws/src
pushd catkin_ws
catkin_make
popd

# ## update ###################################
# apt-get update
# apt-get install iputils-ping neovim python-is-python3 git

# ## torch2rt
# # git clone https://github.com/NVIDIA-AI-IOT/torch2trt
# cd /data/torch2rt
# python setup.py install --plugins
# # pip install tqdm cython pycocotools

# ## trt_pose
# # git clone https://github.com/u0251077/trt_pose_docker.git
# cd /data/trt_pose_docker
# python setup.py install

# echo "export QT_X11_NO_MITSHM=1" >> ~/.profile 

## ros-kortex ##############################
# apt install python3 python3-pip
python3 -m pip install conan
conan config set general.revisions_enabled=1
conan profile new default --detect > /dev/null
conan profile update settings.compiler.libcxx=libstdc++11 default
# mkdir -p catkin_workspace/src
# cd catkin_workspace/src
cd catkin_ws/src
git clone -b <branch-name> https://github.com/Kinovarobotics/ros_kortex.git
cd ../
rosdep install --from-paths src --ignore-src -y

## audio #############
## https://leimao.github.io/blog/Docker-Container-Audio/
## https://joonas.fi/2020/12/audio-in-docker-containers-linux-audio-subsystems-spotifyd/
apt-get install -y --no-install-recommends alsa-utils libpulse0 libasound2 libasound2-plugins

apt-get clean