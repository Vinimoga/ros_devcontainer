FROM ros:jazzy

ARG USERNAME=Vinimoga
ARG USER_UID=1000
ARG USER_GID=$USER_UID

RUN if id -u $USER_UID ; then userdel `id -un $USER_UID` ; fi

RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME \
    && apt-get update \
    && apt-get install -y sudo \
    && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME

# Ferramentas essenciais ROS 2
RUN apt-get update && apt-get install -y \
    python3-pip \
    python3-colcon-common-extensions \
    python3-rosdep \
    build-essential \
    ros-jazzy-rviz2 \
    && rm -rf /var/lib/apt/lists/*

RUN rosdep init || true \
    && rosdep fix-permissions

ENV SHELL=/bin/bash

# OpenCV + libs gráficas
RUN apt-get update && apt-get install -y \
    python3-opencv \
    libgl1 \
    libglib2.0-0 \
    libegl1 \
    libxkbcommon-x11-0 \
    libxcb-xinerama0 \
    libxcb-cursor0 \
    v4l-utils \
    && rm -rf /var/lib/apt/lists/*

# PySide6 (corrigido para Ubuntu 24.04)
RUN pip3 install --no-cache-dir --break-system-packages PySide6

RUN apt-get update && apt-get install -y tree

USER $USERNAME

# Source automático do ROS
RUN echo "source /opt/ros/$ROS_DISTRO/setup.bash" >> ~/.bashrc

CMD ["/bin/bash"]
