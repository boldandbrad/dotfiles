# 🏠 boldandbrad's humble dotfiles

![screenshot](./assets/desktop_2025-11-10.png)

---

## 🗝️ Welcome `$HOME`

Simplify the process of moving into a new workstation by automatically
furnishing it with your favorite app(liance)s and setting up power(ful) tools to
maintain it.

> [!WARNING]
> My dotfiles are open source to serve as a blueprint and inspiration for
> others. Please feel free to explore the [contents](#contents) and copy what
> you like, but
> [I do not recommend forking](https://github.com/lissy93/dotfiles?tab=readme-ov-file#so-copy-paste-right)
> because my setup is both custom and highly
> [volatile](https://github.com/boldandbrad/dotfiles/commits/main/).

---

[✨ TL;DR](#tldr) | [🛋️ Contents](#contents) | [📦 Unpack](#unpack) |
[🛠️ Maintain](#maintain) | [💡 Inspiration](#inspiration)

---

<a id="tldr"></a>

## ✨ TL;DR

The floor plan at a glance:

| Operating System                   | ![macOS](https://img.shields.io/badge/macOS-_?logo=apple&logoColor=white&color=%23000000)                                                                                                                                                                                                                                                                                                                                                              |
| ---------------------------------- | :----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Launcher & Window Tiler            | ![leaderkey](https://img.shields.io/badge/LeaderKey-_?color=%23ceddef) ![raycast](https://img.shields.io/badge/Raycast-_?logo=raycast&logoColor=%23FF6363&color=black)                                                                                                                                                                                                                                                                                 |
| Web Browser                        | ![duckduckgo](https://img.shields.io/badge/DuckDuckGo-_?logoColor=white&logo=duckduckgo&color=%23DE5833)                                                                                                                                                                                                                                                                                                                                               |
| Package Manager                    | ![homebrew](https://img.shields.io/badge/Homebrew-_?logo=homebrew&logoColor=black&color=%23FBB040)                                                                                                                                                                                                                                                                                                                                                     |
| Password Manager                   | ![bitwarden](https://img.shields.io/badge/Bitwarden-_?logo=bitwarden&color=%23175DDC)                                                                                                                                                                                                                                                                                                                                                                  |
| Env, Alias, PATH & Dotfile Manager | ![aliae](https://img.shields.io/badge/🌱_aliae-_?logoColor=%23a0c59e&color=grey)                                                                                                                                                                                                                                                                                                                                                                       |
| Terminal Emulator & Mux            | ![ghostty](https://img.shields.io/badge/Ghostty-_?color=%233551f3) ![wezterm](https://img.shields.io/badge/Wezterm-_?logo=wezterm&logoColor=%234E49EE&color=%23212C31)                                                                                                                                                                                                                                                                                 |
| Shell                              | ![zsh](https://img.shields.io/badge/Zsh-_?logo=zsh&logoColor=white&color=%23F15A24) ![oh-my-posh](https://img.shields.io/badge/Oh_My_Posh-2C7AE0)                                                                                                                                                                                                                                                                                                      |
| Editor                             | ![neovim](https://img.shields.io/badge/Neovim-_?logo=neovim&logoColor=white&color=%2357A143) ![zed](https://img.shields.io/badge/Zed-_?logo=zed-industries&logoColor=white&color=%23084CCF)                                                                                                                                                                                                                                                            |
| Version Control System             | ![git](https://img.shields.io/badge/git-_?logo=git&color=%23f1f0e9) ![lazygit](https://img.shields.io/badge/Lazygit-_?color=%23303030)                                                                                                                                                                                                                                                                                                                 |
| Typeface                           | [Space Mono](https://fonts.google.com/specimen/Space+Mono)                                                                                                                                                                                                                                                                                                                                                                                             |
| Theme / Colorscheme                | ![catppuccin-mocha](https://img.shields.io/badge/Catppuccin-Mocha-_?logoColor=%23cba6f7&labelColor=%23b4befe&color=%231e1e2e)                                                                                                                                                                                                                                                                                                                          |
| Programming Langauges              | ![golang](https://img.shields.io/badge/Go-_?logo=go&logoColor=white&color=%2300ADD8) ![rust](https://img.shields.io/badge/Rust-_?logo=rust&logoColor=white&color=%23000000) ![deno](https://img.shields.io/badge/Deno-_?logo=deno&logoColor=black&color=%2370FFAF) ![python](https://img.shields.io/badge/Python-_?logo=python&logoColor=white&color=%233776AB) ![ruby](https://img.shields.io/badge/Ruby-_?logo=ruby&logoColor=white&color=%23CC342D) |

---

<a id="contents"></a>

## 🛋️ Contents

The main contents of this repo are organized into a few high-level directories:

- 🗄️ [bin](../bin/README.md) - Custom executables to append to the user's `PATH`
- 🎨 [config](../config/README.md) - Package and app configs to be symlinked
  into place
- 🛠️ [util](../util/README.md) - System specific setup scripts and configs to be
  [unpacked](#📦-unpack)

---

<a id="unpack"></a>

## 📦 Unpack

[`unpack.sh`](../unpack.sh) is the main installation script. The unpack script
explains what it will do, prompts the user before each step, and is idempotent.
This means it can be safely run multiple times to keep the system in sync
without compounding changes or breaking.

In brief, unpacking...

- ✅ Verifies system compatibility
- 🔄 Checks and prompts for system updates
- ⬇️ Installs or updates user packages and apps
- 🔗 Symlinks user package and app configs
- ⚙️ Applies user system settings

> [!WARNING]
> Before unpacking, review the repo [contents](#contents) and backup any
> pre-existing configs.

### Get it Delivered

Automatically download and run [`ship.sh`](../ship.sh), which clones this repo
to `~/Dotfiles` (if not present) and then prompts you to run
[`unpack.sh`](../unpack.sh).

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/boldandbrad/dotfiles/main/ship.sh)"
```

### Haul it Yourself

Manually clone this repo and run [`unpack.sh`](../unpack.sh).

```sh
git clone https://github.com/boldandbrad/dotfiles.git ~/Dotfiles
cd ~/Dotfiles && ./unpack.sh
```

---

<a id="maintain"></a>

## 🛠️ Maintain

To make system maintanence simpler after unpacking, a handful of convenient
[aliases](../config/aliae/aliae.yaml) are provided. Invoke these from anywhere.

| Command       | Description                                                 |
| ------------- | ----------------------------------------------------------- |
| `sys-clean`   | Clean system caches and app data (❌ Coming soon)           |
| `dot-relink`  | Relink installed dotfiles                                   |
| `zsh-reload`  | Reload shell environment ([`.zshrc`](../config/zsh/.zshrc)) |
| `dep-check`   | Check if all apps and dependencies are installed            |
| `dep-refresh` | Install/update all apps and dependencies                    |
| `dep-prune`   | Uninstall apps and dependencies that aren't needed          |

---

<a id="inspiration"></a>

## 💡 Inspiration

There are plenty of great dotfile repos and machine setup resources out there.
In particular, I took inspiration from these gems:

- [Dotfiles Community 🔗](https://dotfiles.github.io/) - a great collection of
  dotfile resources
- [dotfyle 🔗](https://dotfyle.com/) - discover neovim plugins and
  configurations, including [mine](https://dotfyle.com/boldandbrad/)
- [dotfile repos 🔗](https://github.com/stars/boldandbrad/lists/dotfiles) - my
  favorite github dotfile repositories

### Wallpaper Credits

The wallpaper assets found in this repo have been copied from the following
sources:

- [catppuccin-waves-4k.png](./wallpapers/catppuccin-waves-4k.png) - Credit
  [zhichaoh/catppuccin-wallpapers](https://github.com/zhichaoh/catppuccin-wallpapers/blob/main/waves/cat-waves.png)
- OS Wallpapers. Credit
  [thismoon/catppuccin-wallpapers](https://github.com/thismoon/catppuccin-wallpapers/tree/main/os)

---

<a id="license"></a>

## ⚖️ License

Copyright (c) 2021-present Bradley Wojcik. Released under the MIT License. See
[LICENSE](../LICENSE) for details.
