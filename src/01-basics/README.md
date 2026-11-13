# 01: Basics

```sh
make -C src/01-basics build
make -C src/01-basics run
```

Run from the repository root inside `nix develop`.

Study `Basics.lean`, then `Main.lean`. Change the greeting and implement a `triple` function with an `example : triple 3 = 9 := rfl` check. Evaluate expressions with `#check` and `#eval` while studying.

Editor checks: highlighting of keywords, names, strings, and numbers; indentation after `:=` and `do`; navigation through namespace and definitions; imenu entries; build output through `compile`.
