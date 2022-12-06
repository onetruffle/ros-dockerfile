#!/bin/bash

echo "
.  /opt/ros/noetic/setup.bash
.  ~/catkin_ws/devel/setup.bash" >> ~/.bashrc

## source the ros setup script for every new shell
.  /opt/ros/noetic/setup.bash

## set the catkin workspace only once
cd ## refer to gist
mkdir -p catkin_ws/src
pushd catkin_ws
catkin_make
popd

## update ###################################
apt update
apt install iputils-ping neovim python-is-python3 git
