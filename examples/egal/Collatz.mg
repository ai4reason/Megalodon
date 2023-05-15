Infix + 360 right := add_nat.
Infix * 355 right := mul_nat.
Infix :/: 353 := div_SNo.

Theorem Collatz_v1: forall f:set -> set -> set,
    (forall m :e omega, f m 0 = m)
 -> (forall m n k :e omega, f m n = 2 * k -> f m (ordsucc n) = k)
 -> (forall m n k :e omega, odd_nat (f m n) -> f m (ordsucc n) = 3 * f m n + 1)
 -> forall m :e omega :\: 1, exists n :e omega, f m n = 1.
Admitted.

Definition Collatz_seq : set -> set -> set := fun m n =>
  nat_primrec m (fun _ r => if even_nat r then r :/: 2 else 3 * r + 1) n.

Theorem Collatz_v2: forall m :e omega :\: 1, exists n :e omega, Collatz_seq m n = 1.
Admitted.
