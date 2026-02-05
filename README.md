# ROS 2 DevContainer – Starter Kit

This repository provides a **minimal and portable ROS 2 development
environment** using **Docker and VS Code Dev Containers**.

It allows you to start developing ROS 2 applications without installing
ROS 2 directly on your host system.

---

## Requirements

* Docker
* Docker Compose (usually included with Docker)
* Visual Studio Code
* **Dev Containers** extension for VS Code

No ROS 2 installation is required on the host machine.

---

## 📁 Repository Structure

```
.
├── .devcontainer/
│   ├── Dockerfile
│   ├── devcontainer.json
│   └── post_start.sh
├── src/
│   └── (your ROS 2 packages go here)
├── .gitignore
└── README.md
```

The root directory (`/home/ws`) is the **ROS 2 workspace**.
ROS 2 will **only detect packages** located inside the `src/` directory.

---

## Usage

### Clone the repository

```bash
git clone https://github.com/Vinimoga/ros_devcontainer.git
cd ros_devcontainer
```

---

### Open in VS Code

```bash
code .
```

Click the green button in the bottom-left corner and select:

> **“Reopen in Container”**

The container will be built automatically.

---

### Create a ROS 2 package (Python example)

Inside the container:

```bash
cd /home/ws/src

ros2 pkg create YOUR_PACKAGE \
  --build-type ament_python \
  --dependencies rclpy std_msgs
```

This creates a standard ROS 2 Python package.

---

### Build the workspace

```bash
cd /home/ws
colcon build
```

---

### ROS environment (automatic)

The container automatically sources the ROS environment on startup:

```bash
source /opt/ros/$ROS_DISTRO/setup.bash
source /home/ws/install/setup.bash
```

## Using this repository as a template

If you cloned this repository and want to push to your own remote, update
the Git remote:

```bash
git remote set-url origin git@github.com:YOUR_USER/YOUR_REPO.git
