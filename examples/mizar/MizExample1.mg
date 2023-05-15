Theorem xboole_0_t7: forall X, X <> 0 -> exists x, x :e X.
let X. assume HX: X <> 0.
apply xm (exists x, x :e X).
- assume H1. exact H1.
- assume H1: ~exists x, x :e X.
  prove False. apply HX.
  prove X = 0.
  apply setext.
  let x. apply iffI.
  + assume Hx: x :e X.
    prove False.
    apply H1. witness x. exact Hx.
  + assume Hx: x :e 0.
    prove False.
    exact EmptyE x Hx.
Qed.
