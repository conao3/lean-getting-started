PROJECTS := $(sort $(patsubst %/,%,$(dir $(wildcard src/*/lakefile.toml src/*/lakefile.lean))))

.PHONY: check
check:
	nix fmt -- --fail-on-change
	$(MAKE) build

.PHONY: build
build:
	@set -eu; for project in $(PROJECTS); do $(MAKE) -C "$$project" build; done

.PHONY: clean
clean:
	@set -eu; for project in $(PROJECTS); do $(MAKE) -C "$$project" clean; done
