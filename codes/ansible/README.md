# Ansible Playbooks

Fleet automation for the Raspberry Pi nodes.

## Contents

| File | Purpose |
|---|---|
| `inventory.ini` | `[pis]` group (`pi1`–`pi6`), SSH user/key |
| `deploy-pi-cam.yml` | Installs deps, syncs `pi-cam`, sets up `uv`, exports YOLO11 to ONNX, installs systemd service |
| `deploy-node-exporter.yml` | Installs Prometheus Node Exporter (arm64) as systemd service |
| `pi-cam.service.j2` | systemd unit template for `pi-cam` |
| `node-exporter.service.j2` | systemd unit template for `node_exporter` |

## Usage

```bash
ansible-playbook -i inventory.ini deploy-pi-cam.yml
ansible-playbook -i inventory.ini deploy-node-exporter.yml
```

> [!IMPORTANT]
> Targets Raspberry Pi 4/5 (aarch64) running Raspberry Pi OS Lite.
> Requires SSH key access to each Pi.
