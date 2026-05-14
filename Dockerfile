FROM docker.io/ros:jazzy-ros-core
RUN apt-get update && apt-get install -y \
    ros-jazzy-mavros \
    ros-jazzy-rmw-cyclonedds-cpp \
    && rm -rf /var/lib/apt/lists/*

# Install GeographicLib datasets for MAVROS
RUN /opt/ros/jazzy/lib/mavros/install_geographiclib_datasets.sh

ENV ROS_DOMAIN_ID=42
ENV RMW_IMPLEMENTATION=rmw_cyclonedds_cpp


COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 8765

ENTRYPOINT ["/entrypoint.sh"]