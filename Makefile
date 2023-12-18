
install:
	'./unpack.sh'

lint:
	pre-commit run --all-files

update-dotbot:
	git submodule update --remote vendor/dotbot

update-tpm:
	git submodule update --remote vendor/tpm

update-themes:
	git submodule update --remote vendor/catppuccin-alacritty
