#!/bin/bash

echo "🚀 ROS 2 dev container iniciado"

# Source ROS base
source /opt/ros/$ROS_DISTRO/setup.bash

# Source workspace (se existir)
if [ -f /home/ws/install/setup.bash ]; then
  source /home/ws/install/setup.bash
fi

echo "🔎 Verificando bibliotecas..."

# Função para testar import
check_import() {
    MODULE=$1
    python3 -c "import $MODULE" 2>/dev/null
    if [ $? -eq 0 ]; then
        echo "✅ $MODULE OK"
    else
        echo "❌ $MODULE NÃO ENCONTRADO"
    fi
}

# Liste aqui todas suas libs importantes
check_import rclpy
check_import PySide6
check_import cv2
check_import numpy

echo "🎯 Ambiente pronto."
