#import "../../../common.typ": *

SSH (Secure Shell) provides a cryptographically secure way to access a machine remotely over an untrusted network. Raspberry Pi OS ships with the `openssh-server` package already installed, but it stays *disabled by default* as a security precaution.

You can turn it on in one of three ways:

*Option 1 — raspi-config:* _(recommended for interactive use)_
```bash
sudo raspi-config
# Navigate to: Interface Options → SSH → Enable
```

---

*Option 2 — systemctl:* _(enable on a running system)_

```bash
sudo systemctl enable ssh  # enable SSH to start on boot
sudo systemctl start ssh  # start the SSH service immediately
```

*Option 3 — headless setup:* _(before first boot)_

Drop an empty file called `ssh` (with no extension) into the `/boot` or `/bootfs` partition of the SD card. On first boot, the OS notices the file, turns on the SSH service, and removes the file automatically.

With SSH active, you can connect from another machine like this:
```bash
ssh <username>@<hostname>.local
# e.g. ssh pi@raspberrypi.local
```

---

=== SSH Key Authentication

While a password gets the job done, *public-key authentication* is the safer route: you create a key pair on your own machine, put the public half on the Raspberry Pi, and from then on you can log in without a password at all — which also makes brute-force attacks pointless.

#topic[How it works]

A key pair is made up of two files:

/ Private key _(`~/.ssh/rpi`)_: never leaves your machine.
/ Public key _(`~/.ssh/rpi.pub`)_: goes onto the Pi, and can only confirm the identity of whoever holds the matching private key.

---

#topic[Generate a key pair _(on your local machine)_]

Ed25519 is currently the recommended algorithm — small, quick, and stronger than RSA.
```bash
ssh-keygen -t ed25519 -C "your_email@example.com"
```

You'll be asked for:
/ File location: press Enter to accept the default _(`~/.ssh/rpi`)_.
/ Passphrase: strongly recommended, since it encrypts the private key on disk so a stolen file alone isn't enough to use it.

This generates two files:
```
~/.ssh/rpi      # private key — keep this secret
~/.ssh/rpi.pub  # public key  — this goes on the Pi
```

---

#topic[Copy the public key to the Raspberry Pi]

`ssh-copy-id` is the easiest way to do this, taking care of directory setup and permissions for you:
```bash
ssh-copy-id -i ~/.ssh/rpi.pub <username>@<pi-ip-address>
# e.g. ssh-copy-id ~/.ssh/rpi.pub pi@10.42.0.39
```

It will prompt you for your Pi password one last time, after which the public key gets appended to `~/.ssh/authorized_keys` on the Pi.

/*
If `ssh-copy-id` is not available _(e.g. on Windows)_, copy it manually:
```bash
cat ~/.ssh/rpi.pub | ssh <username>@<pi-ip-address> \
"mkdir -p ~/.ssh && chmod 700 ~/.ssh && \
cat >> ~/.ssh/authorized_keys && chmod 600 ~/.ssh/authorized_keys"
```
*/

---

#topic[Connect using the key]
```bash
ssh -i ~/.ssh/rpi <username>@<pi-ip-address>
# e.g. ssh -i ~/.ssh/rpi pi@10.42.0.39
```

#important[SSH will pick up `~/.ssh/id_ed25519` on its own if no key is specified.]

If you added a passphrase, expect a single prompt for it; to skip re-entering it every time, register the key with the SSH agent:
```bash
eval "$(ssh-agent -s)"   # start the agent
ssh-add ~/.ssh/rpi  # load the key (prompts for passphrase once)
```

---

#info[SSH Client Configuration File]
Setting up a *host alias* in `~/.ssh/config` means you never have to type out a full `ssh` command again — all the connection details live in one place.
```ini
Host rpi
    HostName raspberrypi.local
    User pi
    IdentityFile ~/.ssh/rpi
    ServerAliveInterval 60
```
/*
#table(
  columns: (auto, 1fr),
  [*Directive*], [*Role*],
  [`Host`],               [Alias you type on the command line],
  [`HostName`],           [Real address or mDNS name of the machine],
  [`User`],               [Remote username — no need for `user@host`],
  [`IdentityFile`],       [Path to the private key for this host],
  [`ServerAliveInterval`],[Sends a keepalive every _n_ seconds to prevent timeout],
)
*/
Once this is in `~/.ssh/config`, connecting is as simple as:
```bash
ssh rpi
```

---

// === Disable password login on the Pi

After confirming that key-based login works, you can turn off password logins altogether to make the Pi more resistant to brute-force attempts. Open the SSH server config:
```bash
sudo vim /etc/ssh/sshd_config
```

Locate and set these lines _(then restart the ssh service)_:
```
PasswordAuthentication no
PubkeyAuthentication yes
```
Then restart the SSH service.
// ```bash
// sudo systemctl restart ssh
// ```

#warning[Do not disable password login until you have verified that key
  authentication works in a separate terminal session. Locking yourself out
  would require physical access to the Pi to recover.]
