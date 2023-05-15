Theorem form100_31_v1: forall r s :e omega,
  forall Y, infinite Y -> forall C :e s :^: {X :e Power Y | equip X r},
  exists Y' c, Y' c= Y /\ infinite Y' /\ c :e s
     /\ (forall X :e {X :e Power Y | equip X r}, C X = c).
Admitted.
