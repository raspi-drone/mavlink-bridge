# MAVLink ROS 2 Bridge

A lightweight Dockerized ROS 2 Jazzy + MAVROS bridge for connecting an ArduPilot flight controller to a Raspberry Pi flight computer over MAVLink.

This container provides:

- ROS 2 Jazzy runtime
- MAVROS integration
- CycloneDDS middleware
- MAVLink serial connection to the FCU
- GeographicLib datasets required by MAVROS

Designed for onboard companion-computer setups using a Raspberry Pi.

---

## Architecture

```text
┌─────────────────────┐
│ Raspberry Pi        │
│ ROS 2 Flight Stack  │
│                     │
│  MAVROS Container   │
│         │           │
│         ▼           │
│   /dev/ttyAMA2      │
└─────────┬───────────┘
          │ UART
          ▼
┌─────────────────────┐
│ ArduPilot FCU       │
│ (Pixhawk/Cube/etc.) │
└─────────────────────┘
```

---

## Features

- ROS 2 Jazzy based
- MAVROS preinstalled
- GeographicLib datasets automatically installed
- CycloneDDS support
- Simple UART serial configuration

---

## Requirements

### Hardware

- Raspberry Pi (recommended: Pi 4 or Pi 5)
- ArduPilot-compatible flight controller
- UART connection between Pi and FCU

### Software

- Podman or Docker

---

## UART Configuration

The container expects the FCU to be connected on:

```bash
/dev/ttyAMA2
```

at:

```bash
57600 baud
```

If your hardware uses a different serial device or baud rate, edit:

```bash
entrypoint.sh
```

---

## Run the Container

You must expose the serial device to the container.

Example:

```bash
docker run --rm -itd \
  --privileged \
  --ipc=host \
  --network=host \
  --group-add keep-groups \
  device=/dev/ttyAMA2:/dev/ttyAMA2 \
  ghcr.io/raspi-drone/mavlink-bridge:latest
```

---

## ROS 2 Environment

The container uses:

| Variable | Value |
|----------|-------|
| `ROS_DOMAIN_ID` | `42` |
| `RMW_IMPLEMENTATION` | `rmw_cyclonedds_cpp` |

These are configured in the Dockerfile.

---

## Networking Notes

This project currently uses:

```bash
ipc=host 
network=host 
```

to simplify DDS discovery and ROS 2 communication.

For multi-machine ROS 2 deployments, ensure:

- Matching `ROS_DOMAIN_ID`
- DDS multicast allowed on the network
- Compatible middleware configuration

---

## Future Improvements

Potential additions:

- Podman Compose support
- UDP MAVLink bridge mode
- Auto-detection of serial ports
- ROS 2 launch files
- Parameterized FCU URLs via environment variables
