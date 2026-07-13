#import "../../../common.typ": *

#def[InfluxDB is a *time-series database*: every data point is a timestamped measurement, optimized for high-frequency writes and range queries.]

#grid(
  columns: (auto, auto),
  [
    A single point is structured as:

    - *Measurement* — the "table" name \ _(e.g. `sensor_data`)_
    - *Tags* — indexed metadata used for filtering\  _(e.g. `source: manual-ui`)_
    - *Fields* — the actual values \ _(e.g. `temperature`, `humidity`)_
    - *Timestamp* — when the point was recorded
  ],[
    Organizational layers (v2.x):

    - *Organization* — top-level workspace \ _(e.g. `my-org`)_
    - *Bucket* — replaces the old "database + retention policy" pair
    - *Token* — scoped API credential used for read/write access
  ]
)

#notebox[][Tags are indexed and cheap to filter on; fields are not indexed. Put anything you'll filter/group by *(location, source, device id)* in tags, and raw measured values in fields.]

#url-block("codes/influxdb/compose.yml")
