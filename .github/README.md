# 🏠 boldandbrad's humble dotfiles

> Welcome `$HOME`!

This repo makes moving into your new mac a breeze by automatically furnishing it
with your favorite app(liance)s, and giving you powerful tools to maintain it.

I have made my dotfiles open source to serve as a blueprint and inspiration for
others. Whether or not dotfile repos should be forked is a
[topic of hot debate](https://github.com/lissy93/dotfiles?tab=readme-ov-file#so-copy-paste-right).
If you do fork this repo, I _**strongly**_ recommend you
[personalize](#personalize) the contained files before unpacking.

**Jump to:** [✨ TL;DR](#tldr) | [🎥 Demo](#demo) | [📦 Unpack](#unpack) |
[🛠️ Maintain](#maintain) | [🛋️ Contents](#contents) |
[🖌️ Personalize](#personalize) | [💡 Inspiration](#inspiration) |
[📚 Resources](#resources)

## ✨ TL;DR <a id="tldr"></a>

The floor plan at a glance:

|                             |                                                                                                                                                                                                                                                                                                                                                                 |
| --------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Operating System            | ![macOS](https://img.shields.io/badge/macOS-_?logo=apple&logoColor=white&color=%23000000)                                                                                                                                                                                                                                                                       |
| Package Manager             | ![homebrew](https://img.shields.io/badge/Homebrew-_?logo=homebrew&logoColor=black&color=%23FBB040)                                                                                                                                                                                                                                                              |
| Dotfile Manager             | ![dotbot](https://img.shields.io/badge/dotbot-_?logoColor=white&color=grey)                                                                                                                                                                                                                                                                                     |
| Env, Alias and PATH Manager | ![aliae](https://img.shields.io/badge/🌱_aliae-_?logoColor=%23a0c59e&color=grey)                                                                                                                                                                                                                                                                                |
| Terminal Emulator           | ![wezterm](https://img.shields.io/badge/Wezterm-_?logo=wezterm&logoColor=%234E49EE&color=%23212C31)                                                                                                                                                                                                                                                             |
| Terminal Multiplexer        | ![tmux](https://img.shields.io/badge/tmux-_?logo=tmux&logoColor=white&color=%231BB91F)                                                                                                                                                                                                                                                                          |
| Shell                       | ![zsh](https://img.shields.io/badge/Zsh-_?logo=zsh&logoColor=white&color=%23F15A24)                                                                                                                                                                                                                                                                             |
| Shell Prompt                | ![oh-my-posh](https://img.shields.io/badge/Oh_My_Posh-2C7AE0)                                                                                                                                                                                                                                                                                                   |
| Editor                      | ![neovim](https://img.shields.io/badge/Neovim-_?logo=neovim&logoColor=white&color=%2357A143) ![vscodium](https://img.shields.io/badge/VSCodium-_?logo=vscodium&logoColor=white&color=%232F80ED)                                                                                                                                                                 |
| Version Control             | ![git](https://img.shields.io/badge/git-_?logo=git&color=%23f1f0e9) ![lazygit](https://img.shields.io/badge/Lazygit-_?color=%23303030)                                                                                                                                                                                                                          |
| Typeface                    | <img src="https://www.marksimonson.com/_astro/anonymouspro_index.BJoNlAYJ_ZMGmvS.webp" alt="anonymous-pro" width="128"/>                                                                                                                                                                                                                                        |
| Theme / Colorsheme          | ![catppuccin-mocha](https://img.shields.io/badge/Catppuccin-Mocha-_?logoColor=%23cba6f7&labelColor=%23b4befe&color=%231e1e2e)                                                                                                                                                                                                                                   |
| Programming Langauges       | ![golang](https://img.shields.io/badge/Go-_?logo=go&logoColor=white&color=%2300ADD8) ![rust](https://img.shields.io/badge/Rust-_?logo=rust&logoColor=white&color=%23000000) ![deno](https://img.shields.io/badge/Deno-_?logo=deno&logoColor=black&color=%2370FFAF) ![python](https://img.shields.io/badge/Python-_?logo=python&logoColor=white&color=%233776AB) |
|                             |                                                                                                                                                                                                                                                                                                                                                                 |

## 🎥 Demo <a id="demo"></a>

> Gif/Video coming soon.

## 📦 Unpack <a id="unpack"></a>

> [!WARNING]
> Before unpacking, review the repo [contents](#contents) to make sure they
> match your style and backup your existing configs.

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/boldandbrad/dotfiles/main/ship.sh)"
```

This will download and run [`ship.sh`](../ship.sh), which clones this repo to
`~/Setup/dotfiles` (if not present), and then prompts you to run
[`unpack.sh`](../unpack.sh).

Alternatively you can clone the repo yourself and run
[`unpack.sh`](../unpack.sh) manually.

```sh
git clone --recursive https://github.com/boldandbrad/dotfiles.git ~/Setup/dotfiles
cd ~/Setup/dotfiles && ./unpack.sh
```

The unpack script explains what it will do, prompts before doing so, and is
idempotent. This means it can be safely run multiple times without compounding
changes or breaking.

In brief, unpacking does the following:

- ✅ Verify system compatibility
- 🔄 Check and prompt for system updates
- ⬇️ Install or update user packages and apps
- 🔗 Symlink user dotfiles and configs
- ⚙️ Apply user system settings
- 🌱 Clone user github repos

Continue reading for more details on what to expect.

## 🛠️ Maintain <a id="maintain"></a>

To make system maintanence simpler post-unpack, a handful of convenient
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

## 🛋️ Contents <a id="contents"></a>

The contents of this repo are organized into a few high level directories.

```txt
dotfiles/
├── config/         # Config files for packages and apps. Symlinked by dotbot.
│  └── ..
├── scripts/        # Shell scripts for system and tool setup. Called by unpack.sh.
│  └── ..
├── vendor/         # Dependencies which are managed as git submodules.
│  └── ..
├── ..
├── Makefile        # Helpful development commands.
├── ship.sh         # Remote installation script.
├── unpack.sh       # Main installation and setup script.
└── symlinks.yaml   # Dotbot symlink configuration.
```

### Configs

The [`config/`](../config/README.md) directory contains config files for
packages and apps. They are symlinked to their respective locations on the
system by `dotbot` as specified in [`symlinks.yaml`](../symlinks.yaml) at the
repo root.

Most packages and apps respect the
[XDG base directory specification](https://specifications.freedesktop.org/basedir-spec/latest/index.html)
to determine where to store configurations and data. This creates consistency
and predictability while keeping your `$HOME` free of clutter.

The following XDG variables are defined in [`.zshenv`](../config/zsh/.zshenv),
which is sourced before symlinking.

| Env Variable      | Location             |
| ----------------- | -------------------- |
| `XDG_BIN_HOME`    | `~/.local/bin`       |
| `XDG_CACHE_HOME`  | `~/.local/var/cache` |
| `XDG_CONFIG_HOME` | `~/.config`          |
| `XDG_DATA_HOME`   | `~/.local/share`     |
| `XDG_LIB_HOME`    | `~/.local/lib`       |
| `XDG_STATE_HOME`  | `~/.local/state`     |

### Scripts

The `scripts/` directory contains shell scripts that automate system and tool
setup. This includes OS specific scripts for installing apps and dependencies,
and system configurations. Most of these scripts are called directly from
`unpack.sh` at the repo root.

> Docs coming soon.

## 🖌️ Personalize <a id="personalize"></a>

If you have cloned or are reusing snippets from this repo for your own system
setup, there are a handful of things that _should_ change before unpacking.

- Change the value of `GITHUB_USER` username in both `ship.sh` and `unpack.sh`.
  This is used to automatically clone your public git repos, including this one.
- Search for and replace all other 'boldandbrad' references with your preferred
  user name or value.

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

## 📚 Resources <a id="resources"></a>

- [Roadmap](ROADMAP.md) - planned changes and updates to this repo
- [boldandbrad docs 🔗](https://boldandbrad.github.io/docs) - my personal dev
  docs
- [Dotbot 🔗](https://github.com/anishathalye/dotbot) - dotbot github repo
- [Dotfiles Community 🔗](https://dotfiles.github.io/) - a great collection of
  dotfile resources
- [dotfyle 🔗](https://dotfyle.com/) - discover neovim plugins and
  configurations, including [mine](https://dotfyle.com/boldandbrad/)

## ⚖️ License <a id="license"></a>

Copyright (c) 2021-present Bradley Wojcik. Released under the MIT License. See
[LICENSE](../LICENSE) for details.
