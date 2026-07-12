#import "../../../common.typ": *

=== Checking Connectivity

Before touching any network settings, connect the Raspberry Pi to your computer via Ethernet and confirm it's reachable on the local network:
```bash
ping -c 4 raspberrypi.local
```

A successful ping means the Pi is on the network and answering *mDNS* _(multicast DNS)_ requests. If it doesn't respond, double-check the Ethernet cable and connection.

---

#info[Create a new connection profile of type Ethernet on the physical interface enp4s0. The PC will act as a DHCP server and automatically assign an IP address to any device connected via Ethernet (the Pi), while also enabling NAT to share the laptop's internet connection.
  ```bash
  nmcli connection add type ethernet ifname enp4s0 con-name "rpi-share" ipv4.method shared
  ```
  Activate and inspect the connection
  ```bash
  nmcli connection up "rpi-share"
  nmcli connection show "rpi-share"
  ```
  Perform a ping sweep across all 254 addresses, without port scanning
  ```bash
  nmap -sn 10.42.0.0/24
  ```
]

---

=== Wi-Fi Configuration

On the Raspberry Pi itself, `nmcli` (the NetworkManager command-line tool) is what you'll use to set up Wi-Fi.

Start by listing the networks the Pi can see, to confirm your network shows up:
```bash
nmcli dev wifi list
```

Then join a network:
```bash
sudo nmcli dev wifi connect "SSID_NAME" password "WIFI_PASSWORD"
```

Swap in your own network name for `SSID_NAME` and its password for `WIFI_PASSWORD`. `sudo` is needed here since changing Wi-Fi settings requires elevated privileges.

---

#warning[Make sure your machine is connected to the same network as the Pi. Once Wi-Fi is configured, you can remove the Ethernet cable while staying connected to the Raspberry Pi terminal. If you disconnect before this step, you will lose connectivity and must reconnect via Ethernet to fix the Wi-Fi configuration.]

---

=== Packages Installation

Before installing anything, it's worth updating the local package index and applying any pending upgrades:
```bash
sudo apt update  # refresh the package list
sudo apt full-upgrade  # upgrade packages, handling dependency changes
```

`full-upgrade` is the better choice over plain `upgrade` since it can add or drop packages as needed to satisfy updated dependencies.

Installing a given package is then just:
```bash
sudo apt install <package_name>
```
