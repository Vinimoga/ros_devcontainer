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

### Important

* The root directory (/home/ws) is the ROS 2 workspace.

* ROS 2 will only detect packages inside the src/ folder.

* All builds must be executed from /home/ws.

---

## Getting Started

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

Then:

  1. Press Ctrl + shift + p
  2. Press `Dev Containers: Reopen in Container`

The container will be built automatically.

---

### Create a ROS 2 package (Python)

Inside the container:

```bash
cd /home/ws
ros2 pkg create YOUR_PACKAGE \
  --build-type ament_python \
  --dependencies rclpy std_msgs
```

This creates a standard ROS 2 Python package inside `src`.

---

### Build the Workspace

```bash
cd /home/ws
colcon build
source install/setup.bash
```

#### Development Mode (Recommended)

```bash
colcon build --symlink-install
```

This allows you to modify Python files without rebuilding every time.

---

### Run your Node

If your package contains:

```bash
src/YOUR_PACKAGE/YOUR_PACKAGE/main.py
```

And your setup.py includes:

```python
entry_points={
    'console_scripts': [
        'main = YOUR_PACKAGE.main:main',
    ],
}
```

You can run your node using:

```bash
ros2 run YOUR_PACKAGE main
```

---

### Launching with a Launch File

If you create:

```bash
launch/system.launch.py
```

You can start your application with:

```bash
ros2 launch your_package_name system.launch.py
```

---

### ROS environment (automatic)

The container automatically sources the ROS environment on startup:

```bash
source /opt/ros/$ROS_DISTRO/setup.bash
```

## Using this repository as a template

If you cloned this repository and want to push to your own remote, fork this enviroment
or update the Git remote:

```bash
git remote set-url origin git@github.com:YOUR_USER/YOUR_REPO.git
