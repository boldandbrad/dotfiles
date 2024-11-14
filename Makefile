
install:
	'./unpack.sh'

update-dotbot:
	git submodule update --remote vendor/dotbot

update-tpm:
	git submodule update --remote vendor/tpm

update-themes:
	git submodule update --remote vendor/catppuccin-alacritty
