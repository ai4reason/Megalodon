Infix + 360 right := add_nat.
Infix * 355 right := mul_nat.

Infix ^ 342 right := exp_nat.

Theorem form100_23_v1 : forall a b c :e omega :\: 1, a ^ 2 + b ^ 2 = c ^ 2
  -> coprime_nat a b
  -> odd_nat a
  -> even_nat b
  -> odd_nat c
  -> exists m :e omega :\: 2, exists n :e m :\: 1,
         coprime_nat m n
      /\ (a + n ^ 2 = m ^ 2)
      /\ (b = 2 * m * n)
      /\ (c = m ^ 2 + n ^ 2).
Admitted.

Section explicit_Nats_one.

Variable N : set.
Variable one : set.
Variable S : set -> set.

Infix + 360 right := explicit_Nats_one_plus N one S.
Infix * 355 right := explicit_Nats_one_mult N one S.
Infix ^ 342 right := explicit_Nats_one_exp N one S.

Definition explicit_Nats_one_divides : set -> set -> prop
 := fun m n => m :e N /\ n :e N /\ exists q :e N, q * m = n.

Definition explicit_Nats_one_coprime : set -> set -> prop
 := fun a b => a :e N /\ b :e N
      /\ forall x :e N, explicit_Nats_one_divides x a -> explicit_Nats_one_divides x b -> x = 1.

Hypothesis HN: explicit_Nats N one S.

Let two := S one.

Definition explicit_Nats_one_evenp : set -> prop := fun n => n :e N /\ exists m :e N, n = two * m.
Definition explicit_Nats_one_oddp : set -> prop := fun n => n :e N /\ forall m :e N, n <> two * m.

Theorem form100_23_v2 : forall a b c :e N, a ^ two + b ^ two = c ^ two
  -> explicit_Nats_one_coprime a b
  -> explicit_Nats_one_oddp a
  -> explicit_Nats_one_evenp b
  -> explicit_Nats_one_oddp c
  -> exists m n :e N,
         explicit_Nats_one_coprime m n
      /\ (a + n ^ two = m ^ two)
      /\ (b = two * m * n)
      /\ (c = m ^ two + n ^ two).
Admitted.

End explicit_Nats_one.