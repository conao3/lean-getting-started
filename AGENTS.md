# Lean getting started

Each `src/<number>-<topic>/` directory is an independent Lake project in this Git repository. Keep examples small enough to study while developing `leaner-ts-mode`.

- Enter the environment with `nix develop`.
- Validate with `nix develop --command make check`, then `nix build`.
- Run the first example with `nix run`.
- Format with `nix fmt`.
- Keep `lean-toolchain` files aligned with the Lean version provided by the locked nixpkgs input.
- Each practice project has its own Lake configuration, toolchain, manifest, README, and Makefile including `../../project.mk`.
- The root Makefile discovers projects by `src/*/lakefile.toml` and `src/*/lakefile.lean`.
- Record learning exercises and editor behavior to check in the project's README.
