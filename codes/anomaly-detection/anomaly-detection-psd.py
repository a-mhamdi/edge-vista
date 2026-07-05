import marimo

__generated_with = "0.23.13"
app = marimo.App()


@app.cell(hide_code=True)
def _(mo):
    mo.md(r"""
    # Anomaly Detection Using Welch PSD
    """)
    return


@app.cell
def _():
    import numpy as np
    from scipy.signal import welch
    import matplotlib.pyplot as plt

    return np, plt, welch


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
    t, x_ref =  baseline(fs, N)
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
    ## Welch PSD of Observed and Reference Signals
    """)
    return


@app.cell
def _(fs, welch, x_obs, x_ref):
    nperseg = 128
    f_psd, psd_ref = welch(x_ref, fs=fs, nperseg=nperseg)
    _, psd_obs = welch(x_obs, fs=fs, nperseg=nperseg)
    return f_psd, psd_obs, psd_ref


@app.cell(hide_code=True)
def _(mo):
    mo.md(r"""
    ### Residual PSD
    """)
    return


@app.cell
def _(psd_obs, psd_ref):
    residual_psd = psd_obs - psd_ref
    return (residual_psd,)


@app.cell(hide_code=True)
def _(mo):
    mo.md(r"""
    ### Threshold on Residual
    """)
    return


@app.cell
def _(mo):
    threshold_psd = mo.ui.slider(start=1e-2, stop=1, step=0.1)
    threshold_psd
    return (threshold_psd,)


@app.cell
def _(f_psd, np, residual_psd, threshold_psd):
    anomaly_idx_psd = np.where(residual_psd > threshold_psd.value)[0]

    print("Anomalous frequencies (Hz):", np.round(f_psd[anomaly_idx_psd], 1))
    return (anomaly_idx_psd,)


@app.cell(hide_code=True)
def _(mo):
    mo.md(r"""
    ## Plots
    """)
    return


@app.cell
def _(
    anomaly_idx_psd,
    f_psd,
    plt,
    psd_obs,
    psd_ref,
    residual_psd,
    threshold_psd,
):
    fig, axs = plt.subplots(2, 1, sharex=True)

    axs[0].semilogy(f_psd, psd_obs, label="Observed PSD")
    axs[0].semilogy(f_psd, psd_ref, label="Reference PSD", linestyle="--")
    axs[0].scatter(f_psd[anomaly_idx_psd], psd_obs[anomaly_idx_psd], color="red", zorder=5, label="Anomaly")
    axs[0].set_ylabel("PSD (V²/Hz)")
    axs[0].set_title("Welch PSD: Observed vs Reference")
    axs[0].legend()

    axs[1].plot(f_psd, residual_psd, color="darkorange", label="Residual PSD")
    axs[1].axhline(threshold_psd.value, color="gray", linestyle="--", label="Threshold")
    axs[1].scatter(f_psd[anomaly_idx_psd], residual_psd[anomaly_idx_psd], color="red", zorder=5)
    axs[1].set_xlabel("Frequency (Hz)")
    axs[1].set_ylabel("Residual PSD")
    axs[1].set_title("Residual PSD (Observed − Reference)")
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
