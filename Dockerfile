FROM docker.io/osrf/ros:noetic-desktop-full

WORKDIR /root

ADD run.sh /root

RUN /root/run.sh
