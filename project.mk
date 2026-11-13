.PHONY: build
build:
	lake --wfail build

.PHONY: run
run:
	lake exe demo

.PHONY: clean
clean:
	lake clean
