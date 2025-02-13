# Roadmap

Planned changes and updates to this repo.

## Documentation

- feature explanations
- personalization guide
- gif/video demo in readme

## Environment Support

- alpine-linux
  - dotfile symlinking
  - app/pkg install
- cicd: github actions builds
- container support
  - add Containerfile
- debian-linux
  - dotfile symlinking
  - app/pkg install
- github-codespaces support
- macos
  - system settings setup via `defaults` or `apply-user-defaults`
- virtual machine automation
  - add Vagrantfile

## Features

- command: `sys-clean` to clean up caches and system data
- command: `dot-commit` to automatically commit and push dotfile repo changes to
  github
- dir: Install dotfiles directly to `~/Dotfiles` instead of `~/Setup/dotfiles`?
- keyboard: dvorak/programmers dvorak keyboard layout setup?
- shells: cleanup aliases, env, and function setup via aliae

## Tool Configs

- git: move away from vscodium as a merge and difftool
- lazygit: Catppuccin theme
- mackup: Store other app settings via `mackup`?
- obsidian: backup vault settings?
- sketchybar: Add and configure Sketchybar custom menubar for macOS?
- skhd: Add and configure skhd custom global keybindings for macOS?
- wezterm: tab and multiplexer configuration
- yabai: Add and configure Yabai tiling window manager for macOS?
