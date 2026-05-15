#!/bin/bash
set -e

source /opt/ros/jazzy/setup.bash

exec ros2 run mavros mavros_node \
  --ros-args \
  -p fcu_url:="serial:///dev/ttyAMA2:921600" \
  -p gcs_url:="udp-b://0.0.0.0:14550@14555"
