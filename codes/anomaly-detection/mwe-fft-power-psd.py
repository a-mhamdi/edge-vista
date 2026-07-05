import marimo

__generated_with = "0.23.13"
app = marimo.App(width="medium")


@app.cell(hide_code=True)
def _(mo):
    mo.md(r"""
    # MWE (FFT - Power Spectrum - PSD)
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


@app.cell(hide_code=True)
def _(mo):
    mo.md(r"""
    ## Signal setup
    """)
    return


@app.cell
def _(np):
    fs = 1000.0                     # sampling frequency (Hz)
    N = 2048                        # number of samples
    t = np.arange(N) / fs
    return N, fs, t


@app.cell
def _():
    f1, f2, f3 = 50, 120, 200       # component frequencies (Hz)
    a1, a2, a3 = 1.0, 0.5, 0.3      # amplitudes
    return a1, a2, a3, f1, f2, f3


@app.cell
def _(N, a1, a2, a3, f1, f2, f3, np, t):
    x = (a1 * np.sin(2*np.pi*f1*t)
         + a2 * np.sin(2*np.pi*f2*t)
         + a3 * np.sin(2*np.pi*f3*t))
    x += 0.1 * np.random.randn(N)   # optional noise
    return (x,)


@app.cell
def _(plt, t, x):
    plt.plot(t, x)
    plt.title("Noisy Signal")
    plt.xlabel("Time (sec)")
    plt.ylabel("x(t)")
    return


@app.cell(hide_code=True)
def _(mo):
    mo.md(r"""
    ## FFT (magnitude)
    """)
    return


@app.cell
def _(N, fs, np, x):
    X = np.fft.rfft(x)
    freqs = np.fft.rfftfreq(N, d=1/fs)
    mag = np.abs(X) / N * 2         # single-sided amplitude scaling
    return X, freqs, mag


@app.cell(hide_code=True)
def _(mo):
    mo.md(r"""
    ## Power Spectrum
    """)
    return


@app.cell
def _(N, X, np):
    power = (np.abs(X) / N) ** 2
    power[1:-1] *= 2                # fold negative freqs (exclude DC and Nyquist)
    return (power,)


@app.cell(hide_code=True)
def _(mo):
    mo.md(r"""
    ## Power Spectrum Density (PSD)
    """)
    return


@app.cell
def _(N, fs, power):
    df = fs / N
    psd = power / df
    return (psd,)


@app.cell(hide_code=True)
def _(mo):
    mo.md(r"""
    ## Plots
    """)
    return


@app.cell
def _(freqs, mag, plt, power, psd):
    fig, axs = plt.subplots(3, 1)

    axs[0].plot(freqs, mag)
    axs[0].set_title("FFT Magnitude")
    axs[0].set_xlabel("Frequency (Hz)")
    axs[0].set_ylabel("Amplitude")

    axs[1].plot(freqs, power)
    axs[1].set_title("Power Spectrum")
    axs[1].set_xlabel("Frequency (Hz)")
    axs[1].set_ylabel("Power")

    axs[2].semilogy(freqs, psd)
    axs[2].set_title("PSD")
    axs[2].set_xlabel("Frequency (Hz)")
    axs[2].set_ylabel("PSD (V²/Hz)")

    plt.tight_layout()
    plt.show()
    return


@app.cell
def _():
    import marimo as mo

    return (mo,)


if __name__ == "__main__":
    app.run()
