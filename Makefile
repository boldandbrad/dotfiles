
build:
	podman build --dns=8.8.8.8 . -t boldandbrad/alpine:latest

run:
	podman run --dns=8.8.8.8 -it localhost/boldandbrad/alpine

install:
	'./unpack.sh'

update-tpm:
	git submodule update --remote vendor/tpm

update-themes:
	git submodule update --remote vendor/catppuccin-bat
