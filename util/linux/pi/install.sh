
# TODO: update entire script

sudo apt update
sudo apt upgrade

# install pipx
if ! type pipx >/dev/null; then
	pip install pipx
	export PATH="~/.local/bin:$PATH"
fi

# install apt packages
apt install -y autojump
apt install -y bat
apt install -y eza
# apt install -y git
# apt install -y httpie
# apt install -y podman
apt install -y zsh
apt install -y zsh-autosuggestions
apt install -y zsh-syntax-highlighting

# apt install snapd

# snap install core

# snap install codium --classic
