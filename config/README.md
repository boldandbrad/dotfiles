# boldandbrad/dotfiles - config

This directory contains configuration files for packages, apps, and services
intended to be symlinked onto the system.

<!-- TODO: create a note on why the symlink approach -->

## Symlink Locations

Most packages and apps respect the
[XDG base directory specification](https://specifications.freedesktop.org/basedir-spec/latest/index.html)
to determine where to store and locate their settings and data. This creates
consistency while keeping your `$HOME` free of clutter.

The following XDG variables are defined in [`aliae.yaml`](./aliae/aliae.yaml),
and are sourced on shell startup before symlinking configs.

| ENV Variable      | Location             |
| :---------------- | :------------------- |
| `XDG_BIN_HOME`    | `~/.local/bin`       |
| `XDG_CACHE_HOME`  | `~/.local/var/cache` |
| `XDG_CONFIG_HOME` | `~/.config`          |
| `XDG_DATA_HOME`   | `~/.local/share`     |
| `XDG_LIB_HOME`    | `~/.local/lib`       |
| `XDG_STATE_HOME`  | `~/.local/state`     |

As a result, most configs in this directory get symlinked under
`XDG_CONFIG_HOME`. The exact locations on disk that each config should be
symlinked to are specified in [`bin/dots`](../bin/dots).

## Configs

> Docs coming soon.
