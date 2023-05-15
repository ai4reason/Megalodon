Definition TwoRamseyProp : set -> set -> set -> prop
 := fun M N V =>
      forall R:set -> set -> prop,
        (forall x y, R x y -> R y x)
       -> ((exists X c= V, equip M X /\ (forall x y :e X, x <> y -> R x y))
        \/ (exists Y c= V, equip N Y /\ (forall x y :e Y, x <> y -> ~R x y))).

Axiom ordinal_equip_3_E_impred : forall X, equip 3 X ->
  (forall alpha :e X, ordinal alpha) ->
  forall p:prop,
    (forall alpha beta gamma :e X,
      alpha :e beta -> beta :e gamma ->
      (forall y :e X, forall q:set -> prop, q alpha -> q beta -> q gamma -> q y)
      -> p)
    -> p.

Theorem not_TwoRamseyProp_3_3_5 : ~TwoRamseyProp 3 3 5.
assume H1.
prove False.
set R : set -> set -> prop := fun i j =>
     i = 0 /\ (j = 4 \/ j = 1)
  \/ i = 1 /\ (j = 0 \/ j = 2)
  \/ i = 2 /\ (j = 1 \/ j = 3)
  \/ i = 3 /\ (j = 2 \/ j = 4)
  \/ i = 4 /\ (j = 3 \/ j = 0).
claim LRI04: R 0 4.
{ prove 0 = 0 /\ (4 = 4 \/ 4 = 1)
     \/ 0 = 1 /\ (4 = 0 \/ 4 = 2)
     \/ 0 = 2 /\ (4 = 1 \/ 4 = 3)
     \/ 0 = 3 /\ (4 = 2 \/ 4 = 4)
     \/ 0 = 4 /\ (4 = 3 \/ 4 = 0).
  apply or5I1. apply andI.
  - reflexivity.
  - apply orIL. reflexivity.
}
claim LRI01: R 0 1.
{ prove 0 = 0 /\ (1 = 4 \/ 1 = 1)
     \/ 0 = 1 /\ (1 = 0 \/ 1 = 2)
     \/ 0 = 2 /\ (1 = 1 \/ 1 = 3)
     \/ 0 = 3 /\ (1 = 2 \/ 1 = 4)
     \/ 0 = 4 /\ (1 = 3 \/ 1 = 0).
  apply or5I1. apply andI.
  - reflexivity.
  - apply orIR. reflexivity.
}
claim LRI10: R 1 0.
{ prove 1 = 0 /\ (0 = 4 \/ 0 = 1)
     \/ 1 = 1 /\ (0 = 0 \/ 0 = 2)
     \/ 1 = 2 /\ (0 = 1 \/ 0 = 3)
     \/ 1 = 3 /\ (0 = 2 \/ 0 = 4)
     \/ 1 = 4 /\ (0 = 3 \/ 0 = 0).
  apply or5I2. apply andI.
  - reflexivity.
  - apply orIL. reflexivity.
}
claim LRI12: R 1 2.
{ prove 1 = 0 /\ (2 = 4 \/ 2 = 1)
     \/ 1 = 1 /\ (2 = 0 \/ 2 = 2)
     \/ 1 = 2 /\ (2 = 1 \/ 2 = 3)
     \/ 1 = 3 /\ (2 = 2 \/ 2 = 4)
     \/ 1 = 4 /\ (2 = 3 \/ 2 = 0).
  apply or5I2. apply andI.
  - reflexivity.
  - apply orIR. reflexivity.
}
claim LRI21: R 2 1.
{ prove 2 = 0 /\ (1 = 4 \/ 1 = 1)
     \/ 2 = 1 /\ (1 = 0 \/ 1 = 2)
     \/ 2 = 2 /\ (1 = 1 \/ 1 = 3)
     \/ 2 = 3 /\ (1 = 2 \/ 1 = 4)
     \/ 2 = 4 /\ (1 = 3 \/ 1 = 0).
  apply or5I3. apply andI.
  - reflexivity.
  - apply orIL. reflexivity.
}
claim LRI23: R 2 3.
{ prove 2 = 0 /\ (3 = 4 \/ 3 = 1)
     \/ 2 = 1 /\ (3 = 0 \/ 3 = 2)
     \/ 2 = 2 /\ (3 = 1 \/ 3 = 3)
     \/ 2 = 3 /\ (3 = 2 \/ 3 = 4)
     \/ 2 = 4 /\ (3 = 3 \/ 3 = 0).
  apply or5I3. apply andI.
  - reflexivity.
  - apply orIR. reflexivity.
}
claim LRI32: R 3 2.
{ prove 3 = 0 /\ (2 = 4 \/ 2 = 1)
     \/ 3 = 1 /\ (2 = 0 \/ 2 = 2)
     \/ 3 = 2 /\ (2 = 1 \/ 2 = 3)
     \/ 3 = 3 /\ (2 = 2 \/ 2 = 4)
     \/ 3 = 4 /\ (2 = 3 \/ 2 = 0).
  apply or5I4. apply andI.
  - reflexivity.
  - apply orIL. reflexivity.
}
claim LRI34: R 3 4.
{ prove 3 = 0 /\ (4 = 4 \/ 4 = 1)
     \/ 3 = 1 /\ (4 = 0 \/ 4 = 2)
     \/ 3 = 2 /\ (4 = 1 \/ 4 = 3)
     \/ 3 = 3 /\ (4 = 2 \/ 4 = 4)
     \/ 3 = 4 /\ (4 = 3 \/ 4 = 0).
  apply or5I4. apply andI.
  - reflexivity.
  - apply orIR. reflexivity.
}
claim LRI43: R 4 3.
{ prove 4 = 0 /\ (3 = 4 \/ 3 = 1)
     \/ 4 = 1 /\ (3 = 0 \/ 3 = 2)
     \/ 4 = 2 /\ (3 = 1 \/ 3 = 3)
     \/ 4 = 3 /\ (3 = 2 \/ 3 = 4)
     \/ 4 = 4 /\ (3 = 3 \/ 3 = 0).
  apply or5I5. apply andI.
  - reflexivity.
  - apply orIL. reflexivity.
}
claim LRI40: R 4 0.
{ prove 4 = 0 /\ (0 = 4 \/ 0 = 1)
     \/ 4 = 1 /\ (0 = 0 \/ 0 = 2)
     \/ 4 = 2 /\ (0 = 1 \/ 0 = 3)
     \/ 4 = 3 /\ (0 = 2 \/ 0 = 4)
     \/ 4 = 4 /\ (0 = 3 \/ 0 = 0).
  apply or5I5. apply andI.
  - reflexivity.
  - apply orIR. reflexivity.
}
claim LRE: forall i j, R i j -> forall p:set -> set -> prop,
       p 0 4 -> p 0 1 -> p 1 0 -> p 1 2 -> p 2 1 -> p 2 3
    -> p 3 2 -> p 3 4 -> p 4 3 -> p 4 0
    -> p i j.
{ let i j. assume H.
  let p. assume H04 H01 H10 H12 H21 H23 H32 H34 H43 H40.
  apply or5E (i = 0 /\ (j = 4 \/ j = 1))
             (i = 1 /\ (j = 0 \/ j = 2))
             (i = 2 /\ (j = 1 \/ j = 3))
             (i = 3 /\ (j = 2 \/ j = 4))
             (i = 4 /\ (j = 3 \/ j = 0)) H.
  - assume H. apply H.
    assume Hi: i = 0. rewrite Hi.
    assume Hj. apply Hj.
    + assume Hj: j = 4. rewrite Hj. exact H04.
    + assume Hj: j = 1. rewrite Hj. exact H01.
  - assume H. apply H.
    assume Hi: i = 1. rewrite Hi.
    assume Hj. apply Hj.
    + assume Hj: j = 0. rewrite Hj. exact H10.
    + assume Hj: j = 2. rewrite Hj. exact H12.
  - assume H. apply H.
    assume Hi: i = 2. rewrite Hi.
    assume Hj. apply Hj.
    + assume Hj: j = 1. rewrite Hj. exact H21.
    + assume Hj: j = 3. rewrite Hj. exact H23.
  - assume H. apply H.
    assume Hi: i = 3. rewrite Hi.
    assume Hj. apply Hj.
    + assume Hj: j = 2. rewrite Hj. exact H32.
    + assume Hj: j = 4. rewrite Hj. exact H34.
  - assume H. apply H.
    assume Hi: i = 4. rewrite Hi.
    assume Hj. apply Hj.
    + assume Hj: j = 3. rewrite Hj. exact H43.
    + assume Hj: j = 0. rewrite Hj. exact H40.
}
claim LNR02: ~R 0 2.
{ assume H2.
  apply LRE 0 2 H2 (fun i j => i = 0 -> j = 2 -> False).
  - assume _. exact neq_4_2.
  - assume _. exact neq_1_2.
  - assume H3: 1 = 0. prove False. exact neq_1_0 H3.
  - assume H3: 1 = 0. prove False. exact neq_1_0 H3.
  - assume H3: 2 = 0. prove False. exact neq_2_0 H3.
  - assume H3: 2 = 0. prove False. exact neq_2_0 H3.
  - assume H3: 3 = 0. prove False. exact neq_3_0 H3.
  - assume H3: 3 = 0. prove False. exact neq_3_0 H3.
  - assume H3: 4 = 0. prove False. exact neq_4_0 H3.
  - assume H3: 4 = 0. prove False. exact neq_4_0 H3.
  - prove 0 = 0. reflexivity.
  - prove 2 = 2. reflexivity.
}
claim LNR03: ~R 0 3.
{ assume H2.
  apply LRE 0 3 H2 (fun i j => i = 0 -> j = 3 -> False).
  - assume _. exact neq_4_3.
  - assume _. assume H3: 1 = 3. apply neq_3_1. symmetry. exact H3.
  - assume H3: 1 = 0. prove False. exact neq_1_0 H3.
  - assume H3: 1 = 0. prove False. exact neq_1_0 H3.
  - assume H3: 2 = 0. prove False. exact neq_2_0 H3.
  - assume H3: 2 = 0. prove False. exact neq_2_0 H3.
  - assume H3: 3 = 0. prove False. exact neq_3_0 H3.
  - assume H3: 3 = 0. prove False. exact neq_3_0 H3.
  - assume H3: 4 = 0. prove False. exact neq_4_0 H3.
  - assume H3: 4 = 0. prove False. exact neq_4_0 H3.
  - prove 0 = 0. reflexivity.
  - prove 3 = 3. reflexivity.
}
claim LNR13: ~R 1 3.
{ assume H2.
  apply LRE 1 3 H2 (fun i j => i = 1 -> j = 3 -> False).
  - assume H3: 0 = 1. prove False. exact neq_0_1 H3.
  - assume H3: 0 = 1. prove False. exact neq_0_1 H3.
  - assume _. assume H3: 0 = 3. apply neq_3_0. symmetry. exact H3.
  - assume _. assume H3: 2 = 3. apply neq_3_2. symmetry. exact H3.
  - assume H3: 2 = 1. prove False. exact neq_2_1 H3.
  - assume H3: 2 = 1. prove False. exact neq_2_1 H3.
  - assume H3: 3 = 1. prove False. exact neq_3_1 H3.
  - assume H3: 3 = 1. prove False. exact neq_3_1 H3.
  - assume H3: 4 = 1. prove False. exact neq_4_1 H3.
  - assume H3: 4 = 1. prove False. exact neq_4_1 H3.
  - prove 1 = 1. reflexivity.
  - prove 3 = 3. reflexivity.
}
claim LNR14: ~R 1 4.
{ assume H2.
  apply LRE 1 4 H2 (fun i j => i = 1 -> j = 4 -> False).
  - assume H3: 0 = 1. prove False. exact neq_0_1 H3.
  - assume H3: 0 = 1. prove False. exact neq_0_1 H3.
  - assume _. assume H3: 0 = 4. apply neq_4_0. symmetry. exact H3.
  - assume _. assume H3: 2 = 4. apply neq_4_2. symmetry. exact H3.
  - assume H3: 2 = 1. prove False. exact neq_2_1 H3.
  - assume H3: 2 = 1. prove False. exact neq_2_1 H3.
  - assume H3: 3 = 1. prove False. exact neq_3_1 H3.
  - assume H3: 3 = 1. prove False. exact neq_3_1 H3.
  - assume H3: 4 = 1. prove False. exact neq_4_1 H3.
  - assume H3: 4 = 1. prove False. exact neq_4_1 H3.
  - prove 1 = 1. reflexivity.
  - prove 4 = 4. reflexivity.
}
claim LNR24: ~R 2 4.
{ assume H2.
  apply LRE 2 4 H2 (fun i j => i = 2 -> j = 4 -> False).
  - assume H3: 0 = 2. prove False. exact neq_0_2 H3.
  - assume H3: 0 = 2. prove False. exact neq_0_2 H3.
  - assume H3: 1 = 2. prove False. exact neq_1_2 H3.
  - assume H3: 1 = 2. prove False. exact neq_1_2 H3.
  - assume _. assume H3: 1 = 4. apply neq_4_1. symmetry. exact H3.
  - assume _. assume H3: 3 = 4. apply neq_4_3. symmetry. exact H3.
  - assume H3: 3 = 2. prove False. exact neq_3_2 H3.
  - assume H3: 3 = 2. prove False. exact neq_3_2 H3.
  - assume H3: 4 = 2. prove False. exact neq_4_2 H3.
  - assume H3: 4 = 2. prove False. exact neq_4_2 H3.
  - prove 2 = 2. reflexivity.
  - prove 4 = 4. reflexivity.
}
claim L2: forall i j, R i j -> R j i.
{ let i j. assume H.
  exact LRE i j H
            (fun i j => R j i)
            LRI40 LRI10 LRI01 LRI21 LRI12 LRI32 LRI23 LRI43 LRI34 LRI04.
}
claim L3: forall X c= 5, equip 3 X -> (exists x y :e X, x <> y /\ R x y) /\ (exists x y :e X, x <> y /\ ~R x y).
{ let X.
  assume HX1: X c= 5.
  assume HX2: equip 3 X.
  set P : prop := (exists x y :e X, x <> y /\ R x y) /\ (exists x y :e X, x <> y /\ ~R x y).
  claim LXo: forall x :e X, ordinal x.
  { let x. assume Hx: x :e X.
    apply nat_p_ordinal.
    apply nat_p_trans 5 nat_5.
    prove x :e 5. exact HX1 x Hx.
  }
  apply ordinal_equip_3_E_impred X HX2 LXo.
  let alpha. assume Ha: alpha :e X.
  let beta. assume Hb: beta :e X.
  let gamma. assume Hc: gamma :e X.
  assume Hab: alpha :e beta.
  assume Hbc: beta :e gamma.
  assume Hxc: forall y :e X, forall q:set -> prop, q alpha -> q beta -> q gamma -> q y.
  claim Lc: gamma :e 5.
  { exact HX1 gamma Hc. }
  apply cases_5 gamma Lc (fun i => gamma = i -> P).
  - assume H2: gamma = 0.
    prove False.
    apply EmptyE beta. rewrite <- H2. exact Hbc.
  - assume H2: gamma = 1.
    claim Lb1: beta :e 1.
    { rewrite <- H2. exact Hbc. }
    prove False.
    apply cases_1 beta Lb1 (fun i => beta = i -> False).
    + assume H3: beta = 0.
      apply EmptyE alpha.
      prove alpha :e 0.
      rewrite <- H3. exact Hab.
    + reflexivity.
  - assume H2: gamma = 2.
    claim Lb2: beta :e 2.
    { rewrite <- H2. exact Hbc. }
    apply cases_2 beta Lb2 (fun i => beta = i -> P).
    + assume H3: beta = 0.
      prove False.
      apply EmptyE alpha. rewrite <- H3. exact Hab.
    + assume H3: beta = 1.
      claim La1: alpha :e 1.
      { rewrite <- H3. exact Hab. }
      apply cases_1 alpha La1 (fun i => alpha = i -> P).
      * { assume H4: alpha = 0.
          apply andI.
          - witness alpha. apply andI.
            + exact Ha.
            + witness beta. apply andI.
              * exact Hb.
              * { apply andI.
                  - prove alpha <> beta. rewrite H4. rewrite H3.
                    exact neq_0_1.
                  - prove R alpha beta. rewrite H4. rewrite H3. exact LRI01.
                }
          - witness alpha. apply andI.
            + exact Ha.
            + witness gamma. apply andI.
              * exact Hc.
              * { apply andI.
                  - prove alpha <> gamma. rewrite H4. rewrite H2.
                    exact neq_0_2.
                  - prove ~R alpha gamma. rewrite H4. rewrite H2. exact LNR02.
                }
        }
      * reflexivity.
    + reflexivity.
  - assume H2: gamma = 3.
    claim Lb3: beta :e 3.
    { rewrite <- H2. exact Hbc. }
    apply cases_3 beta Lb3 (fun i => beta = i -> P).
    + assume H3: beta = 0.
      prove False.
      apply EmptyE alpha. rewrite <- H3. exact Hab.
    + assume H3: beta = 1.
      claim La1: alpha :e 1.
      { rewrite <- H3. exact Hab. }
      apply cases_1 alpha La1 (fun i => alpha = i -> P).
      * { assume H4: alpha = 0.
          apply andI.
          - witness alpha. apply andI.
            + exact Ha.
            + witness beta. apply andI.
              * exact Hb.
              * { apply andI.
                  - prove alpha <> beta. rewrite H4. rewrite H3.
                    exact neq_0_1.
                  - prove R alpha beta. rewrite H4. rewrite H3. exact LRI01.
                }
          - witness alpha. apply andI.
            + exact Ha.
            + witness gamma. apply andI.
              * exact Hc.
              * { apply andI.
                  - prove alpha <> gamma. rewrite H4. rewrite H2.
                    apply neq_i_sym. exact neq_3_0.
                  - prove ~R alpha gamma. rewrite H4. rewrite H2. exact LNR03.
                }
        }
      * reflexivity.
    + assume H3: beta = 2.
      claim La2: alpha :e 2.
      { rewrite <- H3. exact Hab. }
      apply cases_2 alpha La2 (fun i => alpha = i -> P).
      * { assume H4: alpha = 0.
          apply andI.
          - witness beta. apply andI.
            + exact Hb.
            + witness gamma. apply andI.
              * exact Hc.
              * { apply andI.
                  - prove beta <> gamma. rewrite H3. rewrite H2.
                    apply neq_i_sym. exact neq_3_2.
                  - prove R beta gamma. rewrite H3. rewrite H2. exact LRI23.
                }
          - witness alpha. apply andI.
            + exact Ha.
            + witness beta. apply andI.
              * exact Hb.
              * { apply andI.
                  - prove alpha <> beta. rewrite H4. rewrite H3. exact neq_0_2.
                  - prove ~R alpha beta. rewrite H4. rewrite H3. exact LNR02.
                }
        }
      * { assume H4: alpha = 1.
          apply andI.
          - witness alpha. apply andI.
            + exact Ha.
            + witness beta. apply andI.
              * exact Hb.
              * { apply andI.
                  - prove alpha <> beta. rewrite H4. rewrite H3. exact neq_1_2.
                  - prove R alpha beta. rewrite H4. rewrite H3. exact LRI12.
                }
          - witness alpha. apply andI.
            + exact Ha.
            + witness gamma. apply andI.
              * exact Hc.
              * { apply andI.
                  - prove alpha <> gamma. rewrite H4. rewrite H2.
                    apply neq_i_sym. exact neq_3_1.
                  - prove ~R alpha gamma. rewrite H4. rewrite H2. exact LNR13.
                }
        }
      * reflexivity.
    + reflexivity.
  - assume H2: gamma = 4.
    claim Lb4: beta :e 4.
    { rewrite <- H2. exact Hbc. }
    apply cases_4 beta Lb4 (fun i => beta = i -> P).
    + assume H3: beta = 0.
      prove False.
      apply EmptyE alpha. rewrite <- H3. exact Hab.
    + assume H3: beta = 1.
      claim La1: alpha :e 1.
      { rewrite <- H3. exact Hab. }
      apply cases_1 alpha La1 (fun i => alpha = i -> P).
      * { assume H4: alpha = 0.
          apply andI.
          - witness alpha. apply andI.
            + exact Ha.
            + witness beta. apply andI.
              * exact Hb.
              * { apply andI.
                  - prove alpha <> beta. rewrite H4. rewrite H3. exact neq_0_1.
                  - prove R alpha beta. rewrite H4. rewrite H3. exact LRI01.
                }
          - witness beta. apply andI.
            + exact Hb.
            + witness gamma. apply andI.
              * exact Hc.
              * { apply andI.
                  - prove beta <> gamma. rewrite H3. rewrite H2.
                    apply neq_i_sym. exact neq_4_1.
                  - prove ~R beta gamma. rewrite H3. rewrite H2. exact LNR14.
                }
        }
      * reflexivity.
    + assume H3: beta = 2.
      claim La2: alpha :e 2.
      { rewrite <- H3. exact Hab. }
      apply cases_2 alpha La2 (fun i => alpha = i -> P).
      * { assume H4: alpha = 0.
          apply andI.
          - witness alpha. apply andI.
            + exact Ha.
            + witness gamma. apply andI.
              * exact Hc.
              * { apply andI.
                  - prove alpha <> gamma. rewrite H4. rewrite H2.
                    apply neq_i_sym. exact neq_4_0.
                  - prove R alpha gamma. rewrite H4. rewrite H2. exact LRI04.
                }
          - witness alpha. apply andI.
            + exact Ha.
            + witness beta. apply andI.
              * exact Hb.
              * { apply andI.
                  - prove alpha <> beta. rewrite H4. rewrite H3. exact neq_0_2.
                  - prove ~R alpha beta. rewrite H4. rewrite H3. exact LNR02.
                }
        }
      * { assume H4: alpha = 1.
          apply andI.
          - witness alpha. apply andI.
            + exact Ha.
            + witness beta. apply andI.
              * exact Hb.
              * { apply andI.
                  - prove alpha <> beta. rewrite H4. rewrite H3. exact neq_1_2.
                  - prove R alpha beta. rewrite H4. rewrite H3. exact LRI12.
                }
          - witness alpha. apply andI.
            + exact Ha.
            + witness gamma. apply andI.
              * exact Hc.
              * { apply andI.
                  - prove alpha <> gamma. rewrite H4. rewrite H2.
                    apply neq_i_sym. exact neq_4_1.
                  - prove ~R alpha gamma. rewrite H4. rewrite H2. exact LNR14.
                }
        }
      * reflexivity.
    + assume H3: beta = 3.
      claim La3: alpha :e 3.
      { rewrite <- H3. exact Hab. }
      apply cases_3 alpha La3 (fun i => alpha = i -> P).
      * { assume H4: alpha = 0.
          apply andI.
          - witness beta. apply andI.
            + exact Hb.
            + witness gamma. apply andI.
              * exact Hc.
              * { apply andI.
                  - prove beta <> gamma. rewrite H3. rewrite H2.
                    apply neq_i_sym. exact neq_4_3.
                  - prove R beta gamma. rewrite H3. rewrite H2. exact LRI34.
                }
          - witness alpha. apply andI.
            + exact Ha.
            + witness beta. apply andI.
              * exact Hb.
              * { apply andI.
                  - prove alpha <> beta. rewrite H4. rewrite H3.
                    apply neq_i_sym. exact neq_3_0.
                  - prove ~R alpha beta. rewrite H4. rewrite H3. exact LNR03.
                }
        }
      * { assume H4: alpha = 1.
          apply andI.
          - witness beta. apply andI.
            + exact Hb.
            + witness gamma. apply andI.
              * exact Hc.
              * { apply andI.
                  - prove beta <> gamma. rewrite H3. rewrite H2.
                    apply neq_i_sym. exact neq_4_3.
                  - prove R beta gamma. rewrite H3. rewrite H2. exact LRI34.
                }
          - witness alpha. apply andI.
            + exact Ha.
            + witness beta. apply andI.
              * exact Hb.
              * { apply andI.
                  - prove alpha <> beta. rewrite H4. rewrite H3.
                    apply neq_i_sym. exact neq_3_1.
                  - prove ~R alpha beta. rewrite H4. rewrite H3. exact LNR13.
                }
        }
      * { assume H4: alpha = 2.
          apply andI.
          - witness alpha. apply andI.
            + exact Ha.
            + witness beta. apply andI.
              * exact Hb.
              * { apply andI.
                  - prove alpha <> beta. rewrite H4. rewrite H3.
                    apply neq_i_sym. exact neq_3_2.
                  - prove R alpha beta. rewrite H4. rewrite H3. exact LRI23.
                }
          - witness alpha. apply andI.
            + exact Ha.
            + witness gamma. apply andI.
              * exact Hc.
              * { apply andI.
                  - prove alpha <> gamma. rewrite H4. rewrite H2.
                    apply neq_i_sym. exact neq_4_2.
                  - prove ~R alpha gamma. rewrite H4. rewrite H2. exact LNR24.
                }
        }
      * reflexivity.
    + reflexivity.
  - reflexivity.
}
prove False.
apply H1 R L2.
- assume H2: exists X c= 5, equip 3 X /\ (forall x y :e X, x <> y -> R x y).
  apply H2.
  let X. assume H3. apply H3.
  assume HX1: X c= 5. assume H3. apply H3.
  assume HX2: equip 3 X.
  assume HX3: forall x y :e X, x <> y -> R x y.
  apply L3 X HX1 HX2.
  assume _.
  assume H4: exists x y :e X, x <> y /\ ~R x y.
  apply H4.
  let x. assume H5. apply H5.
  assume Hx: x :e X. assume H5. apply H5.
  let y. assume H5. apply H5.
  assume Hy: y :e X.
  assume H5. apply H5.
  assume H5: x <> y.
  assume H6: ~R x y.
  exact H6 (HX3 x Hx y Hy H5).
- assume H2: exists Y c= 5, equip 3 Y /\ (forall x y :e Y, x <> y -> ~R x y).
  apply H2.
  let Y. assume H3. apply H3.
  assume HY1: Y c= 5. assume H3. apply H3.
  assume HY2: equip 3 Y.
  assume HY3: forall x y :e Y, x <> y -> ~R x y.
  apply L3 Y HY1 HY2.
  assume H4: exists x y :e Y, x <> y /\ R x y.
  assume _.
  apply H4.
  let x. assume H5. apply H5.
  assume Hx: x :e Y. assume H5. apply H5.
  let y. assume H5. apply H5.
  assume Hy: y :e Y.
  assume H5. apply H5.
  assume H5: x <> y.
  assume H6: R x y.
  exact HY3 x Hx y Hy H5 H6.
Qed.

