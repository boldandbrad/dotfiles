#!/bin/zsh

# clone all of my public repos (except dotfiles) into ~/Developer

if ! gh auth status 2>/dev/null; then
  echo "You need to login to gh in order to clone repos..."
  gh auth login
fi

if gh auth status 2>/dev/null; then
  echo
  echo "Cloning public repos..."
  gh repo list "$GH_USER" --limit 100 | while read line; do
      echo "$line" | read repo _
      REPO_NAME="${repo##*${GH_USER}/}"
      CLONE_PATH=""
      if [[ $line =~ "public" && ! $line =~ "fork" && ! $line =~ "/dotfiles" ]]; then
          CLONE_PATH=~/Developer/repos/$REPO_NAME
      elif [[ $line =~ "fork" ]]; then
          CLONE_PATH=~/Developer/forks/$REPO_NAME
      fi
      if [[ ! -z $CLONE_PATH && ! -d $CLONE_PATH ]]; then
          gh repo clone "$repo" $CLONE_PATH
      elif [ ! -z $CLONE_PATH ]; then
          echo "$REPO_NAME already cloned"
      fi
  done

  echo
  echo "Repos cloned into ~/Developer!"
else
  echo "Could not detect gh login. Trying logging in via gh auth login and rerun the script."
fi
