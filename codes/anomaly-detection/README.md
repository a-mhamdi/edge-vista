# FFT / PSD Anomaly Detection

Spectral analysis of a synthetic multi-tone signal, built up incrementally: FFT magnitude, power spectrum, PSD, and residual-based anomaly detection.

## Contents

1. **Baseline signal** — sum of three sinewaves (`f1=50`, `f2=120`, `f3=200` Hz) plus Gaussian noise.
2. **FFT magnitude** — single-sided amplitude spectrum via `np.fft.rfft`.
3. **Power spectrum** — `|X|^2`, one-sided, energy-conserving scaling.
4. **PSD (periodogram)** — power divided by frequency resolution (`Δf = fs/N`), no averaging.
5. **Anomaly injection** — extra rogue anomalous tone.
6. **FFT-based anomaly detection (residual)** — observed vs. reference spectrum, thresholded on the residual.
7. **Welch PSD residual** — same residual-comparison approach, but using `scipy.signal.welch` for smoother, averaged PSD estimates.
8. **Documented helper functions** — `baseline(fs, N)` and `anomaly(t, f_anom, a_anom)` with docstrings.

> [!NOTE]
> The FFT-domain residual uses full frequency resolution (`Δf ≈ fs/N`), while the Welch PSD residual trades resolution for lower variance (`Δf ≈ fs/nperseg`). Both are valid; choice depends on whether you need fine frequency localization or noise robustness.

> [!IMPORTANT]
> All code in this repo is written to run with **uv** and **marimo** notebooks — not plain scripts or Jupyter. Do not `pip install` manually; use `uv` for environment/dependency management.

## Running the notebooks

```bash
# install uv if not already available
curl -LsSf https://astral.sh/uv/install.sh | sh

# run a marimo notebook with uv-managed dependencies
uv run marimo edit notebook.py
```

> [!TIP]
> Use `uv run marimo run notebook.py` instead of `edit` if you just want to execute the notebook non-interactively _(e.g., in CI)_.

## Reference frequencies 

| Symbol | Frequency (Hz) | Amplitude | Role |
|--------|-----------------|-----------|------|
| f1 | 50 | 1.0 | Baseline |
| f2 | 120 | 0.5 | Baseline |
| f3 | 200 | 0.3 | Baseline |
| f_anom | 180 | 0.8 | Injected anomaly |
