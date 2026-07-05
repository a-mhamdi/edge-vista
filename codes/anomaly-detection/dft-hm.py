import numpy as np
import matplotlib.pyplot as plt

N = 2**10
n = np.arange(N)
w = np.exp(-2 * np.pi * 1j / N)
DFT = w ** np.outer(n, n)  # outer product n_k*n_m

plt.figure(figsize=(6, 6))
plt.imshow(np.real(DFT), cmap="viridis")
plt.colorbar(label="Re(DFT matrix)")
plt.title("Real part of DFT matrix")
plt.xlabel("m")
plt.ylabel("k")
plt.tight_layout()
plt.show()

