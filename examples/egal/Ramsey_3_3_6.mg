Definition TwoRamseyProp : set -> set -> set -> prop
 := fun M N V =>
      forall R:set -> set -> prop,
        (forall x y, R x y -> R y x)
       -> ((exists X c= V, equip M X /\ (forall x y :e X, x <> y -> R x y))
        \/ (exists Y c= V, equip N Y /\ (forall x y :e Y, x <> y -> ~R x y))).

Axiom TwoRamseyProp_equip_lem : forall M M' V V',
  forall R':set -> set -> prop,
  forall f:set -> set,
    equip M M' ->
    bij V V' f ->
        (exists X c= V, equip M X /\ (forall x y :e X, x <> y -> R' (f x) (f y)))
     -> (exists X c= V', equip M' X /\ (forall x y :e X, x <> y -> R' x y)).

Axiom equip_3_I : forall u v w, u <> v -> u <> w -> v <> w -> equip 3 {u,v,w}.

Theorem TwoRamseyProp_3_3_6_lem1 : forall R:set -> set -> prop,
    (forall x y, R x y -> R y x)
 -> forall u v w :e 6, u <> v -> u <> w -> v <> w -> R u v -> R u w -> R v w -> exists X c= 6, equip 3 X /\ (forall x y :e X, x <> y -> R x y).
let R.
assume HR: forall x y, R x y -> R y x.
let u. assume Hu: u :e 6.
let v. assume Hv: v :e 6.
let w. assume Hw: w :e 6.
assume Huv Huw Hvw HRuv HRuw HRvw.
witness {u,v,w}.
apply andI.
- prove {u,v,w} c= 6.
  prove {u,v} :\/: {w} c= 6.
  let y. assume Hy.
  apply binunionE {u,v} {w} y Hy.
  + assume Hy: y :e {u,v}.
    apply UPairE y u v Hy.
    * assume Hy: y = u. rewrite Hy. exact Hu.
    * assume Hy: y = v. rewrite Hy. exact Hv.
  + assume Hy: y :e {w}. rewrite SingE w y Hy. exact Hw.
- apply andI.
  + prove equip 3 {u,v,w}. apply equip_3_I.
    * exact Huv.
    * exact Huw.
    * exact Hvw.
  + prove forall x y :e {u,v,w}, x <> y -> R x y.
    let x. assume Hx.
    let y. assume Hy.
    apply binunionE {u,v} {w} x Hx.
    * { assume Hx: x :e {u,v}.
        apply UPairE x u v Hx.
        - assume Hx: x = u. rewrite Hx.
          apply binunionE {u,v} {w} y Hy.
          + assume Hy: y :e {u,v}.
            apply UPairE y u v Hy.
            * assume Hy: y = u. rewrite Hy.
              assume H. prove False. apply H. reflexivity.
            * assume Hy: y = v. rewrite Hy. assume _. exact HRuv.
          + assume Hy: y :e {w}.
            rewrite SingE w y Hy. assume _. exact HRuw.
        - assume Hx: x = v. rewrite Hx.
          apply binunionE {u,v} {w} y Hy.
          + assume Hy: y :e {u,v}.
            apply UPairE y u v Hy.
            * assume Hy: y = u. rewrite Hy. assume _. apply HR. exact HRuv.
            * assume Hy: y = v. rewrite Hy.
              assume H. prove False. apply H. reflexivity.
          + assume Hy: y :e {w}.
            rewrite SingE w y Hy. assume _. apply HRvw.
      }
    * { assume Hx: x :e {w}.
        rewrite SingE w x Hx.
        apply binunionE {u,v} {w} y Hy.
        - assume Hy: y :e {u,v}.
          apply UPairE y u v Hy.
          + assume Hy: y = u. rewrite Hy. assume _. apply HR. apply HRuw.
          + assume Hy: y = v. rewrite Hy. assume _. apply HR. apply HRvw.
        - assume Hy: y :e {w}.
          rewrite SingE w y Hy.
          assume H. prove False. apply H. reflexivity.
      }
Qed.

Theorem TwoRamseyProp_3_3_6_lem2 : forall R:set -> set -> prop,
     R 0 4
  -> R 4 5
  -> (forall x y, R x y -> R y x)
  -> ((exists X c= 6, equip 3 X /\ (forall x y :e X, x <> y -> R x y))
   \/ (exists Y c= 6, equip 3 Y /\ (forall x y :e Y, x <> y -> ~R x y))).
let R.
assume H04: R 0 4.
assume H45: R 4 5.
assume HR: forall x y, R x y -> R y x.
claim LRC: forall x y, ~R x y -> ~R y x.
{ let x y. assume H1 H2. apply H1. apply HR. exact H2. }
claim L45: forall u :e 4, R u 4 -> R u 5 -> exists X c= 6, equip 3 X /\ (forall x y :e X, x <> y -> R x y).
{ let u. assume Hu: u :e 4.
  assume Hu4: R u 4.
  assume Hu5: R u 5.
  claim Lu: u :e 6.
  { exact nat_trans 6 nat_6 4 In_4_6 u Hu. }
  apply TwoRamseyProp_3_3_6_lem1 R HR u Lu 4 In_4_6 5 In_5_6.
  - prove u <> 4. assume H: u = 4. apply In_irref 4. rewrite <- H at 1. exact Hu.
  - prove u <> 5. assume H: u = 5. apply In_no2cycle 4 5 In_4_5.
    prove 5 :e 4. rewrite <- H. exact Hu.
  - prove 4 <> 5. apply neq_i_sym. exact neq_5_4.
  - exact Hu4.
  - exact Hu5.
  - exact H45.
}
apply xm (R 0 5).
- assume H05: R 0 5.
  apply orIL. exact L45 0 In_0_4 H04 H05.
- assume H05: ~R 0 5.
  apply xm (R 1 4).
  + assume H14: R 1 4.
    apply xm (R 1 5).
    * assume H15: R 1 5.
      apply orIL. exact L45 1 In_1_4 H14 H15.
    * { assume H15: ~R 1 5.
        apply xm (R 0 1).
        - assume H01: R 0 1.
          apply orIL.
          apply TwoRamseyProp_3_3_6_lem1 R HR 0 In_0_6 1 In_1_6 4 In_4_6.
          + exact neq_0_1.
          + apply neq_i_sym. exact neq_4_0.
          + apply neq_i_sym. exact neq_4_1.
          + exact H01.
          + exact H04.
          + exact H14.
        - assume H01: ~R 0 1.
          apply orIR.
          apply TwoRamseyProp_3_3_6_lem1 (fun x y => ~R x y) LRC 0 In_0_6 1 In_1_6 5 In_5_6.
          + exact neq_0_1.
          + apply neq_i_sym. exact neq_5_0.
          + apply neq_i_sym. exact neq_5_1.
          + exact H01.
          + exact H05.
          + exact H15.
      }
  + assume H14: ~R 1 4.
    apply xm (R 2 4).
    * { assume H24: R 2 4.
        apply xm (R 2 5).
        - assume H25: R 2 5.
          apply orIL. exact L45 2 In_2_4 H24 H25.
        - assume H25: ~R 2 5.
          apply xm (R 0 2).
          + assume H02: R 0 2.
            apply orIL.
            apply TwoRamseyProp_3_3_6_lem1 R HR 0 In_0_6 2 In_2_6 4 In_4_6.
            * exact neq_0_2.
            * apply neq_i_sym. exact neq_4_0.
            * apply neq_i_sym. exact neq_4_2.
            * exact H02.
            * exact H04.
            * exact H24.
          + assume H02: ~R 0 2.
            apply orIR.
            apply TwoRamseyProp_3_3_6_lem1 (fun x y => ~R x y) LRC 0 In_0_6 2 In_2_6 5 In_5_6.
            * exact neq_0_2.
            * apply neq_i_sym. exact neq_5_0.
            * apply neq_i_sym. exact neq_5_2.
            * exact H02.
            * exact H05.
            * exact H25.
      }
    * { assume H24: ~R 2 4.
        apply xm (R 3 4).
        - assume H34: R 3 4.
          apply xm (R 3 5).
          + assume H35: R 3 5.
            apply orIL. exact L45 3 In_3_4 H34 H35.
          + assume H35: ~R 3 5.
            apply xm (R 0 3).
            * { assume H03: R 0 3.
                apply orIL.
                apply TwoRamseyProp_3_3_6_lem1 R HR 0 In_0_6 3 In_3_6 4 In_4_6.
                - apply neq_i_sym. exact neq_3_0.
                - apply neq_i_sym. exact neq_4_0.
                - apply neq_i_sym. exact neq_4_3.
                - exact H03.
                - exact H04.
                - exact H34.
              }
            * { assume H03: ~R 0 3.
                apply orIR.
                apply TwoRamseyProp_3_3_6_lem1 (fun x y => ~R x y) LRC 0 In_0_6 3 In_3_6 5 In_5_6.
                - apply neq_i_sym. exact neq_3_0.
                - apply neq_i_sym. exact neq_5_0.
                - apply neq_i_sym. exact neq_5_3.
                - exact H03.
                - exact H05.
                - exact H35.
              }
        - assume H34: ~R 3 4.
          apply xm (R 1 2).
          + assume H12: R 1 2.
            apply xm (R 1 3).
            * { assume H13: R 1 3.
                apply xm (R 2 3).
                - assume H23: R 2 3.
                  apply orIL.
                  apply TwoRamseyProp_3_3_6_lem1 R HR 1 In_1_6 2 In_2_6 3 In_3_6.
                  + exact neq_1_2.
                  + apply neq_i_sym. exact neq_3_1.
                  + apply neq_i_sym. exact neq_3_2.
                  + exact H12.
                  + exact H13.
                  + exact H23.
                - assume H23: ~R 2 3.
                  apply orIR.
                  apply TwoRamseyProp_3_3_6_lem1 (fun x y => ~R x y) LRC 2 In_2_6 3 In_3_6 4 In_4_6.
                  + apply neq_i_sym. exact neq_3_2.
                  + apply neq_i_sym. exact neq_4_2.
                  + apply neq_i_sym. exact neq_4_3.
                  + exact H23.
                  + exact H24.
                  + exact H34.
              }
            * { assume H13: ~R 1 3.
                apply orIR.
                apply TwoRamseyProp_3_3_6_lem1 (fun x y => ~R x y) LRC 1 In_1_6 3 In_3_6 4 In_4_6.
                - apply neq_i_sym. exact neq_3_1.
                - apply neq_i_sym. exact neq_4_1.
                - apply neq_i_sym. exact neq_4_3.
                - exact H13.
                - exact H14.
                - exact H34.
              }
          + assume H12: ~R 1 2.
            apply orIR.
            apply TwoRamseyProp_3_3_6_lem1 (fun x y => ~R x y) LRC 1 In_1_6 2 In_2_6 4 In_4_6.
            * exact neq_1_2.
            * apply neq_i_sym. exact neq_4_1.
            * apply neq_i_sym. exact neq_4_2.
            * exact H12.
            * exact H14.
            * exact H24.
      }
Qed.

Theorem TwoRamseyProp_3_3_6_lem3 : forall R:set -> set -> prop,
     R 4 5
  -> (forall x y, R x y -> R y x)
  -> ((exists X c= 6, equip 3 X /\ (forall x y :e X, x <> y -> R x y))
   \/ (exists Y c= 6, equip 3 Y /\ (forall x y :e Y, x <> y -> ~R x y))).
let R.
assume H45: R 4 5.
assume HR: forall x y, R x y -> R y x.
claim LRC: forall x y, ~R x y -> ~R y x.
{ let x y. assume H1 H2. apply H1. apply HR. exact H2. }
apply xm (R 0 4).
- assume H04: R 0 4.
  exact TwoRamseyProp_3_3_6_lem2 R H04 H45 HR.
- assume H04: ~R 0 4.
  apply xm (R 1 4).
  + assume H14: R 1 4.
    claim Lf: exists f:set -> set, f 0 = 1 /\ f 1 = 0 /\ forall x, x <> 0 -> x <> 1 -> f x = x.
    {  set f : set -> set := fun u:set => if u = 0 then 1 else if u = 1 then 0 else u.
       witness f.
       apply and3I.
       - prove (if 0 = 0 then 1 else if 0 = 1 then 0 else 0) = 1.
         apply If_i_1 (0 = 0) 1 (if 0 = 1 then 0 else 0).
         reflexivity.
       - prove (if 1 = 0 then 1 else if 1 = 1 then 0 else 1) = 0.
         rewrite If_i_0 (1 = 0) 1 (if 1 = 1 then 0 else 1) neq_1_0.
         prove (if 1 = 1 then 0 else 1) = 0.
         apply If_i_1 (1 = 1) 0 1.
         reflexivity.
       - let x. assume Hx0 Hx1.
         prove (if x = 0 then 1 else if x = 1 then 0 else x) = x.
         rewrite If_i_0 (x = 0) 1 (if x = 1 then 0 else x) Hx0.
         exact If_i_0 (x = 1) 0 x Hx1.
    }
    apply Lf.
    let f. assume Hf. apply Hf. assume Hf. apply Hf.
    assume Hf0: f 0 = 1.
    assume Hf1: f 1 = 0.
    assume Hfe: forall x, x <> 0 -> x <> 1 -> f x = x.
    claim L601e: forall i :e 6, forall p:set -> prop, p 0 -> p 1 -> (i <> 0 -> i <> 1 -> p i) -> p i.
    { let i. assume Hi. let p. assume Hp0 Hp1. apply cases_6 i Hi.
      - assume _. exact Hp0.
      - assume _. exact Hp1.
      - assume Hpe. exact Hpe neq_2_0 neq_2_1.
      - assume Hpe. exact Hpe neq_3_0 neq_3_1.
      - assume Hpe. exact Hpe neq_4_0 neq_4_1.
      - assume Hpe. exact Hpe neq_5_0 neq_5_1.
    }
    claim Lf6: bij 6 6 f.
    { apply bijI.
      - let i. assume Hi. apply L601e i Hi.
        + prove f 0 :e 6. rewrite Hf0. exact In_1_6.
        + prove f 1 :e 6. rewrite Hf1. exact In_0_6.
        + assume Hi0 Hi1. exact Hfe i Hi0 Hi1 (fun u v => v :e 6) Hi.
      - let i. assume Hi. let j. assume Hj.
        apply L601e i Hi.
        + apply L601e j Hj.
          * assume _. reflexivity.
          * rewrite Hf0. rewrite Hf1.
            assume H: 1 = 0. prove False. exact neq_1_0 H.
          * assume Hj0 Hj1. rewrite Hf0.
            apply Hfe j Hj0 Hj1 (fun u v => 1 = v -> 0 = j).
            assume H: 1 = j.
            prove False. apply Hj1. symmetry. exact H.
        + apply L601e j Hj.
          * rewrite Hf0. rewrite Hf1.
            assume H: 0 = 1. prove False. exact neq_0_1 H.
          * assume _. reflexivity.
          * assume Hj0 Hj1. rewrite Hf1.
            apply Hfe j Hj0 Hj1 (fun u v => 0 = v -> 1 = j).
            assume H: 0 = j.
            prove False. apply Hj0. symmetry. exact H.
        + assume Hi0 Hi1. apply L601e j Hj.
          * rewrite Hf0.
            apply Hfe i Hi0 Hi1 (fun u v => v = 1 -> i = 0).
            assume H: i = 1. prove False. exact Hi1 H.
          * rewrite Hf1.
            apply Hfe i Hi0 Hi1 (fun u v => v = 0 -> i = 1).
            assume H: i = 0. prove False. exact Hi0 H.
          * assume Hj0 Hj1.
            apply Hfe i Hi0 Hi1 (fun u v => v = f j -> i = j).
            apply Hfe j Hj0 Hj1 (fun u v => i = v -> i = j).
            assume H: i = j. exact H.
      - let j. assume Hj. apply L601e j Hj.
        + prove exists i :e 6, f i = 0.
          witness 1. apply andI.
          * exact In_1_6.
          * exact Hf1.
        + prove exists i :e 6, f i = 1.
          witness 0. apply andI.
          * exact In_0_6.
          * exact Hf0.
        + assume Hj0 Hj1.
          prove exists i :e 6, f i = j.
          witness j. apply andI.
          * exact Hj.
          * exact Hfe j Hj0 Hj1.
    }
    set R' : set -> set -> prop := fun x y => R (f x) (f y).
    claim L04: R' 0 4.
    { prove R (f 0) (f 4).
      rewrite Hf0. rewrite Hfe 4 neq_4_0 neq_4_1.
      exact H14.
    }
    claim L45: R' 4 5.
    { prove R (f 4) (f 5).
      rewrite Hfe 4 neq_4_0 neq_4_1.
      rewrite Hfe 5 neq_5_0 neq_5_1.
      exact H45.
    }
    claim LR': forall x y, R' x y -> R' y x.
    { let x y. assume H: R (f x) (f y). prove R (f y) (f x).
      apply HR. exact H.
    }
    apply TwoRamseyProp_3_3_6_lem2 R' L04 L45 LR'.
    * assume H1: exists X c= 6, equip 3 X /\ (forall x y :e X, x <> y -> R' x y).
      apply orIL.
      exact TwoRamseyProp_equip_lem 3 3 6 6 R f (equip_ref 3) Lf6 H1.
    * assume H1: exists X c= 6, equip 3 X /\ (forall x y :e X, x <> y -> ~R' x y).
      apply orIR.
      exact TwoRamseyProp_equip_lem 3 3 6 6 (fun x y => ~R x y) f (equip_ref 3) Lf6 H1.
  + assume H14: ~R 1 4.
    apply xm (R 2 4).
    * { assume H24: R 2 4.
        claim Lf: exists f:set -> set, f 0 = 2 /\ f 2 = 0 /\ forall x, x <> 0 -> x <> 2 -> f x = x.
        {  set f : set -> set := fun u:set => if u = 0 then 2 else if u = 2 then 0 else u.
           witness f.
           apply and3I.
           - prove (if 0 = 0 then 2 else if 0 = 2 then 0 else 0) = 2.
             apply If_i_1 (0 = 0) 2 (if 0 = 2 then 0 else 0).
             reflexivity.
           - prove (if 2 = 0 then 2 else if 2 = 2 then 0 else 2) = 0.
             rewrite If_i_0 (2 = 0) 2 (if 2 = 2 then 0 else 2) neq_2_0.
             prove (if 2 = 2 then 0 else 2) = 0.
             apply If_i_1 (2 = 2) 0 2.
             reflexivity.
           - let x. assume Hx0 Hx2.
             prove (if x = 0 then 2 else if x = 2 then 0 else x) = x.
             rewrite If_i_0 (x = 0) 2 (if x = 2 then 0 else x) Hx0.
             exact If_i_0 (x = 2) 0 x Hx2.
        }
        apply Lf.
        let f. assume Hf. apply Hf. assume Hf. apply Hf.
        assume Hf0: f 0 = 2.
        assume Hf2: f 2 = 0.
        assume Hfe: forall x, x <> 0 -> x <> 2 -> f x = x.
        claim L602e: forall i :e 6, forall p:set -> prop, p 0 -> p 2 -> (i <> 0 -> i <> 2 -> p i) -> p i.
        { let i. assume Hi. let p. assume Hp0 Hp2. apply cases_6 i Hi.
          - assume _. exact Hp0.
          - assume Hpe. exact Hpe neq_1_0 neq_1_2.
          - assume _. exact Hp2.
          - assume Hpe. exact Hpe neq_3_0 neq_3_2.
          - assume Hpe. exact Hpe neq_4_0 neq_4_2.
          - assume Hpe. exact Hpe neq_5_0 neq_5_2.
        }
        claim Lf6: bij 6 6 f.
        { apply bijI.
          - let i. assume Hi. apply L602e i Hi.
            + prove f 0 :e 6. rewrite Hf0. exact In_2_6.
            + prove f 2 :e 6. rewrite Hf2. exact In_0_6.
            + assume Hi0 Hi2. exact Hfe i Hi0 Hi2 (fun u v => v :e 6) Hi.
          - let i. assume Hi. let j. assume Hj.
            apply L602e i Hi.
            + apply L602e j Hj.
              * assume _. reflexivity.
              * rewrite Hf0. rewrite Hf2.
                assume H: 2 = 0. prove False. exact neq_2_0 H.
              * assume Hj0 Hj2. rewrite Hf0.
                apply Hfe j Hj0 Hj2 (fun u v => 2 = v -> 0 = j).
                assume H: 2 = j.
                prove False. apply Hj2. symmetry. exact H.
            + apply L602e j Hj.
              * rewrite Hf0. rewrite Hf2.
                assume H: 0 = 2. prove False. exact neq_0_2 H.
              * assume _. reflexivity.
              * assume Hj0 Hj2. rewrite Hf2.
                apply Hfe j Hj0 Hj2 (fun u v => 0 = v -> 2 = j).
                assume H: 0 = j.
                prove False. apply Hj0. symmetry. exact H.
            + assume Hi0 Hi2. apply L602e j Hj.
              * rewrite Hf0.
                apply Hfe i Hi0 Hi2 (fun u v => v = 2 -> i = 0).
                assume H: i = 2. prove False. exact Hi2 H.
              * rewrite Hf2.
                apply Hfe i Hi0 Hi2 (fun u v => v = 0 -> i = 2).
                assume H: i = 0. prove False. exact Hi0 H.
              * assume Hj0 Hj2.
                apply Hfe i Hi0 Hi2 (fun u v => v = f j -> i = j).
                apply Hfe j Hj0 Hj2 (fun u v => i = v -> i = j).
                assume H: i = j. exact H.
          - let j. assume Hj. apply L602e j Hj.
            + prove exists i :e 6, f i = 0.
              witness 2. apply andI.
              * exact In_2_6.
              * exact Hf2.
            + prove exists i :e 6, f i = 2.
              witness 0. apply andI.
              * exact In_0_6.
              * exact Hf0.
            + assume Hj0 Hj2.
              prove exists i :e 6, f i = j.
              witness j. apply andI.
              * exact Hj.
              * exact Hfe j Hj0 Hj2.
        }
        set R' : set -> set -> prop := fun x y => R (f x) (f y).
        claim L04: R' 0 4.
        { prove R (f 0) (f 4).
          rewrite Hf0. rewrite Hfe 4 neq_4_0 neq_4_2.
          exact H24.
        }
        claim L45: R' 4 5.
        { prove R (f 4) (f 5).
          rewrite Hfe 4 neq_4_0 neq_4_2.
          rewrite Hfe 5 neq_5_0 neq_5_2.
          exact H45.
        }
        claim LR': forall x y, R' x y -> R' y x.
        { let x y. assume H: R (f x) (f y). prove R (f y) (f x).
          apply HR. exact H.
        }
        apply TwoRamseyProp_3_3_6_lem2 R' L04 L45 LR'.
        - assume H1: exists X c= 6, equip 3 X /\ (forall x y :e X, x <> y -> R' x y).
          apply orIL.
          exact TwoRamseyProp_equip_lem 3 3 6 6 R f (equip_ref 3) Lf6 H1.
        - assume H1: exists X c= 6, equip 3 X /\ (forall x y :e X, x <> y -> ~R' x y).
          apply orIR.
          exact TwoRamseyProp_equip_lem 3 3 6 6 (fun x y => ~R x y) f (equip_ref 3) Lf6 H1.
      }
    * { assume H24: ~R 2 4.
        apply xm (R 0 1).
        - assume H01: R 0 1.
          apply xm (R 0 2).
          + assume H02: R 0 2.
            apply xm (R 1 2).
            * { assume H12: R 1 2.
                apply orIL.
                apply TwoRamseyProp_3_3_6_lem1 R HR 0 In_0_6 1 In_1_6 2 In_2_6.
                - exact neq_0_1.
                - exact neq_0_2.
                - exact neq_1_2.
                - exact H01.
                - exact H02.
                - exact H12.
              }
            * { assume H12: ~R 1 2.
                apply orIR.
                apply TwoRamseyProp_3_3_6_lem1 (fun x y => ~R x y) LRC 1 In_1_6 2 In_2_6 4 In_4_6.
                - exact neq_1_2.
                - apply neq_i_sym. exact neq_4_1.
                - apply neq_i_sym. exact neq_4_2.
                - exact H12.
                - exact H14.
                - exact H24.
              }
          + assume H02: ~R 0 2.
            apply orIR.
            apply TwoRamseyProp_3_3_6_lem1 (fun x y => ~R x y) LRC 0 In_0_6 2 In_2_6 4 In_4_6.
            * exact neq_0_2.
            * apply neq_i_sym. exact neq_4_0.
            * apply neq_i_sym. exact neq_4_2.
            * exact H02.
            * exact H04.
            * exact H24.
        - assume H01: ~R 0 1.
          apply orIR.
          apply TwoRamseyProp_3_3_6_lem1 (fun x y => ~R x y) LRC 0 In_0_6 1 In_1_6 4 In_4_6.
          + exact neq_0_1.
          + apply neq_i_sym. exact neq_4_0.
          + apply neq_i_sym. exact neq_4_1.
          + exact H01.
          + exact H04.
          + exact H14.
      }
Qed.

Theorem TwoRamseyProp_3_3_6: TwoRamseyProp 3 3 6.
let R. assume HR.
set P : prop := (exists X c= 6, equip 3 X /\ (forall x y :e X, x <> y -> R x y))
             \/ (exists Y c= 6, equip 3 Y /\ (forall x y :e Y, x <> y -> ~R x y)).
apply xm (R 4 5).
- assume H1: R 4 5.
  exact TwoRamseyProp_3_3_6_lem3 R H1 HR.
- assume H1: ~R 4 5.
  set R' : set -> set -> prop := fun x y => ~R x y.
  claim L1: R' 4 5.
  { exact H1. }
  claim L2: forall x y, R' x y -> R' y x.
  { let x y. assume H2 H3. apply H2. apply HR. exact H3. }
  apply TwoRamseyProp_3_3_6_lem3 R' L1 L2.
  + apply orIR.
  + claim L3: (fun x y:set => ~R' x y) = R.
    { apply func_ext set (set -> prop).
      let x.
      prove (fun y:set => ~R' x y) = (R x).
      apply pred_ext_2.
      - let y. prove ~ ~ R x y -> R x y. apply dneg.
      - let y. assume H2 H3. exact H3 H2.
    }
    prove (exists X c= 6, equip 3 X /\ (forall x y :e X, x <> y -> ~R' x y)) -> P.
    prove (exists X c= 6, equip 3 X /\ (forall x y :e X, x <> y -> (fun x y:set => ~R' x y) x y)) -> P.
    rewrite L3.
    apply orIL.
Qed.
