![macOS](https://badgen.net/badge/icon/macOS/blue?icon=apple&label)

# dotfiles

> `$HOME`, sweet `$HOME`

Welcome to my personal dotfiles repo! I have made it open source to serve as an
example for others. If you wish to use it, please fork and make your own
[customizations](#customization) to the contained files before install.

**Jump to:**
[Intro](#intro) |
[Features](#features) |
[Customization](#customization) |
[Installation](#installation) |
[Usage](#usage) |
[Inspiration](#inspiration) |
[Resources](#resources)

## 📢 Intro <a id="intro"></a>

Dotfiles are config

## ✨ Features <a id="features"></a>

- macOS system setup
  - Install Apple Developer Command Line Tools
  - Update preinstalled software via `softwareupdate`
  - Install packages and apps via Homebrew Bundle
  - Symlink user dotfiles via `dotbot`
  - XDG directory compatibility
  - Clone user's github repos

## ⚙️ Customization <a id="customization"></a>

> Coming soon.

## 📦 Installation <a id="installation"></a>

> **Warning**: Before continuing, consider reviewing the repo contents to
> validate it is what you want.

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/boldandbrad/dotfiles/main/remote_install.sh)"
```

This will download and run [`remote_install.sh`](../remote_install.sh), which
clones this repo to `~/Setup/dotfiles` (if not present), and then prompts you to
run [`install.sh`](../install.sh).

Alternatively you can clone the repo yourself and run the install script
manually ([`install.sh`](../install.sh)).

```sh
git clone --recursive https://github.com/boldandbrad/dotfiles.git ~/Setup/dotfiles
cd ~/Setup/dotfiles && ./install.sh
```

The install script does several things. It explains what it will do, prompts
before doing so, and is idempotent. This means it can be safely run multiple
times without compounding changes or breaking.

## 🚀 Usage <a id="usage"></a>

To make system maintanence simpler post-install, a handful of convenient
commands are provided. Invoke these from anywhere.

| Command       | Description                                                 |
| -             | -                                                           |
| `sys-refresh` | Rerun system setup ([`install.sh`](../install.sh))          |
| `sys-clean`   | Clean system caches and app data (❌ Coming soon)           |
| `dot-commit`  | Persist current dotfiles to github (❌ Coming soon)         |
| `dot-relink`  | Relink installed dotfiles                                   |
| `zsh-reload`  | Reload shell environment ([`.zshrc`](../config/zsh/.zshrc)) |
| `dep-check`   | Check if all apps and dependencies are installed            |
| `dep-refresh` | Install/update all apps and dependencies                    |
| `dep-prune`   | Uninstall apps and dependencies that aren't needed          |
| `git-reclone` | Reclone user github repos                                   |

## 💡 Inspiration <a id="inspiration"></a>

There are tons of great dotfile and machine setup repos out there. In
particular, I took inspiration from these gems:

- [lissy93/brewfile](https://github.com/lissy93/brewfile)
- [lissy93/dotfiles](https://github.com/lissy93/dotfiles) (a lot 😅)
- [nikitavoloboev/dotfiles](https://github.com/nikitavoloboev/dotfiles)
- [stefanzweifel/dotfiles](https://github.com/stefanzweifel/dotfiles)
- [superatomic/dotfiles](https://github.com/superatomic/dotfiles)
- [webpro/dotfiles](https://github.com/webpro/dotfiles)

## 📚 Resources <a id="resources"></a>

- [Roadmap](ROADMAP.md) - planned changes and updates to this repo
- [Docs 🔗](https://boldandbrad.github.io/docs) - my personal dev docs
- [Dotbot 🔗](https://github.com/anishathalye/dotbot) - dotbot github repo

## ⚖️ License <a id="license"></a>

Copyright (c) 2021-present Bradley Wojcik. Released under the MIT License. See
[LICENSE](../LICENSE) for details.
