#!/bin/sh

echo "
.  /opt/ros/noetic/setup.bash
.  ~/catkin_ws/devel/setup.bash" >> ~/.bashrc

## source the ros setup script for every new shell
.  /opt/ros/noetic/setup.bash

## set the catkin workspace only once
pushd
mkdir -p catkin_ws/src
pushd catkin_ws
catkin_make
popd
