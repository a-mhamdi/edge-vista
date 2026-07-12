#import "../common.typ": *

= Workshop Flow

#slide[

  + #step[Raspberry Pi][Is it healthy?][Node Exporter]
  + #step[Node Exporter][Who remembers it?][Prometheus]
  + #step[Prometheus][How do we see it?][Grafana]
  + #step[Grafana][What about remote devices?][MQTT (Mosquitto)]
  + #step[MQTT][Who orchestrates the flow?][Node-RED]
  + #step[Node-RED][How do we reach one device directly?][ESP32 (HTTP / WS)]
  + #step[ESP32][Can it perceive, not just report?][Edge AI]
  #align(center)[
    #text(fill: maroon, weight: "bold", size: 18pt)[Edge AI]
  ]
  #v(0.3em)
  #grid(
    columns: (1fr, 1fr),
    column-gutter: 1.2em,
    box(
      fill: teal.lighten(88%),
      stroke: 1pt + teal,
      radius: 6pt,
      inset: 10pt,
      width: 100%,
    )[
      #text(fill: teal, weight: "bold")[Edge Impulse]
      #v(0.2em)
      #text(size: 14pt)[ESP32CAM · TinyML on the sensor itself]
    ],
    box(
      fill: maroon.lighten(90%),
      stroke: 1pt + maroon,
      radius: 6pt,
      inset: 10pt,
      width: 100%,
    )[
      #text(fill: maroon, weight: "bold")[YOLO]
      #v(0.2em)
      #text(size: 14pt)[Raspberry Pi · heavier vision, more compute headroom]
    ],
  )
]
