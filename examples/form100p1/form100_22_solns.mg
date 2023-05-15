Theorem form100_22_v3: forall g:set -> set, ~surj omega (Power omega) g.
let g. assume H1. apply H1.
assume H1: forall n :e omega, g n :e Power omega.
assume H2: forall X :e Power omega, exists n :e omega, g n = X.
set D := {n :e omega | n /:e g n}.
claim L1: D :e Power omega.
{ apply PowerI.
  let n. assume Hn: n :e D.
  prove n :e omega.
  exact SepE1 omega (fun n => n /:e g n) n Hn.
}
apply H2 D L1.
let n. assume H3. apply H3.
assume H3: n :e omega.
assume H4: g n = D.
claim L2: n /:e D.
{ assume H5: n :e D.
  apply SepE2 omega (fun n => n /:e g n) n H5.
  prove n :e g n. rewrite H4. exact H5.
}
apply L2. prove n :e D. apply SepI.
- exact H3.
- prove n /:e g n. rewrite H4. exact L2.
Qed.

Theorem form100_22_v1: ~equip omega (Power omega).
assume H1: equip omega (Power omega).
apply H1.
let g. assume H2: bij omega (Power omega) g.
apply form100_22_v3 g.
prove surj omega (Power omega) g.
apply bij_surj. exact H2.
Qed.

Theorem form100_22_v2: forall f:set -> set, ~inj (Power omega) omega f.
let f. assume H1. apply H1.
assume H1: forall X :e Power omega, f X :e omega.
assume H2: forall X Y :e Power omega, f X = f Y -> X = Y.
set D := {f X | X :e Power omega, f X /:e X}.
claim L1: D :e Power omega.
{ apply PowerI.
  let n. assume H3: n :e D.
  apply ReplSepE_impred (Power omega) (fun X => f X /:e X) f n H3.
  let X. assume HX: X :e Power omega.
  assume H4: f X /:e X.
  assume H5: n = f X.
  prove n :e omega. rewrite H5. apply H1. exact HX.
}
claim L2: f D /:e D.
{ assume H3: f D :e D.
  apply ReplSepE_impred (Power omega) (fun X => f X /:e X) f (f D) H3.
  let X. assume HX: X :e Power omega.
  assume H4: f X /:e X.
  assume H5: f D = f X.
  claim L2a: D = X.
  { exact H2 D L1 X HX H5. }
  apply H4. rewrite <- L2a. exact H3.
}
apply L2.
prove f D :e D.
apply ReplSepI.
- prove D :e Power omega. exact L1.
- prove f D /:e D. exact L2.
Qed.
