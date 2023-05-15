Theorem ev_sound : forall t A B, of t A B -> forall X Y:set -> prop, tyev A X -> tyev B Y -> forall a b, X a -> ev t a b -> Y b.
apply of_ind.
- let A. assume HA.
  let X Y.
  assume HAX: tyev A X.
  assume HAY: tyev A Y.
  let a b. assume Ha: X a.
  assume Hev: ev iden a b.
  claim L1: X = Y.
  { exact tyev_functional A X Y HAX HAY. }
  claim L2: a = b.
  { exact ev_iden_inv a b Hev. }
  prove Y b.
  rewrite <- L1.
  rewrite <- L2.
  exact Ha.
- let A B C s t.
  assume Hs IHs Ht IHt.
  let X Z.
  assume HAX: tyev A X.
  assume HCZ: tyev C Z.
  let a c.
  assume Ha: X a.
  assume Hev: ev (comp s t) a c.
  claim L1: exists b, ev s a b /\ ev t b c.
  { exact ev_comp_inv s t a c Hev. }
  apply L1.
  let b. assume H2. apply H2.
  assume H2: ev s a b.
  assume H3: ev t b c.
  apply of_wf s A B Hs.
  assume _.
  assume HB: type_p B.
  claim L2: exists Y:set -> prop, tyev B Y.
  { exact tyev_total B HB. }
  apply L2.
  let Y. assume HBY: tyev B Y.
  claim L3: Y b.
  { exact IHs X Y HAX HBY a b Ha H2. }
  prove Z c.
  exact IHt Y Z HBY HCZ b c L3 H3.
- let A. assume HA.
  let X Y.
  assume HAX: tyev A X.
  assume HY: tyev one Y.
  let a b. assume Ha: X a.
  assume Hev: ev unit a b.
  claim L2: Y = one_interp.
  { exact tyev_functional one Y one_interp HY tyev_one. }
  prove Y b.
  rewrite L2.
  prove one_interp b.
  prove b = nil.
  exact ev_unit_inv a b Hev.
- let A B C t. assume HC Ht IHt.
  let X Y.
  assume HX: tyev A X.
  assume HY: tyev (B + C) Y.
  let a b.
  assume Ha: X a.
  assume Hev: ev (injl t) a b.
  prove Y b.
  apply ev_injl_inv t a b Hev.
  let b'.
  assume Hb'. apply Hb'.
  assume H1: ev t a b'.
  assume H2: b = injl_interp b'.
  apply tyev_sum_inv B C Y HY.
  let Z. assume H. apply H.
  let W. assume H. apply H. assume H. apply H.
  assume H3: tyev B Z.
  assume H4: tyev C W.
  assume H5: Y = sum_interp Z W.
  prove Y b.
  rewrite H5.
  prove sum_interp Z W b.
  rewrite H2.
  prove sum_interp Z W (injl_interp b').
  apply sum_interp_IL.
  prove Z b'.
  exact IHt X Z HX H3 a b' Ha H1.
- let A B C t. assume HB Ht IHt.
  let X Y.
  assume HX: tyev A X.
  assume HY: tyev (B + C) Y.
  let a b.
  assume Ha: X a.
  assume Hev: ev (injr t) a b.
  prove Y b.
  apply ev_injr_inv t a b Hev.
  let b'.
  assume Hb'. apply Hb'.
  assume H1: ev t a b'.
  assume H2: b = injr_interp b'.
  apply tyev_sum_inv B C Y HY.
  let Z. assume H. apply H.
  let W. assume H. apply H. assume H. apply H.
  assume H3: tyev B Z.
  assume H4: tyev C W.
  assume H5: Y = sum_interp Z W.
  prove Y b.
  rewrite H5.
  prove sum_interp Z W b.
  rewrite H2.
  prove sum_interp Z W (injr_interp b').
  apply sum_interp_IR.
  prove W b'.
  exact IHt X W HX H4 a b' Ha H1.
- let A B C D s t.
  assume Hs: of s (A * C) D.
  assume IHs: forall X' Y':set -> prop, tyev (A * C) X' -> tyev D Y' -> forall a' b', X' a' -> ev s a' b' -> Y' b'.
  assume Ht: of t (B * C) D.
  assume IHt: forall X' Y':set -> prop, tyev (B * C) X' -> tyev D Y' -> forall a' b', X' a' -> ev t a' b' -> Y' b'.
  let X Y.
  assume HX: tyev ((A + B) * C) X.
  assume HY: tyev D Y.
  let a b.
  assume Ha: X a.
  assume Hev: ev (case s t) a b.
  apply tyev_prod_inv (A + B) C X HX.
  let Z. assume H. apply H.
  let W. assume H. apply H. assume H. apply H.
  assume H1: tyev (A + B) Z.
  assume H2: tyev C W.
  assume H3: X = prod_interp Z W.
  apply tyev_sum_inv A B Z H1.
  let U. assume H. apply H.
  let V. assume H. apply H. assume H. apply H.
  assume H4: tyev A U.
  assume H5: tyev B V.
  assume H6: Z = sum_interp U V.
  claim L1a: tyev (A * C) (prod_interp U W).
  { apply tyev_prod.
    - exact H4.
    - exact H2.
  }
  claim L1b: tyev (B * C) (prod_interp V W).
  { apply tyev_prod.
    - exact H5.
    - exact H2.
  }
  claim L2: prod_interp (sum_interp U V) W a.
  { rewrite <- H6. rewrite <- H3. exact Ha. }
  prove Y b.
  apply ev_case_inv s t a b Hev.
  + assume H. apply H.
    let a'. assume H. apply H.
    let c'. assume H. apply H.
    assume H7: a = spair_interp (injl_interp a') c'.
    assume H8: ev s (spair_interp a' c') b.
    claim L3: a = spair_interp (injl_interp a') c' -> U a' /\ W c'.
    { apply prod_interp_E (sum_interp U V) W a L2.
      let z w.
      assume H9: sum_interp U V z.
      assume H10: W w.
      prove spair_interp z w = spair_interp (injl_interp a') c' -> U a' /\ W c'.
      apply sum_interp_E U V z H9.
      - let u. assume H11: U u.
        prove spair_interp (injl_interp u) w = spair_interp (injl_interp a') c' -> U a' /\ W c'.
	assume H12.
	apply spair_interp_inj (injl_interp u) w (injl_interp a') c' H12.
	assume H13: injl_interp u = injl_interp a'.
	assume H14: w = c'.
        apply andI.
	+ prove U a'. rewrite <- injl_interp_inj u a' H13. exact H11.
	+ prove W c'. rewrite <- H14. exact H10.
      - let v. assume H11: V v.
        prove spair_interp (injr_interp v) w = spair_interp (injl_interp a') c' -> U a' /\ W c'.
	assume H12.
	apply spair_interp_inj (injr_interp v) w (injl_interp a') c' H12.
	assume H13: injr_interp v = injl_interp a'.
	prove False.
	apply injl_interp_not_injr_interp a' v.
	symmetry. exact H13.
    }
    claim L4: prod_interp U W (spair_interp a' c').
    { apply L3 H7.
      assume Ha' Hc'.
      apply prod_interp_I.
      - exact Ha'.
      - exact Hc'.
    }
    exact IHs (prod_interp U W) Y L1a HY (spair_interp a' c') b L4 H8.
  + assume H. apply H.
    let b'. assume H. apply H.
    let c'. assume H. apply H.
    assume H7: a = spair_interp (injr_interp b') c'.
    assume H8: ev t (spair_interp b' c') b.
    claim L3: a = spair_interp (injr_interp b') c' -> V b' /\ W c'.
    { apply prod_interp_E (sum_interp U V) W a L2.
      let z w.
      assume H9: sum_interp U V z.
      assume H10: W w.
      prove spair_interp z w = spair_interp (injr_interp b') c' -> V b' /\ W c'.
      apply sum_interp_E U V z H9.
      - let u. assume H11: U u.
        prove spair_interp (injl_interp u) w = spair_interp (injr_interp b') c' -> V b' /\ W c'.
	assume H12.
	apply spair_interp_inj (injl_interp u) w (injr_interp b') c' H12.
	assume H13: injl_interp u = injr_interp b'.
	prove False.
        exact injl_interp_not_injr_interp u b' H13.
      - let v. assume H11: V v.
        prove spair_interp (injr_interp v) w = spair_interp (injr_interp b') c' -> V b' /\ W c'.
	assume H12.
	apply spair_interp_inj (injr_interp v) w (injr_interp b') c' H12.
	assume H13: injr_interp v = injr_interp b'.
	assume H14: w = c'.
	apply andI.
	+ prove V b'. rewrite <- injr_interp_inj v b' H13. exact H11.
	+ prove W c'. rewrite <- H14. exact H10.
    }
    claim L4: prod_interp V W (spair_interp b' c').
    { apply L3 H7.
      assume Hb' Hc'.
      apply prod_interp_I.
      - exact Hb'.
      - exact Hc'.
    }
    exact IHt (prod_interp V W) Y L1b HY (spair_interp b' c') b L4 H8.
- let A B C s t.
  assume Hs: of s A B.
  assume IHs: forall X' Y':set -> prop, tyev A X' -> tyev B Y' -> forall a' b', X' a' -> ev s a' b' -> Y' b'.
  assume Ht: of t A C.
  assume IHt: forall X' Y':set -> prop, tyev A X' -> tyev C Y' -> forall a' b', X' a' -> ev t a' b' -> Y' b'.
  let X Y.
  assume HX: tyev A X.
  assume HY: tyev (B * C) Y.
  let a b.
  assume Ha: X a.
  assume Hev: ev (spair s t) a b.
  prove Y b.
  apply ev_spair_inv s t a b Hev.
  let b'. assume H. apply H.
  let c'. assume H. apply H. assume H. apply H.
  assume H1: ev s a b'.
  assume H2: ev t a c'.
  assume H3: b = spair_interp b' c'.
  apply tyev_prod_inv B C Y HY.
  let Z. assume H. apply H.
  let W. assume H. apply H. assume H. apply H.
  assume H4: tyev B Z.
  assume H5: tyev C W.
  assume H6: Y = prod_interp Z W.
  rewrite H6. rewrite H3.
  prove prod_interp Z W (spair_interp b' c').
  apply prod_interp_I.
  + prove Z b'.
    exact IHs X Z HX H4 a b' Ha H1.
  + prove W c'.
    exact IHt X W HX H5 a c' Ha H2.
- let A B C t.
  assume HB: type_p B.
  assume Ht: of t A C.
  assume IHt: forall X' Y':set -> prop, tyev A X' -> tyev C Y' -> forall a' b', X' a' -> ev t a' b' -> Y' b'.
  let X Y.
  assume HX: tyev (A * B) X.
  assume HY: tyev C Y.
  let a b.
  assume Ha: X a.
  assume Hev: ev (take t) a b.
  prove Y b.
  apply ev_take_inv t a b Hev.
  let a'. assume H. apply H.
  let b'. assume H. apply H.
  assume H1: a = spair_interp a' b'.
  assume H2: ev t a' b.
  apply tyev_prod_inv A B X HX.
  let Z. assume H. apply H.
  let W. assume H. apply H. assume H. apply H.
  assume H3: tyev A Z.
  assume H4: tyev B W.
  assume H5: X = prod_interp Z W.
  claim L1: prod_interp Z W a.
  { rewrite <- H5. exact Ha. }
  claim L2: a = spair_interp a' b' -> Z a'.
  { apply prod_interp_E Z W a L1.
    let z w. assume Hz Hw.
    assume H6: spair_interp z w = spair_interp a' b'.
    apply spair_interp_inj z w a' b' H6.
    assume H7: z = a'.
    assume _.
    rewrite <- H7.
    exact Hz.
  }
  exact IHt Z Y H3 HY a' b (L2 H1) H2.
- let A B C t.
  assume HA: type_p A.
  assume Ht: of t B C.
  assume IHt: forall X' Y':set -> prop, tyev B X' -> tyev C Y' -> forall a' b', X' a' -> ev t a' b' -> Y' b'.
  let X Y.
  assume HX: tyev (A * B) X.
  assume HY: tyev C Y.
  let a b.
  assume Ha: X a.
  assume Hev: ev (drop t) a b.
  prove Y b.
  apply ev_drop_inv t a b Hev.
  let a'. assume H. apply H.
  let b'. assume H. apply H.
  assume H1: a = spair_interp a' b'.
  assume H2: ev t b' b.
  apply tyev_prod_inv A B X HX.
  let Z. assume H. apply H.
  let W. assume H. apply H. assume H. apply H.
  assume H3: tyev A Z.
  assume H4: tyev B W.
  assume H5: X = prod_interp Z W.
  claim L1: prod_interp Z W a.
  { rewrite <- H5. exact Ha. }
  claim L2: a = spair_interp a' b' -> W b'.
  { apply prod_interp_E Z W a L1.
    let z w. assume Hz Hw.
    assume H6: spair_interp z w = spair_interp a' b'.
    apply spair_interp_inj z w a' b' H6.
    assume _.
    assume H7: w = b'.
    rewrite <- H7.
    exact Hw.
  }
  exact IHt W Y H4 HY b' b (L2 H1) H2.
Qed.

Theorem ExSwap : forall A, type_p A
  -> exists t, of t (A + A) (A + A)
      /\ forall X:set -> prop, tyev A X
            -> forall x y, sum_interp X X x -> SwapSpec x y -> ev t x y.
let A. assume HA.
claim LAA: type_p (A + A).
{ apply type_sum.
  - exact HA.
  - exact HA.
}
witness (comp (spair iden unit) (case (take (injr iden)) (take (injl iden)))).
apply andI.
- prove of (comp (spair iden unit) (case (take (injr iden)) (take (injl iden)))) (A + A) (A + A).
  apply of_comp (A + A) ((A + A) * one) (A + A).
  + apply of_spair.
    * prove of iden (A + A) (A + A).
      apply of_iden. exact LAA.
    * prove of unit (A + A) one.
      apply of_unit. exact LAA.
  + apply of_case.
    * { prove of (take (injr iden)) (A * one) (A + A).
        apply of_take A one (A + A).
	- exact type_one.
	- prove of (injr iden) A (A + A).
	  apply of_injr A A A iden HA.
	  apply of_iden. exact HA.
      }
    * { prove of (take (injl iden)) (A * one) (A + A).
        apply of_take A one (A + A).
	- exact type_one.
	- prove of (injl iden) A (A + A).
	  apply of_injl A A A iden HA.
	  apply of_iden. exact HA.
      }
- let X. assume HAX. let x y. assume Hx.
  prove SwapSpec x y
     -> ev (comp (spair iden unit) (case (take (injr iden)) (take (injl iden)))) x y.
  apply sum_interp_E X X x Hx.
  + let z. assume Hz: X z.
    assume H1: SwapSpec (injl_interp z) y.
    claim L1: y = injr_interp z.
    { apply H1.
      assume H2 _.
      apply H2 z.
      reflexivity.
    }
    prove ev (comp (spair iden unit) (case (take (injr iden)) (take (injl iden)))) (injl_interp z) y.
    apply ev_comp (spair iden unit) (case (take (injr iden)) (take (injl iden))) (injl_interp z) (spair_interp (injl_interp z) nil) y.
    * { prove ev (spair iden unit) (injl_interp z) (spair_interp (injl_interp z) nil).
        apply ev_spair iden unit (injl_interp z) (injl_interp z) nil.
	- apply ev_iden.
	- apply ev_unit.
      }
    * { prove ev (case (take (injr iden)) (take (injl iden))) (spair_interp (injl_interp z) nil) y.
        apply ev_case_l.
	- prove term_p (take (injl iden)). apply term_take. apply term_injl. apply term_iden.
	- prove ev (take (injr iden)) (spair_interp z nil) y.
	  apply ev_take.
	  prove ev (injr iden) z y.
	  rewrite L1.
	  apply ev_injr.
	  apply ev_iden.
      }
  + let z. assume Hz: X z.
    assume H1: SwapSpec (injr_interp z) y.
    claim L1: y = injl_interp z.
    { apply H1.
      assume _ H2.
      apply H2 z.
      reflexivity.
    }
    prove ev (comp (spair iden unit) (case (take (injr iden)) (take (injl iden)))) (injr_interp z) y.
    apply ev_comp (spair iden unit) (case (take (injr iden)) (take (injl iden))) (injr_interp z) (spair_interp (injr_interp z) nil) y.
    * { prove ev (spair iden unit) (injr_interp z) (spair_interp (injr_interp z) nil).
        apply ev_spair iden unit (injr_interp z) (injr_interp z) nil.
	- apply ev_iden.
	- apply ev_unit.
      }
    * { prove ev (case (take (injr iden)) (take (injl iden))) (spair_interp (injr_interp z) nil) y.
        apply ev_case_r.
	- prove term_p (take (injr iden)). apply term_take. apply term_injr. apply term_iden.
	- prove ev (take (injl iden)) (spair_interp z nil) y.
	  apply ev_take.
	  prove ev (injl iden) z y.
	  rewrite L1.
	  apply ev_injl.
	  apply ev_iden.
      }
Qed.
