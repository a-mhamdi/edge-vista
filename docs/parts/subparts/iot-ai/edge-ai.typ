#import "../../../common.typ": *

== Edge AI
#title-slide("Demystifying AI Sorcery", "Running ML Models on the Edge")

=== Demystifying AI Sorcery

#quotebox[
  AI is a branch of computer science which focuses on automation of intelligent behavior.
]

#v(20pt)

#uncover(1)[
  #align(center)[
    #text(fill: teal-color, style: "italic")[
      Some definitions can be categorized into four frames.
    ]
  ]
]

---

#titlebar[Systems that think like humans]
#v(20pt)

#quotebox(title: [Bellman, 1978])[
  "[The automation of] activities that we associate with human thinking, activities such as decision-making, problem-solving, learning..."
]
#v(4pt)
#bibline[
  Bellman, R. E. — #text(style: "italic")[An Introduction to Artificial Intelligence: Can Computers Think?] — Boyd \& Fraser Publishing Company.
]

#sepline()

#quotebox(title: [Haugeland, 1989])[
  "The exciting new effort to make computers think[...] #text(style: "italic")[machines with minds], in the full and literal sense"
]
#v(4pt)
#bibline[
  Haugeland, J. (1989). #text(style: "italic")[Artificial Intelligence: The Very Idea]. A Bradford book. MIT Press.
]
#sepline()

---

#slide[
  #titlebar[Systems that think rationally]
  #v(20pt)

  #quotebox(title: [Charniak et al., 1985])[
    "The study of mental faculties through the use of computational models."
  ]
  #v(4pt)
  #bibline[
    Charniak, E., McDermott, D., and McDermott, D. V. (1985). #text(style: "italic")[Introduction to Artificial Intelligence]. Addison-Wesley series in computer science and information processing. Addison-Wesley.
  ]

  #sepline()

  #quotebox(title: [Winston, 1992])[
    "The study of the computations that make it possible to perceive, reason, and act."
  ]
  #v(4pt)
  #bibline[
    Winston, P. H. (1992). #text(style: "italic")[Artificial Intelligence]. A-W Series in Computer Science. Addison-Wesley Publishing Company.
  ]
  #sepline()
]

#slide[
  #titlebar[Systems that act like humans]
  #v(20pt)

  #quotebox(title: [Kurzweil, 1992])[
    "The art of creating machines that perform functions that require intelligence when performed by people."
  ]
  #v(4pt)
  #bibline[
    Kurzweil, R. (1992). #text(style: "italic")[The Age of Intelligent Machines]. Viking.
  ]

  #sepline()

  #quotebox(title: [Rich and Knight, 1991])[
    "The study of how to make computers do things at which, at the moment, people are better."
  ]
  #v(4pt)
  #bibline[
    Rich, E. and Knight, K. (1991). #text(style: "italic")[Artificial Intelligence]. Artificial Intelligence Series. McGraw-Hill.
  ]
  #sepline()
]

#slide[
  #titlebar[Systems that act rationally]
  #v(20pt)

  #quotebox(title: [Schalkoff, 1990])[
    "A field of study that seeks to explain and emulate intelligent behavior in terms of computational processes."
  ]
  #v(4pt)
  #bibline[
    Schalkoff, R. J. (1990). #text(style: "italic")[Artificial Intelligence: An Engineering Approach]. McGraw-Hill Computer science series. McGraw-Hill.
  ]

  #sepline()

  #quotebox(title: [Luger and Stubblefield])[
    "The branch of computer science that is concerned with the automation of intelligent behavior."
  ]
  #v(4pt)
  #bibline[
    Luger, G. F. and Stubblefield, W. A. #text(style: "italic")[Artificial Intelligence: Structures and Strategies for Complex Problem Solving]. Artificial intelligence. Benjamin/Cummings Publishing Company.
  ]
  #sepline()
]

#slide[
  #titlebar[Thought-Provoking Questions]
  #v(30pt)

  #align(center)[
    #block(
      fill: boxbg,
      inset: 10pt,
      radius: 3pt,
    )[
      #text(weight: "bold", size: 15pt)[How to achieve intelligence on a computer system]
    ]
  ]

  #v(30pt)

  #uncover(2)[
    #block(
      fill: rgb("#fbeaea"),
      stroke: (left: 2.5pt + maroon),
      width: 100%,
      inset: 10pt,
      radius: 2pt,
    )[
      #text(fill: maroon, weight: "bold", size: 14pt)[What do we mean by "Intelligence"?]
      #v(6pt)
      #list(
        marker: text(fill: maroon)[▶],
        spacing: 6pt,
        [Single faculty or gathering of abilities],
        [Learned or existing],
        [What happens when we learn],
        [Are creativity and intuition measurable],
        [Does observable behavior infer to intelligence],
        [How knowledge is routed in the human brain],
      )
    ]
  ]
]

#slide[
  #titlebar[Turing Test]
  #v(20pt)

  #quotebox(title: [Alan Turing (1950)])[
    The ability to achieve human level performance in all cognitive tasks, sufficient to fool an interrogator.
  ]
  #sepline()

  #list(
    marker: text(fill: teal-color)[✓],
    spacing: 8pt,
    [Natural Language Processing (NLP) #text(style: "italic")[(Communicate in human language)]],
    [Knowledge Representation #text(style: "italic")[(Store information)]],
    [Automated Reasoning #text(style: "italic")[(Answer questions \& draw conclusions)]],
    [Machine Learning (ML) #text(style: "italic")[(Adapt to new circumstances, detect \& extrapolate patterns)]],
  )
  #sepline()
]

#slide[
  #titlebar[Forms of AI]
  #v(30pt)

  #list(
    marker: text(fill: maroon)[✦],
    spacing: 10pt,
    [Expert Systems #text(style: "italic")[(Based on knowledge or rule settings)]],
    [Fuzzy Systems #text(style: "italic")[(Based on fuzzy set theory)]],
    [Artificial Neural Networks],
    [Genetic Algorithms],
    [Belief Networks],
    [Hybrid Systems #text(style: "italic")[(Combine two or more approaches)]],
  )
]

---

#align(center)[#image("../../../assets/ai-fields.svg", width: 60%)]

---

#text(fill: maroon, size: 21pt, weight: "bold", tracking: 1pt)[Briefing]

#v(2pt)
#line(length: 100%, stroke: 0.4pt + rgb("#dddddd"))
#v(4pt)

#text(weight: "bold")[Arthur Samuel (1959)] \
#underline[Machine Learning:] Field of study that gives computers the ability to learn without being explicitly programmed.

#v(8pt)

#text(weight: "bold")[Tom Mitchell (1998)] \
#underline[Well-posed Learning Problem:] A computer is said to learn from experience $cal(E)$ with respect to some task $cal(T)$ and some performance measure $cal(P)$, if its performance on $cal(T)$, as measured by $cal(P)$, improves with experience $cal(E)$.

---

#text(fill: maroon, weight: "bold")[Task#footnote[Source: Andrew Ng's ML Course, Coursera]] \
Suppose your email program watches which emails you do or do not mark as spam, and based on that learns how to better filter spam. What is the task $cal(T)$ in this setting?

#v(4pt)

#set text(fill: maroon)
#set enum(indent: 24pt, spacing: 5pt)
+ Classifying emails as spam or not spam;
+ Watching you label emails as spam or not spam;
+ The number (or fraction) of emails correctly classified as spam/not spam;
+ None of the above—this not a machine learning problem.

#slide[
  #v(6pt)
  #text(fill: maroon, size: 18pt, weight: "bold", tracking: 1pt)[Learning Paradigms]
  #v(4pt)
  #line(length: 100%, stroke: 0.4pt + rgb("#dddddd"))

  #pad(left: 20pt)[
    #bullet[
      #underline[Supervised Learning] is a machine learning approach where algorithms learn from labeled training data to predict outputs for new inputs. The algorithm is "supervised" by being shown correct answers during training, allowing it to learn the relationship between features and target variables. \
      #v(4pt)
      #tag[e.g., spam filtering, image classification, price prediction.]
    ]

    #bullet[
      #underline[Unsupervised Learning] is a machine learning approach where algorithms find patterns in data without explicit labels or guidance. These algorithms identify inherent structures in data, such as groupings, anomalies, or distribution characteristics. \
      #v(4pt)
      #tag[e.g., clustering, anomaly detection, dimensionality reduction.]
    ]
  ]
]

#slide[
  #topic[Programming Paradigm]
  #align(center)[
    #grid(
      columns: (auto, auto),
      [#image("../../../assets/classical-programming.svg", width: 90%)],
      uncover("2")[#image("../../../assets/ml-paradigm.svg", width: 90%)],
    )]]

#slide[#text(fill: maroon, size: 18pt, weight: "bold", tracking: 1pt)[Terminology]
  #v(4pt)
  #line(length: 100%, stroke: 0.4pt + rgb("#dddddd"))

  // #v(40pt)
  #pad(left: 20pt)[
    #bullet[
      #underline[Dataset] is a structured collection of data organized for analysis or processing. Good datasets often contain diverse, representative examples with clear labels for the information they contain. \
      #v(4pt)
      #tag[e.g., census records, medical images, customer purchases.]
    ]

    #bullet[
      #underline[Feature] is an input variable or an attribute used to make predictions.
    ]

    #bullet[
      #underline[Target] is the output variable the model is trained to predict.
    ]

    #bullet[
      #underline[Model] is an algorithm that learns patterns from data to make predictions or decisions. Models transform inputs into outputs based on parameters that are optimized during training. \
      #v(4pt)
      #tag[e.g., neural networks, decision trees, regression.]
    ]
  ]
]

---

#align(center)[#image("../../../assets/dataset.svg", width: 85%)]

#slide[
  #titlebar[Structured vs. Unstructured Data]

  #grid(
    columns: (1fr, 1fr),
    column-gutter: 1.5em,
    [
      #box(fill: note-color.lighten(88%), stroke: 1pt + note-color, radius: 6pt, inset: 14pt, width: 100%)[
        #text(fill: note-color, weight: "bold", size: 20pt)[Structured Data]
        #v(0.4em)
        - Organized in a fixed schema _(rows / columns)_
        - Lives naturally in tables, spreadsheets, relational DBs
        - Each feature has clear, predefined meaning
      ]
      #example[sensor logs, sales records, patient vitals tables]
    ],
    [#box(fill: accent.lighten(90%), stroke: 1pt + accent, radius: 6pt, inset: 14pt, width: 100%)[
        #text(fill: accent, weight: "bold", size: 20pt)[Unstructured Data]
        #v(0.4em)
        - No fixed schema — raw, high-dimensional signal
        - Text, images, audio, video, free-form sensor streams
        - Meaning is implicit, spatial/sequential relationships matter
      ]
      #example[raw text corpora, camera frames, audio waveforms]
    ],
  )

  #v(1.2em)

  #box(
    fill: rgb("#f5f5f5"),
    stroke: 1pt + inkgray.lighten(40%),
    radius: 6pt,
    inset: 12pt,
    width: 100%,
  )[
    #text(weight: "bold", fill: inkgray)[A common _(but oversimplified)_ rule of thumb:]
    #v(0.3em)
    $star$ Structured data → classical *ML* often suffices, since features are already meaningful. \
    $star$ Unstructured data → *DL* tends to dominate, because it *learns* the feature extraction step _(convolutions, embeddings, attention)_ instead of requiring it by hand.
  ]
  #v(0.4em)
  #important[#text(weight: "bold")[Caveat:] this is a tendency, not a law. Gradient-boosted trees _(XGBoost, LightGBM)_ — still classical ML — often beat deep nets on tabular/structured data. And classical ML *can* touch unstructured data via hand-crafted features _(TF-IDF, HOG/SIFT)_; it's just weaker there without heavy manual engineering.
  ]

]

#align(center)[#image("../../../assets/ann-hist.svg", height: 95%)]

#align(center)[#image("../../../assets/artificial-bio.svg", width: 80%)]
#footer[#link("https://id.wikipedia.org/wiki/Sel_saraf")]

#align(center)[#image("../../../assets/backprop.svg", width: 80%)]
#align(center)[#image("../../../assets/gradient-descent.svg", height: 70%)]

$
  underbrace(cal(W), "New weight")
  eq.delta
  underbrace(cal(W), "Old weight")
  -
  overbrace(eta, "Weighting factor")
  underbrace(
    nabla cal(L)(cal(W)),
    #text[Gradient term is #underline[steepest ascent]]
  )
$

---

#align(center)[#image("../../../assets/learn-mechanism.svg", width: 80%)]

---

#topic[What is Edge AI?]

- Running trained ML models directly *on the device* — microcontroller, embedded board, or gateway, rather than sending data to the cloud for inference.
- The model runs locally; only results (or nothing at all) need to leave the device.
- Distinguishes "smart sensor that decides" from "sensor that just reports."

#align(center)[#image("../../../assets/edge-ai.jpeg", width: 80%)]
#footer("Visual generated by AI")

---

#topic[Why Not Just Use the Cloud?]

- *Latency*: inference happens in milliseconds, no network round trip.
- *Bandwidth*: only send events/results, not raw continuous sensor streams.
- *Connectivity*: works offline or with intermittent network — cloud inference can't.
- *Privacy*: raw data _(e.g. audio, video)_ never leaves the device.
- *Power*: avoiding constant radio transmission often costs less energy than local inference itself.

---

#topic[Hardware Constraints]

- Microcontrollers _(e.g. ESP32)_ typically offer: hundreds of KB–few MB RAM, no GPU, limited flash.
- Models must be small and efficient — this rules out running full-size networks as-is.
- Techniques to fit models on-device:
/ Quantization _(float32 → int8)_: smaller, faster, minor accuracy loss.
/ Pruning: removing redundant weights/connections.

#info[Architectures designed for constrained devices _(e.g. MobileNet-style, small CNNs, simple DSP + classical ML)_.]

---

#topic[Common Tooling]

- *TensorFlow Lite*: runtime for running quantized models on MCUs, no OS required.
- *Edge Impulse*: end-to-end platform — data collection, training, and optimized deployment.
- *CMSIS-NN*: optimized neural network kernels for ARM Cortex-M cores.

#info[#text(weight: "bold", fill: teal-color)[Common thread:] model built/trained off-device, exported to a compact runtime that runs on the target hardware.]

---

#topic[Typical Pipeline]

- *Sense*: sensor on the device _(e.g. microphone, accelerometer, camera)_ captures a raw signal.
- *Extract*: on-device preprocessing _(DSP features, resizing, normalization)_.
- *Infer*: quantized model runs locally, produces a classification or value.
- *Act*: device responds directly#footnote(text(fill: black)[Optionally reports the result upstream via MQTT/HTTP]) _(e.g. trigger alert, actuate hardware)_.

#warning[Edge AI is not a silver bullet — it is a tradeoff between model complexity, accuracy, and device constraints. Some tasks may still require cloud inference.]

---

#topic[Edge AI vs Embedded AI vs TinyML vs Cloud AI]

#{
  set text(size: 14pt)
  table(
    columns: (auto, auto, auto, auto, auto),
    align: (left, left, left, left, left),
    stroke: 0.5pt + gray,
    inset: 6pt,

    [#text(weight: "bold")[Criterion]],
    [#text(weight: "bold")[Edge AI]],
    [#text(weight: "bold")[Embedded AI]],
    [#text(weight: "bold")[TinyML]],
    [#text(weight: "bold")[Cloud AI]],

    text(weight: "bold")[Inference location],
    [Local device / gateway, near data source],
    [Directly on the target hardware itself],
    [On MCU, no OS],
    [Remote data center],

    text(weight: "bold")[Typical hardware],
    [Raspberry Pi, Jetson, edge servers],
    [MCUs, SoCs, FPGAs — purpose-built],
    [Cortex-M, ESP32, \~KB–MB RAM],
    [GPU/TPU clusters],

    text(weight: "bold")[Model size],
    [Small–medium (MB)],
    [Small–medium, hardware-constrained],
    [Tiny (KB), quantized/pruned],
    [Large, unconstrained],

    text(weight: "bold")[Latency],
    [Low (ms), no round-trip],
    [Very low, deterministic],
    [Very low, real-time],
    [High, network-dependent],

    text(weight: "bold")[Connectivity],
    [Occasional / optional],
    [Often none required],
    [Usually none required],
    [Constant, required],

    text(weight: "bold")[Power budget],
    [Watts],
    [mW–W depending on target],
    [µW–mW, battery/energy-harvested],
    [Not a constraint],

    text(weight: "bold")[Typical use case],
    [Smart cameras, local analytics],
    [Motor control, sensor fusion, robotics],
    [Wake-word, anomaly detection, gesture],
    [Training, large-scale batch inference],
  )

  [The four terms differ mainly in *where* inference runs and *how constrained* the hardware is — not in the underlying ML/DL techniques.]
}

---

=== Computer Vision

#text(fill: inkgray)[
  *Computer vision* is the field of AI that lets machines interpret images and video — turning raw pixels into meaningful understanding. Most of it builds on three progressively more precise tasks.
]

#v(0.8em)
#grid(
  columns: (1fr, 1fr, 1fr),
  column-gutter: 0.9em,
  box(
    fill: teal.lighten(90%),
    stroke: 1pt + teal,
    radius: 6pt,
    inset: 12pt,
    width: 100%,
  )[
    #text(fill: teal, weight: "bold")[1. Classification]
    #v(0.3em)
    #text(size: 14pt)[*What* is in the image? One label for the
      whole picture.]
  ],
  box(
    fill: teal.lighten(75%),
    stroke: 1pt + teal,
    radius: 6pt,
    inset: 12pt,
    width: 100%,
  )[
    #text(fill: teal.darken(20%), weight: "bold")[2. Object Detection]
    #v(0.3em)
    #text(size: 14pt)[*What* + *where*? A label and a bounding box
      per object.]
  ],
  box(
    fill: maroon.lighten(85%),
    stroke: 1pt + maroon,
    radius: 6pt,
    inset: 12pt,
    width: 100%,
  )[
    #text(fill: maroon, weight: "bold")[3. Segmentation]
    #v(0.3em)
    #text(size: 14pt)[*Exact shape*: a label for every pixel, not
      just a box.]
  ],
)

#v(0.7em)
#align(center)[
  #text(fill: inkgray.lighten(20%), style: "italic", size: 15pt)[
    classification  →  detection  →  segmentation
  ]
  #v(0.1em)
  #text(fill: inkgray.lighten(20%), style: "italic", size: 13pt)[
    each step keeps the previous question and adds a more precise one
  ]
]

#v(0.6em)
#notebox[][
  Same underlying visual features, increasingly demanding output: a single tag, a box, or a precise pixel mask.
]

/*
#slide[
#titlebar[Comparing the Three Tasks]

#table(
columns: (1.1fr, 1.3fr, 1fr, 1.6fr),
stroke: 0.5pt + inkgray.lighten(60%),
inset: 8pt,
fill: (col, row) => if row == 0 { teal.lighten(80%) } else { white },
[*Task*], [*Output*], [*Granularity*], [*Example*],
[Classification], [Single label per image], [Coarse], [ "cat" tag on a whole photo ],
[Object Detection], [Label + bounding box per object], [Medium], [ boxes around each cat and dog (e.g. YOLO) ],
[Segmentation], [Label per pixel], [Fine], [ exact outline of every cat and dog ],
)

#v(0.7em)
#text(fill: teal, weight: "bold", size: 16pt)[A quick note on segmentation]
#v(0.3em)
- *Semantic segmentation* — every pixel gets a class label, but
same-class objects aren't distinguished from each other
- *Instance segmentation* — like semantic, but each individual
object also gets its own separate mask
]
*/

---

==== Edge Impulse

#topic[Overview]

- Cloud platform for building ML models targeting embedded / edge hardware (TinyML).
- Covers the full pipeline: data collection → signal processing → model training → deployment as optimized C++/library code.
- Supports common edge targets directly: ESP32, Arduino, Raspberry Pi, Cortex-M boards.

#align(center)[#image("../../../assets/edge-impulse.png", width: 80%)]
#footer[Visual generated by AI.]

---

#topic[Data Acquisition]

- Data collected via:
- Edge Impulse mobile app _(phone sensors)_
- Data forwarder _(serial, from a connected board)_
- Direct upload _(CSV, WAV, images)_
- Each sample is labeled and split into *training* / *testing* sets.
- For sensor data _(e.g. accelerometer, microphone, potentiometer)_:
- fixed-length windows,
- defined sample rate.

---

#align(center)[#image("../../../assets/ml-workflow.svg", height: 90%)]

---

#topic[Impulse Design]

An *impulse* is the processing + learning pipeline:
- *Input block*: raw signal window _(time series, image, audio)_
- *DSP block*: feature extraction _(e.g. spectral features, MFCC, raw)_
- *Learning block*: neural network / classifier trained on extracted features
- Each block is configurable and can be previewed before training.

---

#topic[Training & Evaluation]

- Model trained directly in-browser (or via API) on the labeled dataset.
- Confusion matrix and accuracy reported per class.
- *EON Tuner*: automated search over DSP/model configurations for a given \
accuracy / latency / memory budget.
- Test on held-out data before deployment.

---

#titlebar[Errors in ML]
#align(center)[#image("../../../assets/errors.svg", height: 70%)]

---

#titlebar[Bias vs. Variance (1/2)]
#align(center)[#image("../../../assets/bias-var-1.svg", height: 85%)]

#slide[
  #titlebar[Bias vs. Variance (2/2)]
  #align(center)[
    #grid(
      columns: (auto, auto),
      image("../../../assets/bias-var-2.svg", width: 95%),
      uncover("2")[#image("../../../assets/bias-var-3.svg", width: 95%)],
    )
  ]]

---

#topic[Deployment]

- Exports as:
- Arduino library (`.zip`, drop into `libraries/`)
- C++ SDK (portable, any toolchain)
- Pre-built firmware for supported boards
- Deployment includes both the trained model *and* the matching DSP code — \
ensures identical feature extraction on-device as during training.
- Runs fully offline on-device after deployment — no cloud inference call needed.

#url-block("codes/cv/edge-impulse/")

---

==== YOLO on Raspberry PI

#topic[What is YOLO?]

#text(fill: inkgray)[
  *YOLO — "You Only Look Once"* frames object detection as a single regression problem: one forward pass predicts both *where* objects are and *what* they are.
]

#v(0.6em)
#grid(
  columns: (1fr, 1fr),
  column-gutter: 1.2em,
  box(
    fill: eg-green.lighten(88%),
    stroke: 1pt + eg-green,
    radius: 6pt,
    inset: 12pt,
    width: 100%,
  )[
    #text(fill: eg-green, weight: "bold")[One-stage _(YOLO)_]
    #v(0.3em)
    - Single pass over the image
    - Predicts boxes + classes simultaneously
    - Fast, favors real-time / edge use
  ],
  box(
    fill: maroon.lighten(90%),
    stroke: 1pt + maroon,
    radius: 6pt,
    inset: 12pt,
    width: 100%,
  )[
    #text(fill: maroon, weight: "bold")[Two-stage _(R-CNN family)_]
    #v(0.3em)
    - First propose regions, then classify each
    - Generally more accurate, much slower
    - Poor fit for constrained hardware
  ],
)

#v(0.6em)
#notebox[Key idea][
  The whole image is seen once by one network — no separate region-proposal step — which is exactly why *YOLO* scales down reasonably well to edge devices.
]

#slide[
  #topic[YOLO on the Pi: Fit and Friction]

  #text(fill: maroon, weight: "bold", size: 17pt)[Why it's a reasonable fit]
  #v(0.3em)
  - Single-pass design keeps compute lower than two-stage detectors
  - Small "nano"/"tiny" variants exist specifically for constrained devices
  - Good enough for demo-scale, low-frame-rate detection tasks

  #v(0.8em)
  #text(fill: maroon, weight: "bold", size: 17pt)[Where it strains]
  #v(0.3em)
  - RPi CPU has no dedicated tensor/GPU acceleration by default
  - Full-size YOLO models will run — just slowly _(well under 1 FPS is common without optimization)_
  - Thermal throttling under sustained inference load
  - Camera I/O + preprocessing also compete for the same CPU budget

  #v(0.6em)
  #notebox[Takeaway][
    On a Pi, the model choice and export format matter far more than they would on a desktop GPU.
  ]
]

#slide[
  #topic[Choosing a Model & Export Format]

  #table(
    columns: (1.2fr, 1fr, 0.8fr, 1.5fr),
    stroke: 0.5pt + gray,
    inset: 8pt,
    text(weight: "bold")[Variant],
    text(weight: "bold")[Size],
    text(weight: "bold")[Accuracy],
    text(weight: "bold")[Best for],

    [Nano _(e.g. n)_], [Smallest], [Lowest], [Real-time on Pi CPU],
    [Small _(e.g. s)_], [Small], [Moderate], [Pi + accelerator],
    [Medium / Large], [Large], [Highest], [Desktop / server GPU, not Pi],
  )

  #v(0.6em)
  #text(fill: teal, weight: "bold", size: 17pt)[Export format matters as much as size]
  #v(0.3em)
  - *ONNX* — portable, widely supported runtime
  - *NCNN* — optimized for ARM CPUs, a strong default for RPi
  - *TFLite* _(+ quantization)_ — smaller, faster, small accuracy trade-off
  // - Optional accelerators _(Coral USB, Hailo)_ unlock real-time speeds if the budget allows one

  /*
  #v(0.5em)
  #notebox[Rule of thumb][
  Start nano + quantized + NCNN or TFLite. Only move up in model size once you've confirmed the frame rate is acceptable.
  ]
  */

  #url-block("codes/cv/yolo-pi/")
]
