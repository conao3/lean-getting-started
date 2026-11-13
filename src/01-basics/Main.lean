import Basics

def main : IO Unit := do
  IO.println (Basics.greet "Lean")
  IO.println s!"double 21 = {Basics.double 21}"
