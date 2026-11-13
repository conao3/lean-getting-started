# Lean getting started

Learn Lean 4 through small, independent Lake projects while developing [leaner-ts-mode](https://github.com/conao3/leaner-ts-mode.el).

## Layout

```text
src/
  01-basics/   Definitions, types, evaluation, and IO
  02-proofs/   Propositions, tactic proofs, and Unicode
```

Each directory has its own `lakefile.toml`, `lean-toolchain`, and `lake-manifest.json`. All projects belong to this Git repository. Lean 4.35.0 and Lake are supplied by the locked Nix environment.

## Start

```sh
nix develop
git config core.hooksPath .githooks
make check
make -C src/01-basics run
make -C src/02-proofs run
```

Build and run the packaged first example with `nix run`. `nix build` builds both examples.

For an existing Emacs daemon, use direnv and `envrc-global-mode` so each buffer receives the project's Nix environment. Run `direnv allow` once at the repository root, open a Lean file, and use `M-x envrc-reload` if the buffer was already open. Check `M-: (executable-find "lake")` in that buffer; it should return a Nix store path. Running `nix develop` in a separate terminal does not update an already running Emacs daemon.

Open `src/01-basics/Basics.lean` or `src/02-proofs/Proofs.lean` in Emacs and enable `leaner-ts-mode`. Press `C-c C-e` in the Lean source buffer to connect Eglot, then `C-c C-g` for the infoview. Each source directory is its own Lake project. This repository supplies exercises; editor features are developed in `leaner-ts-mode.el`.

## Add a practice project

Run inside `nix develop` from the repository root:

```sh
mkdir src/03-functions
cd src/03-functions
lake init Functions
printf 'include ../../project.mk\n' > Makefile
lake update
cd ../..
make check
```

For `make run`, name the executable `demo` in the generated Lake configuration. Add a README explaining the topic, exercises, and editor behavior to check. The root build automatically discovers the new Lake configuration. Keep toolchains aligned with the locked Nix Lean version; commit the generated manifest and source files.

## References

- [Functional Programming in Lean](https://lean-lang.org/functional_programming_in_lean/)
- [Theorem Proving in Lean](https://lean-lang.org/theorem_proving_in_lean4/)
- [Lake reference](https://lean-lang.org/doc/reference/latest/Build-Tools-and-Distribution/Lake/)

## License

Apache-2.0.
