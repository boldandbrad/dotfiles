#!/usr/bin/env bash

# intended for remote use. clones this repo and does some basic system setup.

REPOSITORY="https://github.com/boldandbrad/dotfiles.git"

function pull_dotfiles {
  # TODO: check for git
  git clone $REPOSITORY ~/Setup/dots
}

pull_dotfiles