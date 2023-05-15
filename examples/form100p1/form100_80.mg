Infix * 355 right := mul_nat.

Section FTA1.

Let P := {p :e omega | prime_nat p}.

Theorem form100_80_v1: forall n :e omega, 0 :e n ->
  exists k :e omega,
  exists ps :e P :^: k, n = nat_primrec 1 (fun i r => ps i * r) k
  /\ forall k' :e omega,
     forall ps' :e P :^: k', n = nat_primrec 1 (fun i r => ps' i * r) k'
       -> k = k' /\ exists f:set -> set, bij k k f /\ forall i :e k, ps i = ps' (f i).
Admitted.

End FTA1.

Section explicit_Nats_one.

Variable N : set.
Variable one : set.
Variable S : set -> set.

Infix + 360 right := explicit_Nats_one_plus N one S.
Infix * 355 right := explicit_Nats_one_mult N one S.
Infix ^ 342 right := explicit_Nats_one_exp N one S.

Definition explicit_Nats_one_divides : set -> set -> prop
 := fun m n => m :e N /\ n :e N /\ exists q :e N, q * m = n.

Definition explicit_Nats_one_prime : set -> prop
 := fun p => p :e N /\ forall n :e N, explicit_Nats_one_divides n p -> n = one \/ n = p.

Hypothesis HN: explicit_Nats N one S.

Section FTA2.

Let P := {p :e N | explicit_Nats_one_prime p}.

Theorem form100_80_v2: forall n :e N,
  exists k :e omega,
  exists ps :e P :^: k, n = nat_primrec 1 (fun i r => ps i * r) k
  /\ forall k' :e omega,
     forall ps' :e P :^: k', n = nat_primrec 1 (fun i r => ps' i * r) k'
       -> k = k' /\ exists f:set -> set, bij k k f /\ forall i :e k, ps i = ps' (f i).
Admitted.

End FTA2.

End explicit_Nats_one.