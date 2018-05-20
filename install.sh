#!/bin/bash

read -p "Download ROS? " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    /bin/bash installRos.sh
fi

read -p "Create catkin workspace? " -n 1 -r
CATKIN_WS=/home/nvidia/catkin_ws
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    mkdir -p $CATKIN_WS/src
    cd $CATKIN_WS/src
    catkin_init_workspace
fi

read -p "Clone repos? " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    cd $CATKIN_WS/src
    sudo apt-get install -y git
    git clone https://github.com/stanfordroboticsclub/teleop_twist_joy
    git clone https://github.com/stanfordroboticsclub/arm-blender
    git clone https://github.com/stanfordroboticsclub/rover_viz
    git clone https://github.com/stanfordroboticsclub/rover_vision
fi

read -p "Install other ROS packages? " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    sudo apt get install -y ros-kinetic-navigation    
fi

