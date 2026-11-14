namespace Basics

#check (3 : Nat)
#check "hello"
#check true

#eval (3 : Nat) + 4

#check 10 + 20
#eval 10 + 20

def answer : Nat := 10 + 20

#check answer
#eval answer

def double (n : Nat) : Nat := n + n

def double1 (n : Nat) := n + n

def greet (name : String) : String :=
  s!"Hello, {name}!"

example : double 3 = 6 := rfl

#check double

#eval double 2
#eval double (4 + 1)

def add (a : Nat) (b : Nat) : Nat := a + b

#check add
#eval add 1 2

def add5 : Nat → Nat := add 5

end Basics
