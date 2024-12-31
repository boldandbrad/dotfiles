
install:
	'./unpack.sh'

update-tpm:
	git submodule update --remote vendor/tpm

update-themes:
	git submodule update --remote vendor/catppuccin-bat
