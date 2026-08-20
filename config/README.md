# boldandbrad/dotfiles - config

This directory contains configuration files for packages, apps, and services
to be symlinked onto the system. Symlinks are created and managed by
[`slinky`](https://github.com/boldandbrad/slinky) via [`slinky.psv`](../slinky.psv).

<!-- TODO: explain why symlinks over other approaches -->

## Symlink Locations

*Most* software respects the
[XDG base directory specification](https://specifications.freedesktop.org/basedir-spec/latest/index.html)
when storing settings, cache and state. This pattern creates consistency while
keeping `$HOME` free of clutter.

XDG environment variables are defined in [`aliae.yaml`](./aliae/aliae.yaml),
and are sourced on shell startup before symlinking configs. As a result, most
configs in this directory get symlinked under `XDG_CONFIG_HOME`.

