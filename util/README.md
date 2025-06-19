# boldandbrad/dotfiles - util

This directory contains system specific configurations, setup scripts, and
assets. The relevant utilities for the given host system are automatically
sourced while [unpacking](../unpack.sh). If any manual steps are necessary, the
unpack script will note it.

> [!NOTE]
> While utilities exist for several systems, only macOS is fully supported at
> this time. Utilities for other systems are considered incomplete or unstable,
> and their eventual support is not guaranteed.

Each system type has a subdirectory containing scripts that do the following,
among other things:

- Check for and install system updates
- Install or update packages and apps
- Set system level settings and customization
