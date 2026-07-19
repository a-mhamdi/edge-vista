#import "../common.typ": *

= Raspberry Pi

#hl[#text(weight: "bold")[What is Raspberry Pi]]

The Raspberry Pi is a *low-cost* single-board computer rather than an operating system itself. It has become a go-to platform for running Linux-based embedded systems, and it shows up constantly in IoT projects, home automation setups, classrooms, and quick prototypes. The board was created by the Raspberry Pi Foundation (today Raspberry Pi Ltd.) with computer science education as its founding mission.

Its default operating system is *Raspberry Pi OS* (known as Raspbian prior to May 2020). Built on the Debian Linux distribution, it relies on the
`apt` _(Advanced Package Tool)_ package manager for software installation.

#align(center)[#image("../assets/rpi-5.png", width: 65%)] \
#footer[#link("https://commons.wikimedia.org/wiki/File:RaspberryPi_5B.svg")[Wikipedia Commons]]

#hl[#text(weight: "bold")[Why Use Raspberry Pi]]

The Raspberry Pi is a favorite among newcomers thanks to its low price, extensive documentation, and large user base. Since it ships with a familiar Debian-based environment, getting comfortable with Linux is straightforward. At the same time, it works just as well for experienced users who want to build custom hardware, host home servers, or tinker with electronics through its 40-pin GPIO header.

== Connectivity and Network Configuration
#title-slide("Connectivity", "Testing and Setting Up Network")
#include "subparts/rpi/connectivity.typ"

== SSH Setup
#title-slide("SSH", "Secure Shell Configuration")
#include "subparts/rpi/ssh.typ"

== Git and GitHub
#title-slide("Git and GitHub", "Version Control and Collaboration")
#include "subparts/rpi/git-github.typ"

== Observability
#title-slide("Observability", "Monitoring and Logging")
#include "subparts/rpi/observability.typ"

== Mosquitto
#title-slide("Mosquitto", "Installation, Configuration, Authentification and Testing")
#include "subparts/rpi/mosquitto.typ"

== Node-Red
#title-slide("Node-Red", "Installation, Configuration, Running and Security")
#include "subparts/rpi/nodered.typ"

== InfluxDB
#title-slide("InfluxDB", "Installation, Configuration, and Monitoring")
#include "subparts/rpi/influxdb.typ"
