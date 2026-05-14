#!/bin/bash
set -e

source /opt/ros/jazzy/setup.bash

exec ros2 run mavros mavros_node \
  --ros-args \
  -p fcu_url:=/dev/ttyAMA2:57600