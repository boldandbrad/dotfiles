# dotfiles

This is my personal dotfiles repo. I have made it open
source to serve as an example for others. If you wish to
use it, please fork and make your own customizations to the
contained files before install.

*dotfiles* uses [Dotbot](https://github.com/anishathalye/dotbot)
for dotfile install and management.

> Currently only compatible with macOS.

## Install

Clone this repo into your home directory:

```zsh
git clone git://github.com/bradleycwojcik/dotfiles.git ~/dotfiles
```

Install [Dotbot](https://github.com/anishathalye/dotbot):

```zsh
brew install dotbot
```

> I prefer a global `dotbot` install with homebrew over
> a submodule because it allows for a cleaner repo,
> and I can include it in a Brewfile for install alongside
> the rest of my dependencies during machine setup.

Install the dotfiles:

```zsh
cd ~/dotfiles
dotbot -c install.conf.yaml
```

> Note that `dotbot` installation should be an idempotent
> operation. Meaning it can be safely run multiple times.

## Updates

Any local modifications made to your dotfiles can be easily
pushed at any time with `git` to ensure that updates are
backed-up and can be pulled from other devices.

Likewise, be sure to periodically `git pull` the latest
updates.

For a more seamless experience, consider scheduling these
tasks to run.

## License

Copyright (c) 2021 Bradley Wojcik. Released under the MIT
License. See [LICENSE](LICENSE) for details.
