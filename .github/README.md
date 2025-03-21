# 🏠 boldandbrad's humble dotfiles

![screenshot](../assets/desktop_2025-02-12.png)

---

## 🗝️ Welcome `$HOME`

These dotfiles simplify moving into a new workstation by automatically
furnishing it with your favorite app(liance)s, and setting up power(ful) tools
so you can maintain it.

> [!WARNING]
> I have made my floor plan open source to serve as a blueprint and inspiration
> for others. However, these dotfiles are both highly customized and
> [volatile](https://github.com/boldandbrad/dotfiles/commits/main/). Feel free
> to explore the [contents](#contents) and use what you like, but
> [I do not recommend forking](https://github.com/lissy93/dotfiles?tab=readme-ov-file#so-copy-paste-right).

---

[✨ TL;DR](#tldr) | [📦 Unpack](#unpack) | [🛋️ Contents](#contents) |
[🛠️ Maintain](#maintain) | [💡 Inspiration](#inspiration) |
[📚 Resources](#resources)

---

## ✨ TL;DR <a id="tldr"></a>

The floor plan at a glance:

| Operating System                   | ![macOS](https://img.shields.io/badge/macOS-_?logo=apple&logoColor=white&color=%23000000)                                                                                                                                                                                                                                                                       | ![alpine](https://img.shields.io/badge/Alpine-_?logo=alpinelinux&color=%230D597F) **                                                   |
| ---------------------------------- | :-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | :------------------------------------------------------------------------------------------------------------------------------------- |
| Launcher and Window Tiler          | ![leader key](https://img.shields.io/badge/Leader_Key-_?color=%23ceddef) ![raycast](https://img.shields.io/badge/Raycast-_?logo=raycast&logoColor=%23FF6363&color=black)*                                                                                                                                                                                       | NA                                                                                                                                     |
| Browser                            | ![arc](https://img.shields.io/badge/Arc-_?logo=arc&logoColor=%23FCBFBD&color=%233c4afe) ![duckduckgo](https://img.shields.io/badge/DuckDuckGo-_?logo=duckduckgo&logoColor=white&color=%23DE5833)                                                                                                                                                                | NA                                                                                                                                     |
| Package Manager                    | ![homebrew](https://img.shields.io/badge/Homebrew-_?logo=homebrew&logoColor=black&color=%23FBB040)                                                                                                                                                                                                                                                              | ![apk](https://img.shields.io/badge/apk-_?logo=alpinelinux&color=%230D597F)                                                            |
| Env, Alias, PATH & Dotfile Manager | ![aliae](https://img.shields.io/badge/🌱_aliae-_?logoColor=%23a0c59e&color=grey)                                                                                                                                                                                                                                                                                | ![aliae](https://img.shields.io/badge/🌱_aliae-_?logoColor=%23a0c59e&color=grey)                                                       |
| Terminal Emulator                  | ![wezterm](https://img.shields.io/badge/Wezterm-_?logo=wezterm&logoColor=%234E49EE&color=%23212C31)                                                                                                                                                                                                                                                             | NA                                                                                                                                     |
| Terminal Multiplexer               | ![tmux](https://img.shields.io/badge/tmux-_?logo=tmux&logoColor=white&color=%231BB91F)                                                                                                                                                                                                                                                                          |                                                                                                                                        |
| Shell                              | ![zsh](https://img.shields.io/badge/Zsh-_?logo=zsh&logoColor=white&color=%23F15A24)                                                                                                                                                                                                                                                                             |                                                                                                                                        |
| Shell Prompt                       | ![oh-my-posh](https://img.shields.io/badge/Oh_My_Posh-2C7AE0)                                                                                                                                                                                                                                                                                                   |                                                                                                                                        |
| Editor                             | ![neovim](https://img.shields.io/badge/Neovim-_?logo=neovim&logoColor=white&color=%2357A143) ![vscodium](https://img.shields.io/badge/VSCodium-_?logo=vscodium&logoColor=white&color=%232F80ED)                                                                                                                                                                 | ![neovim](https://img.shields.io/badge/Neovim-_?logo=neovim&logoColor=white&color=%2357A143)                                           |
| Version Control                    | ![git](https://img.shields.io/badge/git-_?logo=git&color=%23f1f0e9) ![lazygit](https://img.shields.io/badge/Lazygit-_?color=%23303030)                                                                                                                                                                                                                          | ![git](https://img.shields.io/badge/git-_?logo=git&color=%23f1f0e9) ![lazygit](https://img.shields.io/badge/Lazygit-_?color=%23303030) |
| Typeface                           | <img src="../assets/anonymous-pro.png" alt="anonymous-pro" width="120"/>                                                                                                                                                                                                                                                                                        | NA                                                                                                                                     |
| Theme / Colorsheme                 | ![catppuccin-mocha](https://img.shields.io/badge/Catppuccin-Mocha-_?logoColor=%23cba6f7&labelColor=%23b4befe&color=%231e1e2e)                                                                                                                                                                                                                                   |                                                                                                                                        |
| Programming Langauges              | ![golang](https://img.shields.io/badge/Go-_?logo=go&logoColor=white&color=%2300ADD8) ![rust](https://img.shields.io/badge/Rust-_?logo=rust&logoColor=white&color=%23000000) ![deno](https://img.shields.io/badge/Deno-_?logo=deno&logoColor=black&color=%2370FFAF) ![python](https://img.shields.io/badge/Python-_?logo=python&logoColor=white&color=%233776AB) |                                                                                                                                        |

\* manual configuration required

\** experimental container support

---

## 📦 Unpack <a id="unpack"></a>

Setup and installation is handled by [`unpack.sh`](../unpack.sh). The unpack
script explains what it will do, prompts before doing so, and is idempotent.
This means it can be safely run multiple times to keep the system in sync
without compounding changes or breaking.

In brief, unpacking does the following:

- ✅ Verify system compatibility
- 🔄 Check and prompt for system updates
- ⬇️ Install or update user packages and apps
- 🔗 Symlink user dotfiles and configs
- ⚙️ Apply user system settings
- 🌱 Clone user github repos

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

### Mobile Home

> [!NOTE]
> Container support is a work in progress and considered experimental.

A taste of home when you're on the road goes a long way. Spin up a simplified
version of this setup in a cozy alpine linux container (requires podman).

```sh
git clone https://github.com/boldandbrad/dotfiles.git ~/Dotfiles
cd ~/Dotfiles
make build
make run
```

---

## 🛋️ Contents <a id="contents"></a>

The main contents of this repo are organized into a few high level directories.

```txt
dotfiles/
├── bin/            # Custom executables and scripts. Appended to PATH by aliae.
│  └── ..
├── config/         # Config files for packages and apps. Symlinked by aliae.
│  └── ..
├── util/           # Scripts and utilities for specific system and tool setup. Sourced by unpack.sh.
│  └── ..
├── ..
├── Makefile        # Helpful development commands.
├── ship.sh         # Remote installation script.
└── unpack.sh       # Main installation and setup script.
```

### Bin

The `bin/` directory contains custom executable binaries and shell scripts. The
directory is automatically appended to `PATH` by `aliae` on shell startup.

<details>
    <summary><b>Executables</b></summary>

Invoke these from anywhere.

| Executable                            | Description                                                           |
| :------------------------------------ | :-------------------------------------------------------------------- |
| [`cleanpods`](../bin/cleanpods)       | Clean podman caches without confirmation, and print podman disk usage |
| [`flushdns`](../bin/flushdns)         | Flush macOS dns records                                               |
| [`license`](..bin/license)            | Create an MIT license file in the current working directory           |
| [`today`](../bin/license)             | Return today's date in YYYY-MM-DD format                              |
| [`togglehidden`](../bin/togglehidden) | Toggle showing hidden files in macOS Finder                           |
| [`trash`](../bin/trash)               | Move items to trash                                                   |

</details>

### Config

The [`config/`](../config/README.md) directory contains config files for user
packages and apps. They are symlinked to their respective locations on the
system by `aliae` as specified in [`aliae.yaml`](../config/aliae/aliae.yaml).

#### XDG Base Directories

Most packages and apps respect the
[XDG base directory specification](https://specifications.freedesktop.org/basedir-spec/latest/index.html)
to determine where to store and locate their configurations and data. This
creates consistency and predictability while keeping `$HOME` free of clutter.

<details>
    <summary>XDG Variables</summary>

The following XDG variables are defined in
[`aliae.yaml`](../config/aliae/aliae.yaml), and are sourced on shell startup
before symlinking configs.

| ENV Variable      | Location             |
| :---------------- | :------------------- |
| `XDG_BIN_HOME`    | `~/.local/bin`       |
| `XDG_CACHE_HOME`  | `~/.local/var/cache` |
| `XDG_CONFIG_HOME` | `~/.config`          |
| `XDG_DATA_HOME`   | `~/.local/share`     |
| `XDG_LIB_HOME`    | `~/.local/lib`       |
| `XDG_STATE_HOME`  | `~/.local/state`     |

</details>

#### Configs

> Docs coming soon.

### Util

The `util/` directory contains shell scripts and utilities that automate system
and tool setup. This includes OS specific scripts for installing apps and
dependencies, and system configurations. Most of these scripts are sourced
directly from `unpack.sh` at the repo root.

> Docs coming soon.

---

## 🛠️ Maintain <a id="maintain"></a>

To make system maintanence simpler after unpacking, a handful of convenient
[aliases](../config/aliae/aliae.yaml) are provided. Invoke these from anywhere.

| Command       | Description                                                 |
| ------------- | ----------------------------------------------------------- |
| `sys-refresh` | Rerun system setup ([`unpack.sh`](../unpack.sh))            |
| `sys-clean`   | Clean system caches and app data (❌ Coming soon)           |
| `dot-commit`  | Persist current dotfiles to github (❌ Coming soon)         |
| `dot-relink`  | Relink installed dotfiles                                   |
| `zsh-reload`  | Reload shell environment ([`.zshrc`](../config/zsh/.zshrc)) |
| `dep-check`   | Check if all apps and dependencies are installed            |
| `dep-refresh` | Install/update all apps and dependencies                    |
| `dep-prune`   | Uninstall apps and dependencies that aren't needed          |
| `git-reclone` | Reclone user github repos                                   |

---

## 💡 Inspiration <a id="inspiration"></a>

There are tons of great dotfile and machine setup repos out there. In
particular, I took inspiration from these gems:

- [dreamsofcode-io/dotfiles](https://github.com/dreamsofcode-io/dotfiles) - nvim
  and tmux configs
- [lissy93/dotfiles](https://github.com/lissy93/dotfiles) - install scripts and
  repo structure
- [stefanzweifel/dotfiles](https://github.com/stefanzweifel/dotfiles)
- [superatomic/dotfiles](https://github.com/superatomic/dotfiles)
- [webpro/dotfiles](https://github.com/webpro/dotfiles)

---

## 📚 Resources <a id="resources"></a>

- [Roadmap](ROADMAP.md) - planned changes and updates to this repo
- [boldandbrad docs 🔗](https://boldandbrad.github.io/docs) - my personal dev
  docs
- [Dotfiles Community 🔗](https://dotfiles.github.io/) - a great collection of
  dotfile resources
- [dotfyle 🔗](https://dotfyle.com/) - discover neovim plugins and
  configurations, including [mine](https://dotfyle.com/boldandbrad/)

---

## ⚖️ License <a id="license"></a>

Copyright (c) 2021-present Bradley Wojcik. Released under the MIT License. See
[LICENSE](../LICENSE) for details.
