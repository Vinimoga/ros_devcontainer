# ROS 2 DevContainer – Starter Kit

Este repositório fornece um **ambiente mínimo e portátil de desenvolvimento ROS 2**
usando **Docker + VS Code DevContainer**.
---

## Requisitos

- Docker
- Docker Compose (normalmente já vem com Docker)
- Visual Studio Code
- Extensão **Dev Containers** do VS Code

Nenhuma instalação de ROS 2 é necessária no host.

---

## 📁 Estrutura do repositório

```
.
├── .devcontainer/
│   ├── Dockerfile
│   ├── devcontainer.json
│   └── post_start.sh
├── src/
│   └── (seus pacotes ROS 2 ficam aqui)
├── .gitignore
└── README.md
````

O diretório raiz (`/home/ws`) é o **workspace ROS 2**   
O ROS 2 **só enxerga** o que está dentro da pasta `src/`

---

## Como usar

### Clonar o repositório

```bash
git clone https://github.com/Vinimoga/ros_devcontainer.git
cd ros_devcontainer
````

---

### Abrir no VS Code

```bash
code .
```

Clique no canto inferior esquerdo e aperte em:

> **“Reopen in Container?”**

O container será construído automaticamente.

---

### Criar um pacote ROS 2 (exemplo em Python)

Dentro do container:

```bash
cd /home/ws/src

ros2 pkg create YOUR_PACKAGE \
  --build-type ament_python \
  --dependencies rclpy std_msgs
```

Isso cria um pacote ROS 2 padrão em Python.

---

### Build do workspace

```bash
cd /home/ws
colcon build
```

---

### Ambiente ROS (já feito automaticamente)

O container já executa no startup:

```bash
source /opt/ros/$ROS_DISTRO/setup.bash
source /home/ws/install/setup.bash
```