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

Open `src/01-basics/Basics.lean` in Emacs and follow its README. In Emacs, make Lean and Lake available through the Nix development environment. Select the Lake project directory when starting a language server. This repository supplies exercises; editor features are developed in `leaner-ts-mode.el`.

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
