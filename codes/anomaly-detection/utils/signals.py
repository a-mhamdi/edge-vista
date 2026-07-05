import numpy as np

f1, f2, f3 = 50, 120, 200
a1, a2, a3 = 1.0, 0.5, 0.3

def baseline(fs, N):
    """
    Generate the baseline signal as a sum of three known sinewaves plus noise.

    Parameters
    ----------
    fs : float
        Sampling frequency (Hz).
    N : int
        Number of samples.

    Returns
    -------
    t : ndarray, shape (N,)
        Time vector (s).
    x_ref : ndarray, shape (N,)
        Reference signal: sum of sinewaves at f1, f2, f3 with
        amplitudes a1, a2, a3, plus additive Gaussian noise.
    """
    t = np.arange(N) / fs
    x = a1 * np.sin(2*np.pi*f1*t) + a2 * np.sin(2*np.pi*f2*t) + a3 * np.sin(2*np.pi*f3*t)
    x += 0.1 * np.random.randn(N)
    return t, x

def anomaly(t, f_anom, a_anom):
    """
    Generate a single-tone anomaly signal to be injected into the baseline.

    Parameters
    ----------
    t : ndarray
        Time vector (s), typically from `baseline`.
    f_anom : float
        Frequency of the anomalous tone (Hz).
    a_anom : float
        Amplitude of the anomalous tone.

    Returns
    -------
    ndarray
        Sinewave at f_anom with amplitude a_anom, same shape as t.
    """
    return a_anom * np.sin(2*np.pi*f_anom*t)