#import "../../../common.typ": *

Git is a distributed version control system for tracking how files and directories change over time. It lets you snapshot your work with commits, branch off to try things safely, and merge everything back together afterward.

GitHub hosts Git repositories in the cloud and layers on collaboration tools — pull requests, issues, and Actions — on top of ordinary Git.

---

Installing Git:
```bash
sudo apt install git
```

A minimal first-time setup:
```bash
git config --global user.name  "Your Name"
git config --global user.email "you@example.com"
```

Cloning an existing repository from GitHub:
```bash
git clone https://github.com/a-mhamdi/edge-vista.git
```

---

*Using a key with GitHub*

The same `rpi` / `rpi.pub` key pair can also authenticate you to GitHub, so there's no need for HTTPS tokens when pushing code.

/*
```bash
cat ~/.ssh/rpi.pub
```
*/

Print your public key and copy it, then head to `GitHub` → `Settings` → `SSH and GPG keys` → `New SSH key`, paste it in, and save. Confirm the connection works:
```bash
ssh -T git@github.com
# Expected: Hi <username>! You've successfully authenticated...
```

To point an existing local repository at SSH instead of HTTPS:
```bash
git remote set-url origin git@github.com:<user>/<repo>.git
```

---

*Lazygit*

Lazygit is a terminal-based UI for Git that turns fiddly operations — staging individual lines, running interactive rebases, cherry-picking commits — into simple keystrokes, sparing you from memorizing obscure flags. It runs right in your terminal, so there's no jumping between your editor and a separate GUI app. That makes it a natural fit for the Raspberry Pi, where you're typically working entirely over SSH with no desktop environment at all.

Installing it on Raspberry Pi OS:
```bash
sudo apt install lazygit
```

Run `lazygit` from inside any Git repository to launch it, and press `?` anytime to see the full keybinding list.

#align(center)[
  #image("../../../assets/lazygit.png", width: 85%)
]

For full documentation and source code, see #link("https://github.com/jesseduffield/lazygit")[github.com/jesseduffield/lazygit].
