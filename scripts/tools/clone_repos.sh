#!/usr/bin/env bash

################################################################
# tools/clone_repos.sh - clone user's GitHub repos             #
################################################################
# Clone GitHub user's unarchived repos (except dotfiles), as   #
# well as their organization(s)' repos.                        #
#                                                              #
# DESTINATIONS:                                                #
#   Source repos    -> ~/Developer/github/USER|ORG/repos       #
#   Forks           -> ~/Developer/github/USER|ORG/forks       #
#   Private repos   -> Not yet supported                       #
################################################################

# clone unarchived src repos
function clone_src_repos () {
  user_org=$1
  echo -e "\nCloning $user_org's source repos..."
  gh repo list $1 --source --no-archived --limit 100 | while read line; do
    repo_full_name=$(echo "${line}" | cut -f1 | xargs)
    repo_short_name=$(echo "${repo_full_name}" | cut -d "/" -f2)
    clone_path="${GITHUB_REPO_DIR}/$user_org/repos/$repo_short_name/"

    # skip dotfiles repo
    if [[ ! $repo_short_name = "dotfiles" ]]; then
      # clone if destination doesn't already exist
      if [[ ! -z $clone_path && ! -d $clone_path ]]; then
        echo "- Cloning $repo_full_name"
        gh repo clone $repo_full_name $clone_path -- -q
      else
        echo " Skipping $repo_full_name. Already cloned!"
      fi
    fi
  done
}

# clone unarchived forks
function clone_forks () {
  user_org=$1
  echo -e "\nCloning $user_org's forks..."
  gh repo list $1 --fork --no-archived --limit 100 | while read line; do
    repo_full_name=$(echo "${line}" | cut -f1 | xargs)
    repo_short_name=$(echo "${repo_full_name}" | cut -d "/" -f2)
    clone_path="${GITHUB_REPO_DIR}/$user_org/forks/$repo_short_name/"

    # skip dotfiles repo
    if [[ ! $repo_short_name = "dotfiles" ]]; then
      # clone if destination doesn't already exist
      if [[ ! -z $clone_path && ! -d $clone_path ]]; then
        echo "- Cloning $repo_full_name"
        gh repo clone $repo_full_name $clone_path -- -q
      else
        echo " Skipping $repo_full_name. Already cloned!"
      fi
    fi
  done
}

# clone archived repos
function clone_archived_repos () {
  user_org=$1
  echo -e "\nCloning $user_org's forks..."
  gh repo list $1 --archived --limit 100 | while read line; do
    repo_full_name=$(echo "${line}" | cut -f1 | xargs)
    repo_short_name=$(echo "${repo_full_name}" | cut -d "/" -f2)
    clone_path="${GITHUB_REPO_DIR}/$user_org/archived/$repo_short_name/"

    # skip dotfiles repo
    if [[ ! $repo_short_name = "dotfiles" ]]; then
      # clone if destination doesn't already exist
      if [[ ! -z $clone_path && ! -d $clone_path ]]; then
        echo "- Cloning $repo_full_name"
        gh repo clone $repo_full_name $clone_path -- -q
      else
        echo " Skipping $repo_full_name. Already cloned!"
      fi
    fi
  done
}

# check if github cli exists
if hash gh 2> /dev/null; then
  # check github cli is logged in
  if ! gh auth status >/dev/null; then
    echo -e "\nYou need to login to gh in order to clone repos..."
    gh auth login
  fi

  if gh auth status >/dev/null; then
    # clone user's repos
    clone_src_repos $GITHUB_USER
    clone_forks $GITHUB_USER
    # clone_archived_repos $GITHUB_USER

    # clone user's org's repos
    gh org list | while read org; do
      clone_src_repos $org
      clone_forks $org
      # clone_archived_repos $org
    done

    echo -e "\n${GREEN_B}Repos cloned into ${GITHUB_REPO_DIR}!${RESET}"
  else
    echo -e "\n${YELLOW_B}Skipping repo clones. Could not detect gh login. Try logging in via 'gh auth login' and rerun script.${RESET}"
  fi
else
  echo -e "\n${YELLOW_B}Skipping repo clones. GitHub CLI is not installed.${RESET}"
fi
