#import "../../../common.typ": *

=== Overview

- Node-RED provides an official install script for Raspberry Pi and any Debian-based OS
- The script installs Node.js, npm, and Node-RED in one step
- Same script also handles *upgrades* of an existing install
- Node-RED can run as a foreground *process* or as a background *service*

---

=== Installation or Upgrade

/*
- Raspberry Pi running Raspberry Pi OS (Debian-based) — or Ubuntu / DietPi
- Internet connection (script downloads Node.js + npm packages)
- Terminal access (SSH or local)
// - *Note:* as of Node.js v24, there are no 32-bit builds — 32-bit armv6 Pi devices are no longer supported
*/

Run this first so npm can build native modules
```bash
sudo apt install build-essential git curl
```

Download and run the official install/update script:
```bash
bash <(curl -sL https://github.com/node-red/linux-installers/releases/latest/download/install-update-nodered-deb)
```

---

#topic[What it actually does]

+ Removes any existing Node-RED installation
+ Checks Node.js version — installs it if missing or below v20 _(defaults to Node.js v22 LTS via NodeSource)_
+ Installs the latest Node-RED via npm
+ Optionally installs useful Pi-specific nodes
+ Configures Node-RED to run as a *systemd service*, with helper commands

---

=== Running Node-RED Locally

Standard command, runs in the foreground:
```bash
node-red
```
Stop with `Ctrl-C` or by closing the terminal
#warning[The Pi has limited memory, use the Pi-optimized launcher to free memory sooner:
  ```bash
  node-red-pi --max-old-space-size=256
  ```
]

---

=== Running as a Service

The install script sets Node-RED up as a background service, with these helper commands:
#v(0.5em)
/ `node-red-start`: starts the service, shows log output _(`Ctrl-C` detaches, does *not* stop it)_
/ `node-red-stop`: stops the service
/ `node-red-restart`: restarts the service
/ `node-red-reload`: stops then starts the service
/ `node-red-log`: re-attach to view live logs

---

#topic[Autostart on boot]

```bash
sudo systemctl enable nodered.service
```
#text(size: 16pt, fill: ink.lighten(20%))[Disable with: `sudo systemctl disable nodered.service`]

#topic[Opening the Editor]

- On the Pi desktop browser: #text(fill: teal-color)[`http://localhost:1880`]
- From another machine: browse on the network `http://<hostname>:1880`

#v(1.5em)

#text(size: 16pt, fill: ink.lighten(20%))[
  - Find the Pi's IP address with:
]
```bash
hostname -I
```

---

#hl[My Recommendation]

#star Run Node-RED in *Docker*, not as a native install on the Raspberry Pi.

#v(0.5em)

#line(length: 100%, stroke: 1pt + teal-color)

#v(0.5em)

#text(fill: teal-color, weight: "bold")[Important nuance]

The Docker host is *the laptop*, not the RPi itself. Node-RED talks to the RPi (and to ESP32 nodes) over the network _(MQTT, HTTP, WebSocket)_ not through local GPIO/I2C/SPI access.

---

#topic[Why Docker makes sense here]

- *Reproducibility* // image is version-pinned, no "which Node.js did the install script pull" surprises
- *Clean upgrades / rollbacks* // pull a new tag, restart --- no npm global package juggling  - Laptop hosts Node-RED, reachable over the local  - *Explicit persistence*: bind-mount `/data`, flows/credentials/nodes survive container recreation network
- *Consistent stack* // same mental model as Mosquitto and Prometheus/Grafana --- everything is a container
- *No hardware-access tradeoff* // since Docker runs on the laptop, the usual "GPIO needs `--device` flags" caveat simply doesn't apply --- Node-RED never touches the RPi's pins directly

#important[
  - RPi stays lean: runs only what genuinely needs to be on-device _(sensors, Mosquitto broker,  exporters)_
  - Laptop hosts Node-RED, reachable over the local network.
]
