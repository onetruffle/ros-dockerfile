FROM osrf/ros:noetic-desktop-full

WORKDIR /root

ADD run.sh ~/

RUN ~/run.sh
