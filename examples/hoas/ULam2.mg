Theorem ulamp_id : forall G:set -> prop, ulamp G (lam (fun x => x)).
let G.
apply ulamp_lam.
let x. prove ulamp (adj G x) x.
apply ulamp_var.
apply adjI2.
Qed.

Theorem ulam_id_ex : exists F, ulamp emp F /\ forall x, betaeq (adj emp x) (ap F x) x.
witness (lam (fun x => x)).
apply andI.
- prove ulamp emp (lam (fun x => x)). apply ulamp_id.
- let x.
  prove betaeq (adj emp x) (ap (lam (fun x => x)) x) x.
  apply betaeq_beta (adj emp x) (fun x => x) x.
  + prove forall y, ulamp (adj (adj emp x) y) y. let y. apply ulamp_var. apply adjI2.
  + prove ulamp (adj emp x) x. apply ulamp_var. apply adjI2.
Qed.

Theorem ulam_fp_ex : exists Y, ulamp emp Y /\ forall f, betaeq (adj emp f) (ap Y f) (ap f (ap Y f)).
set W : set -> set := fun f => lam (fun x => ap f (ap x x)).
set Y := lam (fun f => (ap (W f) (W f))).
witness Y.
claim L1: forall G:set -> prop, forall f x, ulamp (adj (adj G f) x) (ap f (ap x x)).
{ let G f x.
  claim L1x: ulamp (adj (adj G f) x) x.
  { apply ulamp_var. apply adjI2. }
  prove ulamp (adj (adj G f) x) (ap f (ap x x)).
  apply ulamp_ap.
  - prove ulamp (adj (adj G f) x) f.
    apply ulamp_var. apply adjI1. apply adjI2.
  - prove ulamp (adj (adj G f) x) (ap x x).
    apply ulamp_ap.
    + exact L1x.
    + exact L1x.
}
claim L2: forall G:set -> prop, forall f, ulamp (adj G f) (W f).
{ let G f.
  prove ulamp (adj G f) (lam (fun x => ap f (ap x x))).
  apply ulamp_lam.
  let x.
  claim L2f: ulamp (adj (adj G f) x) f.
  { apply ulamp_var. apply adjI1. apply adjI2. }
  prove ulamp (adj (adj G f) x) (ap f (ap x x)).
  exact L1 G f x.
}
apply andI.
- prove ulamp emp Y.
  prove ulamp emp (lam (fun f => (ap (W f) (W f)))).
  apply ulamp_lam.
  let f.
  prove ulamp (adj emp f) (ap (W f) (W f)).
  apply ulamp_ap.
  + exact L2 emp f.
  + exact L2 emp f.
- let f.
  prove betaeq (adj emp f) (ap Y f) (ap f (ap Y f)).
  claim L3: beta1 (adj emp f) (ap Y f) (ap (W f) (W f)).
  { apply beta1_beta (adj emp f) (fun f => ap (W f) (W f)) f.
    - let g. prove ulamp (adj (adj emp f) g) (ap (W g) (W g)).
      apply ulamp_ap.
      + exact L2 (adj emp f) g.
      + exact L2 (adj emp f) g.
    - prove ulamp (adj emp f) f. apply ulamp_var. apply adjI2.
  }
  claim L4: betaeq (adj emp f) (ap Y f) (ap (W f) (W f)).
  { apply betaeq_beta1. exact L3. }
  claim L5: betaeq (adj emp f) (ap (W f) (W f)) (ap f (ap (W f) (W f))).
  { prove betaeq (adj emp f) (ap (lam (fun x => ap f (ap x x))) (W f)) (ap f (ap (W f) (W f))).
    apply betaeq_beta (adj emp f) (fun x => ap f (ap x x)) (W f).
    - let x. prove ulamp (adj (adj emp f) x) (ap f (ap x x)).
      exact L1 emp f x.
    - prove ulamp (adj emp f) (W f). exact L2 emp f.
  }
  apply betaeq_tra (adj emp f) (ap Y f) (ap (W f) (W f)) (ap f (ap Y f)) L4.
  apply betaeq_tra (adj emp f) (ap (W f) (W f)) (ap f (ap (W f) (W f))) (ap f (ap Y f)) L5.
  prove betaeq (adj emp f) (ap f (ap (W f) (W f))) (ap f (ap Y f)).
  apply betaeq_sym.
  apply betaeq_beta1.
  prove beta1 (adj emp f) (ap f (ap Y f)) (ap f (ap (W f) (W f))).
  apply beta1_ap2.
  + exact L3.
  + prove ulamp (adj emp f) f. apply ulamp_var. apply adjI2.
Qed.
