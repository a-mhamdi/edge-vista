import marimo

__generated_with = "0.23.13"
app = marimo.App()


@app.cell(hide_code=True)
def _(mo):
    mo.md(r"""
    # Anomaly Detection Using FFT
    """)
    return


@app.cell
def _():
    import numpy as np
    import matplotlib.pyplot as plt

    return np, plt


@app.cell
def _(plt):
    plt.style.use('ggplot')  # Using built-in ggplot style
    plt.rcParams['figure.figsize'] = [8, 8]
    return


@app.cell
def _():
    from utils.signals import baseline, anomaly

    return anomaly, baseline


@app.cell(hide_code=True)
def _(mo):
    mo.md(r"""
    ## Synthetic Signals
    """)
    return


@app.cell
def _():
    fs = 1000.0
    N = 2**8
    return N, fs


@app.cell(hide_code=True)
def _(mo):
    mo.md(r"""
    ### Baseline Signal
    """)
    return


@app.cell
def _(N, baseline, fs):
    t, x_ref = baseline(fs, N)
    return t, x_ref


@app.cell(hide_code=True)
def _(mo):
    mo.md(r"""
    ### Anomaly: Rogue Tone
    """)
    return


@app.cell
def _():
    f_anom = 180  # NOT part of the expected model
    a_anom = 0.8
    return a_anom, f_anom


@app.cell
def _(a_anom, anomaly, f_anom, t):
    x_anom = anomaly(t, f_anom, a_anom)
    return (x_anom,)


@app.cell
def _(x_anom, x_ref):
    x_obs = x_ref + x_anom
    return (x_obs,)


@app.cell(hide_code=True)
def _(mo):
    mo.md(r"""
    ## FFT of Observed and Reference Signals
    """)
    return


@app.cell
def _(N, np):
    def mag_fft(x, N=N):
        X = np.fft.rfft(x)
        mag = np.abs(X) / N
        mag[1:-1] *= 2
        return mag

    return (mag_fft,)


@app.cell
def _(N, fs, np):
    freqs = np.fft.rfftfreq(N, d=1/fs)
    return (freqs,)


@app.cell
def _(mag_fft, x_obs, x_ref):
    mag_obs = mag_fft(x_obs)
    mag_ref = mag_fft(x_ref)
    return mag_obs, mag_ref


@app.cell(hide_code=True)
def _(mo):
    mo.md(r"""
    ### Residual Spectrum
    """)
    return


@app.cell
def _(mag_obs, mag_ref):
    residual_fft = mag_obs - mag_ref
    return (residual_fft,)


@app.cell(hide_code=True)
def _(mo):
    mo.md(r"""
    ### Threshold on Residual
    """)
    return


@app.cell
def _(mo):
    threshold_fft = mo.ui.slider(start=1e-2, stop=1, step=0.1)
    threshold_fft
    return (threshold_fft,)


@app.cell
def _(freqs, np, residual_fft, threshold_fft):
    anomaly_idx_fft = np.where(residual_fft > threshold_fft.value)[0]

    print("Anomalous frequencies (Hz):", np.round(freqs[anomaly_idx_fft], 1))
    return (anomaly_idx_fft,)


@app.cell(hide_code=True)
def _(mo):
    mo.md(r"""
    ## Plots
    """)
    return


@app.cell
def _(
    anomaly_idx_fft,
    freqs,
    mag_obs,
    mag_ref,
    plt,
    residual_fft,
    threshold_fft,
):
    fig, axs = plt.subplots(2, 1, sharex=True)

    axs[0].plot(freqs, mag_obs, label="Observed")
    axs[0].plot(freqs, mag_ref, label="Reference (expected)", linestyle="--")
    axs[0].scatter(freqs[anomaly_idx_fft], mag_obs[anomaly_idx_fft], color="red", zorder=5, label="Anomaly")
    axs[0].set_ylabel("Amplitude")
    axs[0].set_title("FFT: Observed vs Reference")
    axs[0].legend()

    axs[1].plot(freqs, residual_fft, color="darkorange", label="Residual")
    axs[1].axhline(threshold_fft.value, color="gray", linestyle="--", label="Threshold")
    axs[1].scatter(freqs[anomaly_idx_fft], residual_fft[anomaly_idx_fft], color="red", zorder=5)
    axs[1].set_xlabel("Frequency (Hz)")
    axs[1].set_ylabel("Residual")
    axs[1].set_title("Residual Spectrum (Observed − Reference)")
    axs[1].legend()

    plt.tight_layout()
    plt.show()
    return


@app.cell
def _():
    import marimo as mo

    return (mo,)


if __name__ == "__main__":
    app.run()
