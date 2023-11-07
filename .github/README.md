# dotfiles

![macOS](https://badgen.net/badge/icon/macOS/blue?icon=apple&label)

This is my personal dotfiles repo. I have made it open source to serve as an
example for others. If you wish to use it, please fork and make your own
customizations to the contained files before install.

## Toolset

- [Homebrew](https://brew.sh): install and manage apps and tools
- [Dotbot](https://github.com/anishathalye/dotbot): install and manage dotfiles
  > I prefer a global `dotbot` install with `homebrew` over a submodule
  > because it allows for a cleaner repo, and I can include it in my
  > [Brewfile](/brew/Brewfile) for install alongside the rest of my
  > dependencies.
- [GitHub CLI](https://cli.github.com): clone and manage user public repos
- [Dockutil](https://github.com/kcrawford/dockutil): setup and manage macOS dock
- [apply-user-defaults](https://github.com/zero-sh/apply-user-defaults): setup
  and manage macOS system and app preferences

## Features

- Ensures Apple Developer Command Line Tools are installed
- Ensures preinstalled software is up to date via `softwareupdate`
- Ensures Homebrew is installed
- Ensures all apps and tools are installed via Homebrew Bundle
- Ensures Homebrew autoupdate is setup and running
- Ensures user dotfiles are installed
- Ensures macOS dock is setup
- Ensures user's github repos are cloned
- Ensures user's preferred VSCodium extensions are installed

### Coming Soon

- Ensures all user system preferences are setup via `defaults` or
  `apply-user-defaults`
- Ensure default applications for file types are setup via `duti` or
  alternative?
- Remote install script?
- Debian support?
- Customization guide
- More verbose and explicit documentation
- Raycast configs/extensions?
- Obsidian configs/extensions?

## Install

### Remote Installation

> The [remote install script](./remote-install.sh) explains what it will do and prompts before doing so.

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/boldandbrad/dotfiles/main/remote-install.sh)"
```

### Manual Installation

Clone this repo into `~/Setup/dotfiles`:

```sh
git clone https://github.com/boldandbrad/dotfiles.git ~/Setup/dotfiles
```

Install apps, tools, and dotfiles:

```sh
cd ~/Setup/dotfiles && ./install.sh
```

> Note that installation should be an idempotent operation. Meaning it can be
> safely run multiple times.

## Maintenance

Any local dotfile modifications can be easily pushed to github at any time with
`git`. This ensures that updates are backed-up and can be pulled from other
devices.

For a more seamless experience, consider scheduling these tasks to run
periodically.

### Dotbot

Refresh dotfiles

```zsh
refresh
```

### Homebrew

Check if all `~/.config/homebrew/Brewfile` dependencies are installed

```zsh
brew check
```

Install everything listed in `~/.config/homebrew/Brewfile`

```zsh
brew apply
```

Uninstall everything not listed in `~/.config/homebrew/Brewfile`

```zsh
brew prune
```

## Inspiration

There are tons of great dotfile and machine setup repos out there. In
particular, I took inspiration from these gems:

- [lissy93/brewfile](https://github.com/lissy93/brewfile)
- [lissy93/dotfiles](https://github.com/lissy93/dotfiles)
- [nikitavoloboev/dotfiles](https://github.com/nikitavoloboev/dotfiles)
- [stefanzweifel/dotfiles](https://github.com/stefanzweifel/dotfiles)
- [superatomic/dotfiles](https://github.com/superatomic/dotfiles)
- [webpro/dotfiles](https://github.com/webpro/dotfiles)

## License

Copyright (c) 2021-present Bradley Wojcik. Released under the MIT License. See
[LICENSE](LICENSE) for details.
