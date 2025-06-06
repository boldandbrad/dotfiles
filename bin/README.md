# boldandbrad/dotfiles - bin

This directory contains custom binaries and executable scripts, and is
automatically appended to the user's `PATH` during shell startup by
[`aliae`](../config/aliae/aliae.yaml).

## Executables

Invoke these from anywhere.

| Executable                            | Description                                                                                                  |
| :------------------------------------ | :----------------------------------------------------------------------------------------------------------- |
| [`cleanpods`](../bin/cleanpods)       | Clean podman caches without confirmation, and print podman disk usage                                        |
| [`fixpics`](../bin/fixpics)           | Update the created and modified date for all images in the current directory to match their exif create date |
| [`flushdns`](../bin/flushdns)         | Flush macOS dns records                                                                                      |
| [`license`](..bin/license)            | Create an MIT license file in the current working directory                                                  |
| [`tidyup`](../bin/tidyup)             | Trash unwanted directories and files                                                                         |
| [`today`](../bin/license)             | Return today's date in YYYY-MM-DD format                                                                     |
| [`togglehidden`](../bin/togglehidden) | Toggle showing hidden files in macOS Finder                                                                  |
| [`trash`](../bin/trash)               | Move items to trash                                                                                          |
