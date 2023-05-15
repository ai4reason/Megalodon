Theorem Random3_25_neg: (forall X0:(set -> (set -> prop)), (forall X1:(set -> (set -> set)), (forall X2:(set -> prop), (forall X3:(set -> prop), (forall X4:(set -> set), (forall X5:set, (forall X6:set, (forall X7:set, ((and (X6 = ((X1 ((X1 X5) ((X1 X7) ((X1 ((X1 ((X1 ((X1 X6) ((X1 ((X1 X5) ((X1 X5) ((X1 ((X1 X5) ((X1 (X4 X5)) ((X1 ((X1 X7) ((X1 X6) ((X1 X6) X6)))) X5)))) ((X1 (X4 ((X1 ((X1 (X4 X7)) X5)) ((X1 X5) X5)))) ((X1 X6) ((X1 X6) ((X1 ((X1 ((X1 X5) ((X1 ((X1 X5) ((X1 (X4 X6)) X7))) (X4 ((X1 X7) X5))))) X6)) (X4 ((X1 ((X1 X7) ((X1 X5) ((X1 (X4 ((X1 X5) X7))) X5)))) ((X1 ((X1 ((X1 X6) ((X1 (X4 X5)) X6))) X6)) (X4 (X4 ((X1 ((X1 ((X1 ((X1 X5) ((X1 ((X1 X6) ((X1 ((X1 X7) X5)) X7))) X6))) X7)) ((X1 X7) ((X1 X5) X5)))) X6)))))))))))))) ((X1 ((X1 ((X1 ((X1 ((X1 X6) ((X1 X5) X5))) (X4 (X4 ((X1 X7) (X4 (X4 ((X1 X7) X5)))))))) X5)) X6)) ((X1 X6) X7))))) X5)) X5)) (X4 X6))))) ((X1 ((X1 (X4 ((X1 (X4 ((X1 ((X1 ((X1 ((X1 X7) ((X1 (X4 (X4 ((X1 ((X1 X5) X6)) X7)))) (X4 ((X1 X5) X5))))) X5)) (X4 X5))) ((X1 ((X1 ((X1 ((X1 ((X1 X5) X7)) (X4 (X4 (X4 X7))))) X7)) X6)) X5)))) ((X1 ((X1 ((X1 X6) X5)) (X4 X6))) X6)))) X7)) X6)))) (exists X8:set, (X3 (X4 X5)))))))))))) -> forall p:prop, p.
assume HC: forall r:set -> set -> prop,
   forall g : set -> set -> set,
   forall p q : set -> prop,
   forall f : set -> set,
   forall x y z : set,
   (y = ((g ((g x) ((g z) ((g ((g ((g ((g y) ((g ((g x) ((g x) ((g ((g x) ((g (f x)) ((g ((g z) ((g y) ((g y) y)))) x)))) ((g (f ((g ((g (f z)) x)) ((g x) x)))) ((g y) ((g y) ((g ((g ((g x) ((g ((g x) ((g (f y)) z))) (f ((g z) x))))) y)) (f ((g ((g z) ((g x) ((g (f ((g x) z))) x)))) ((g ((g ((g y) ((g (f x)) y))) y)) (f (f ((g ((g ((g ((g x) ((g ((g y) ((g ((g z) x)) z))) y))) z)) ((g z) ((g x) x)))) y)))))))))))))) ((g ((g ((g ((g ((g y) ((g x) x))) (f (f ((g z) (f (f ((g z) x)))))))) x)) y)) ((g y) z))))) x)) x)) (f y))))) ((g ((g (f ((g (f ((g ((g ((g ((g z) ((g (f (f ((g ((g x) y)) z)))) (f ((g x) x))))) x)) (f x))) ((g ((g ((g ((g ((g x) z)) (f (f (f z))))) z)) y)) x)))) ((g ((g ((g y) x)) (f y))) y)))) z)) y)))
   /\
   (exists _:set, q (f x)).
set r : set -> set -> prop := fun x y => False.
set g : set -> set -> set := fun x y => Empty.
set p : set -> prop := fun x => False.
set q : set -> prop := fun x => False.
set f : set -> set := fun x => Empty.
set x : set := Empty.
set y : set := Empty.
set z : set := Empty.
claim L1: exists _:set, False.
{ exact andER (Empty = Empty) (exists _:set, False) (HC r g p q f x y z). }
apply L1.
let w. assume H1: False.
prove False. exact H1.
Qed.

