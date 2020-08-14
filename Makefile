.PHONY: build hadolint

hadolint:
	./scripts/hadolint.sh

build:
	./scripts/docker-build.sh
