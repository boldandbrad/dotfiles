#!/usr/bin/env bash

# intended for remote use. clones this repo and does some basic system setup.
# curl -L https://raw.githubusercontent.com/boldandbrad/dotfiles/main/prep.sh | bash

REPOSITORY="https://github.com/boldandbrad/dotfiles.git"

function pull_dotfiles {
  # TODO: check for git
  git clone $REPOSITORY ~/Setup/dotfiles
}

pull_dotfiles