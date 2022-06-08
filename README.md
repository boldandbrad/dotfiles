# dotfiles

This is my personal dotfiles repo. I have made it open
source to serve as an example for others. If you wish to
use it, please fork and make your own customizations to the
contained files before install.

> Currently only compatible with macOS.

## Toolset

- [Homebrew](https://brew.sh): install and manage apps and tools
- [Dotbot](https://github.com/anishathalye/dotbot): install and manage dotfiles
- [GitHub CLI](https://cli.github.com): clone and manage user public repos
- [Dockutil](https://github.com/kcrawford/dockutil): setup and manage macOS dock

> I prefer a global `dotbot` install with homebrew over
> a submodule because it allows for a cleaner repo,
> and I can include it in my [Brewfile](/brew/Brewfile) for install alongside
> the rest of my dependencies.

## Features

- Ensures Apple Developer Command Line Tools are installed
- Ensures preinstalled software is up to date via `softwareupdate`
- Ensures Homebrew is installed
- Ensures all apps and tools are installed via Homebrew Bundle
- Ensures Homebrew autoupdate is setup and running
- Ensures user dotfiles are installed
- Ensures macOS dock is setup
- Ensures user's github repos are cloned

### Coming Soon

- Ensures user system preferences are setup via `defaults`
- Ensure default applications for file types are setup?
- Remote install script?
- Debian support?

## Install

Clone this repo into `~/Setup/dotfiles`

```zsh
git clone git://github.com/boldandbrad/dotfiles.git ~/Setup/dotfiles
```

Install apps, tools, and dotfiles

```zsh
cd ~/Setup/dotfiles
./install.zsh
```

> Note that installation should be an idempotent
> operation. Meaning it can be safely run multiple times.

## Maintenance

Any local dotfile modifications can be easily pushed to github
at any time with `git`. This ensures that updates are
backed-up and can be pulled from other devices.

For a more seamless experience, consider scheduling these
tasks to run periodically.

### Dotbot

Refresh dotfiles

```zsh
dotbot
```

### Homebrew

Check if all `~/.Brewfile` dependencies are installed

```zsh
brew bundle check -v
```

Install everything from `~/.Brewfile`

```zsh
brew bundle install
```

Uninstall dependencies not listed in `~/.Brewfile`

```zsh
brew bundle cleanup
```

## Inspiration

- [dotfiles-stefanzweifel](https://github.com/stefanzweifel/dotfiles)
- [dotfiles-superatomic](https://github.com/superatomic/dotfiles)
- [dotfiles-webpro](https://github.com/webpro/dotfiles)

## License

Copyright (c) 2022 Bradley Wojcik. Released under the MIT
License. See [LICENSE](LICENSE) for details.
