# 02: Proofs

```sh
make -C src/02-proofs build
make -C src/02-proofs run
```

Run from the repository root inside `nix develop`.

Study `identity`, `swap`, and `addZero` in `Proofs.lean`. Write `p → p` as a tactic proof and prove that swapping a conjunction twice returns its original order. Temporarily remove an `exact` line to inspect the remaining goal, then restore a complete proof before committing.

Editor checks: Unicode input for `∧`, `→`, and `·`; indentation after `by`, `constructor`, and case bullets; theorem navigation and outline; goal display and diagnostics when the language server integration is ready.
