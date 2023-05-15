Definition False : prop := forall p:prop, p.
Definition not : prop -> prop := fun A:prop => A -> False.

(* Unicode ~ "00ac" *)
Prefix ~ 700 := not.

Definition and : prop -> prop -> prop := fun A B:prop => forall p:prop, (A -> B -> p) -> p.

(* Unicode /\ "2227" *)
Infix /\ 780 left := and.

Axiom andI : forall (A B : prop), A -> B -> A /\ B.
Axiom andER : forall (A B : prop), A /\ B -> B.

Section Eq.
Variable A:SType.
Definition eq : A->A->prop := fun x y:A => forall Q:A->A->prop, Q x y -> Q y x.
Definition neq : A->A->prop := fun x y:A => ~ eq x y.
End Eq.

Infix = 502 := eq.
(* Unicode <> "2260" *)
Infix <> 502 := neq.

Parameter In:set->set->prop.

Parameter Empty : set.

(* Parameter ordsucc "9db634daee7fc36315ddda5f5f694934869921e9c5f55e8b25c91c0a07c5cbec" "65d8837d7b0172ae830bed36c8407fcd41b7d875033d2284eb2df245b42295a6" *)
Parameter ordsucc : set->set.

Notation Nat Empty ordsucc.

Definition nat_p : set->prop := fun n:set => forall p:set->prop, p 0 -> (forall x:set, p x -> p (ordsucc x)) -> p n.

Theorem nat_0 : nat_p 0.
exact (fun p H _ => H).
Qed.

Theorem nat_ordsucc : forall n:set, nat_p n -> nat_p (ordsucc n).
exact (fun n H1 p H2 H3 => H3 n (H1 p H2 H3)).
Qed.

Theorem nat_ind : forall p:set->prop, p 0 -> (forall n, nat_p n -> p n -> p (ordsucc n)) -> forall n, nat_p n -> p n.
let p.
assume H1: p 0.
assume H2: forall n, nat_p n -> p n -> p (ordsucc n).
claim L1: nat_p 0 /\ p 0.
{
  exact (andI (nat_p 0) (p 0) nat_0 H1).
}
claim L2: forall n, nat_p n /\ p n -> nat_p (ordsucc n) /\ p (ordsucc n).
{
  let n.
  assume H3: nat_p n /\ p n.
  apply H3.
  assume H4: nat_p n.
  assume H5: p n.
  apply andI.
  - prove nat_p (ordsucc n).
    exact (nat_ordsucc n H4).
  - prove p (ordsucc n).
    exact (H2 n H4 H5).
}
let n.
assume H3.
claim L3: nat_p n /\ p n.
{ exact (H3 (fun n => nat_p n /\ p n) L1 L2). }
exact (andER (nat_p n) (p n) L3).
Qed.

Section explicit_Nats.

(* Parameter explicit_Nats "4a59caa11140eabb1b7db2d3493fe76a92b002b3b27e3dfdd313708c6c6ca78f" "3fb62f75e778736947d086a36d35ebe45a5d60bf0a340a0761ba08a396d4123a" *)
Parameter explicit_Nats : set -> set -> (set -> set) -> prop.

Variable N : set.
Variable base : set.
Variable S : set -> set.

Axiom explicit_Nats_E : forall q:prop, 
    (explicit_Nats N base S
  -> (base :e N)
  -> (forall m :e N, S m :e N)
  -> (forall m :e N, S m <> base)
  -> (forall m n :e N, S m = S n -> m = n)
  -> (forall p:set -> prop, p base -> (forall m, p m -> p (S m)) -> (forall m :e N, p m))
  -> q)
 -> explicit_Nats N base S -> q.

Theorem explicit_Nats_ind : explicit_Nats N base S ->
  forall p:set -> prop,
      p base
   -> (forall m :e N, p m -> p (S m))
   -> forall m :e N, p m.
apply explicit_Nats_E.
assume HN HN1 HN2 HN3 HN4 HN5.
let p. assume Hp0 HpS.
claim L1: forall m :e N, m :e N /\ p m.
{ apply HN5.
  - prove base :e N /\ p base. apply andI.
    + exact HN1.
    + exact Hp0.
  - let m. assume Hm: m :e N /\ p m.
    apply Hm. assume Hm1 Hm2.
    prove S m :e N /\ p (S m).
    apply andI.
    + apply HN2. exact Hm1.
    + exact HpS m Hm1 Hm2.
}
let m. assume Hm. prove p m. apply L1 m Hm. exact (fun _ H => H).
Qed.
  
End explicit_Nats.
