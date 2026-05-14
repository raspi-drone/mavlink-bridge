FROM ros:jazzy-ros-core

RUN apt-get update && apt-get install -y \
    ros-jazzy-mavros \
    ros-jazzy-rmw-cyclonedds-cpp \
    && rm -rf /var/lib/apt/lists/*

ENV ROS_DOMAIN_ID=42
ENV RMW_IMPLEMENTATION=rmw_cyclonedds_cpp

EXPOSE 8765

CMD ["bash", "-c", "source /opt/ros/jazzy/setup.bash && exec bash"]
