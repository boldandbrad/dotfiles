
install:
	'./unpack.sh'

lint:
	pre-commit run --all-files

update-dotbot:
	git submodule update --remote vendor/dotbot
