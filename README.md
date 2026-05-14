
```bash
podman run -it --privileged  --device=/dev/ttyAMA2:/dev/ttyAMA2 --group-add keep-groups mavros
podman run -it --privileged --ipc=host --network=host --device=/dev/ttyAMA2:/dev/ttyAMA2 --group-add keep-groups ghcr.io/raspi-drone/mavlink-bridge:latest
```

```bash
ros2 run mavros mavros_node --ros-args -p fcu_url:=/dev/ttyAMA2:57600
```