#!/bin/bash
set -e

source /opt/ros/jazzy/setup.bash

exec ros2 run mavros mavros_node \
  --ros-args \
  -p fcu_url:="serial:///dev/ttyAMA2:57600" \
  -p gcs_url:="udp://@0.0.0.0:14550"
