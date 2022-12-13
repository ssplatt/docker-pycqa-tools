.PHONY: build hadolint

hadolint:
	./scripts/hadolint.sh

build:
	./scripts/docker-build.sh

update-deps:
	./scripts/update-deps.sh

create-virtualenv:
	./scripts/create-virtualenv.sh
