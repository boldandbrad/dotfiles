# 🏠 boldandbrad's humble dotfiles

> Welcome `$HOME`!

This repo makes moving into a new system a breeze by automatically furnishing it
with your favorite apps, and giving you the tools you need to maintain it. I
have made my preferences open source to serve as a blueprint and inspiration for
others.

Whether or not dotfile repos should be forked is a topic of hot debate. If you
***do*** choose to fork this repo, I strongly recommend you
[personalize](#personalize) the contained files before unpacking.

**Jump to:**
[TL;DR](#tldr) |
[Unpack](#unpack) |
[Maintain](#maintain) |
[Contents](#contents) |
[Personalize](#personalize) |
[Inspiration](#inspiration) |
[Resources](#resources)

## ✨ TL;DR <a id="tldr"></a>

The floor plan at a glance:

<!-- I wish I could create a table without a header row in pure markdown 🙃 -->
<table>
  <tr>
    <th align="left">Supported Systems</th>
    <td>
      <img alt="macOS" src="https://img.shields.io/badge/macOS-_?logo=apple&logoColor=white&color=%23000000">
      <!-- <img alt="arch-linux" src="https://img.shields.io/badge/Arch%20Linux-_?logo=arch-linux&logoColor=white&color=%231793D1"> -->
    </td>
  </tr>
  <tr>
    <th align="left">Package Manager</th>
    <td>
      <img alt="homebrew" src="https://img.shields.io/badge/Homebrew-_?logo=homebrew&logoColor=black&color=%23FBB040">
    </td>
  </tr>
  <tr>
    <th align="left">Dotfile Manager</th>
    <td>
      <img alt="dotbot" src="https://img.shields.io/badge/dotbot-_?logoColor=white&color=grey">
    </td>
  </tr>
  <tr>
    <th align="left">Terminal Emulators</th>
    <td>
      <img alt="alacritty" src="https://img.shields.io/badge/Alacritty-_?logo=alacritty&logoColor=white&color=%23F46D01">
      <img alt="kitty" src="https://img.shields.io/badge/kitty-_?logoColor=white&color=%23784421">
    </td>
  </tr>
  <tr>
    <th align="left">Terminal Multiplexer</th>
    <td>
      <img alt="tmux" src="https://img.shields.io/badge/tmux-_?logo=tmux&logoColor=white&color=%231BB91F">
    </td>
  </tr>
  <tr>
    <th align="left">Shell</th>
    <td>
      <img alt="zsh" src="https://img.shields.io/badge/Zsh-_?logo=zsh&logoColor=white&color=%23F15A24">
    </td>
  </tr>
  <tr>
    <th align="left">Shell Prompt</th>
    <td>
      <img alt="starship" src="https://img.shields.io/badge/starship-_?logo=starship&logoColor=white&color=%23DD0B78">
    </td>
  </tr>
  <tr>
    <th align="left">Editors</th>
    <td>
      <img alt="vscodium" src="https://img.shields.io/badge/VSCodium-_?logo=vscodium&logoColor=white&color=%232F80ED">
      <img alt="neovim" src="https://img.shields.io/badge/Neovim-_?logo=neovim&logoColor=white&color=%2357A143">
    </td>
  </tr>
  <tr>
    <th align="left">Typefaces</th>
    <td>Anonymous Pro, Anonymice Pro Nerd Font</td>
  </tr>
  <tr>
    <th align="left">Themes</th>
    <td>Catppuccin Mocha, GitHub Dark Default</td>
  </tr>
</table>

## 📦 Unpack <a id="unpack"></a>

> **Warning**: Before unpacking, consider reviewing the repo [contents](#contents) to
> make sure they match your style. Any existing configs may be overwritten.

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/boldandbrad/dotfiles/main/ship.sh)"
```

This will download and run [`ship.sh`](../ship.sh), which
clones this repo to `~/Setup/dotfiles` (if not present), and then prompts you to
run [`unpack.sh`](../unpack.sh).

Alternatively you can clone the repo yourself and run [`unpack.sh`](../unpack.sh)
manually.

```sh
git clone --recursive https://github.com/boldandbrad/dotfiles.git ~/Setup/dotfiles
cd ~/Setup/dotfiles && ./unpack.sh
```

The unpack script explains what it will do, prompts before doing so, and is
idempotent. This means it can be safely run multiple times without compounding
changes or breaking.

## 🛠️ Maintain <a id="maintain"></a>

To make system maintanence simpler post-install, a handful of convenient
commands are provided. Invoke these from anywhere.

| Command       | Description                                                 |
| -             | -                                                           |
| `sys-refresh` | Rerun system setup ([`unpack.sh`](../unpack.sh))          |
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

Most packages and apps respect the
[XDG base directory specification](https://specifications.freedesktop.org/basedir-spec/latest/index.html)
to determine where to store configurations and data. This creates consistency
and predictability while keeping `~/` free of clutter.

The following XDG variables are defined in [`.zshenv`](../config/zsh/.zshenv), which is sourced before symlinking.

| Env Variable      | Location              |
| -                 | -                     |
| `XDG_BIN_HOME`    | `~/.local/bin`        |
| `XDG_CACHE_HOME`  | `~/.local/var/cache`  |
| `XDG_CONFIG_HOME` | `~/.config`           |
| `XDG_DATA_HOME`   | `~/.local/share`      |
| `XDG_LIB_HOME`    | `~/.local/lib`        |
| `XDG_STATE_HOME`  | `~/.local/state`      |

### Scripts

> Docs coming soon.

## 🖌️ Personalize <a id="personalize"></a>

> Docs coming soon.

## 💡 Inspiration <a id="inspiration"></a>

There are tons of great dotfile and machine setup repos out there. In
particular, I took inspiration from these gems:

- [dreamsofcode-io/dotfiles](https://github.com/dreamsofcode-io/dotfiles)
- [lissy93/brewfile](https://github.com/lissy93/brewfile)
- [lissy93/dotfiles](https://github.com/lissy93/dotfiles) (a lot 😅)
- [nikitavoloboev/dotfiles](https://github.com/nikitavoloboev/dotfiles)
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

## ⚖️ License <a id="license"></a>

Copyright (c) 2021-present Bradley Wojcik. Released under the MIT License. See
[LICENSE](../LICENSE) for details.
