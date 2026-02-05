#!/bin/bash

echo "🚀 ROS 2 dev container iniciado"

# Fonte do ROS base
source /opt/ros/$ROS_DISTRO/setup.bash

# Fonte do workspace (se existir)
if [ -f /home/ws/install/setup.bash ]; then
  source /home/ws/install/setup.bash
fi