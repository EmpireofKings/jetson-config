#!/bin/bash

# ROS Kinetic install. Taken from http://wiki.ros.org/kinetic/Installation/Ubuntu with minor modifications.

echo "${green}Installing ROS Kinetic...${reset}"

# Setup your sources.list
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'

# Set up your keys
sudo apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-key 0xB01FA116

# Update package index
sudo apt-get update

# Install ROS base and MAVROS packages
sudo apt-get install -y ros-kinetic-ros-base

# Initialize rosdep
sudo rosdep init
rosdep update

# Environment setup - optional. Do not run if multiple versions of ROS are present.
echo "source /opt/ros/kinetic/setup.bash" >> $HOME/.bashrc
source /opt/ros/kinetic/setup.bash
