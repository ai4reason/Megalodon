Theorem and3I : forall A B C:prop, A -> B -> C -> A /\ B /\ C.
let A B C. assume HA HB HC. apply andI.
- apply andI.
  + exact HA.
  + exact HB.
- exact HC.
Qed.

Definition iden : set := "core_simplicity_iden".
Definition comp : set -> set -> set := fun s t => pair "core_simplicity_comp" (pair s t).
Definition one : set := "core_simplicity_one".
Definition sum : set -> set -> set := fun A B => pair "core_simplicity_sum" (pair A B).
Definition prod : set -> set -> set := fun A B => pair "core_simplicity_prod" (pair A B).
Definition unit : set := "core_simplicity_unit".
Definition injl : set -> set := fun t => pair "core_simplicity_injl" t.
Definition injr : set -> set := fun t => pair "core_simplicity_injr" t.
Definition case : set -> set -> set := fun s t => pair "core_simplicity_case" (pair s t).
Definition spair : set -> set -> set := fun s t => pair "core_simplicity_pair" (pair s t).
Definition take : set -> set := fun t => pair "core_simplicity_take" t.
Definition drop : set -> set := fun t => pair "core_simplicity_drop" t.

Infix + 450 left := sum.
Infix * 450 left := prod.

(** start with some theorems that record which pieces of syntax are distinct. **)

(** The distinct_1 and distinct_2 lemmas easily distinguish iden/unit/one from all others. **)
Theorem distinct_1 : forall x y z, pair \x63 x <> pair (pair \x63 y) z.
let x y z. distinct.
Qed.

Theorem distinct_2 : forall x y z, pair (pair \x63 y) z <> pair \x63 x.
let x y z. assume H. apply distinct_1 x y z. symmetry. exact H.
Qed.

Theorem neq_one_sum : forall A B, one <> A + B.
let A B.
prove "core_simplicity_one" <> pair "core_simplicity_sum" (pair A B).
apply distinct_1.
Qed.

Theorem neq_one_prod : forall A B, one <> A * B.
let A B.
prove "core_simplicity_one" <> pair "core_simplicity_prod" (pair A B).
apply distinct_1.
Qed.

Theorem neq_sum_prod : forall A B C D, A + B <> C * D.
let A B C D.
assume H1: pair "core_simplicity_sum" (pair A B) = pair "core_simplicity_prod" (pair C D).
claim L1: "core_simplicity_sum" <> "core_simplicity_prod".
{ distinct. }
exact L1 (pair_inj_1 "core_simplicity_sum" (pair A B) "core_simplicity_prod" (pair C D) H1).
Qed.

Theorem sum_inj : forall A B C D, A + B = C + D -> A = C /\ B = D.
let A B C D.
assume H1.
apply pair_inj "core_simplicity_sum" (pair A B) "core_simplicity_sum" (pair C D) H1.
assume _.
assume H2: pair A B = pair C D.
exact pair_inj A B C D H2.
Qed.

Theorem prod_inj : forall A B C D, A * B = C * D -> A = C /\ B = D.
let A B C D.
assume H1.
apply pair_inj "core_simplicity_prod" (pair A B) "core_simplicity_prod" (pair C D) H1.
assume _.
assume H2: pair A B = pair C D.
exact pair_inj A B C D H2.
Qed.

Theorem neq_iden_comp : forall x y, iden <> comp x y.
let x y.
prove "core_simplicity_iden" <> pair "core_simplicity_comp" (pair x y).apply distinct_1.
Qed.

Theorem neq_iden_unit : iden <> unit.
prove "core_simplicity_iden" <> "core_simplicity_unit".
distinct.
Qed.

Theorem neq_comp_unit : forall x y, comp x y <> unit.
let x y.
prove pair "core_simplicity_comp" (pair x y) <> "core_simplicity_unit".
apply distinct_2.
Qed.

Theorem neq_iden_injl : forall x, iden <> injl x.
let x.
prove "core_simplicity_iden" <> pair "core_simplicity_injl" x.apply distinct_1.
Qed.

Theorem neq_comp_injl : forall x y z, comp x y <> injl z.
let x y z.
prove pair "core_simplicity_comp" (pair x y) <> pair "core_simplicity_injl" z.
distinct.
Qed.

Theorem neq_unit_injl : forall x, unit <> injl x.
let x.
prove "core_simplicity_unit" <> pair "core_simplicity_injl" x.apply distinct_1.
Qed.

Theorem neq_iden_injr : forall x, iden <> injr x.
let x.
prove "core_simplicity_iden" <> pair "core_simplicity_injr" x.apply distinct_1.
Qed.

Theorem neq_comp_injr : forall x y z, comp x y <> injr z.
let x y z.
prove pair "core_simplicity_comp" (pair x y) <> pair "core_simplicity_injr" z.
distinct.
Qed.

Theorem neq_unit_injr : forall x, unit <> injr x.
let x.
prove "core_simplicity_unit" <> pair "core_simplicity_injr" x.apply distinct_1.
Qed.

Theorem neq_injl_injr : forall x y, injl x <> injr y.
let x y.
prove pair "core_simplicity_injl" x <> pair "core_simplicity_injr" y.
distinct.
Qed.

Theorem neq_iden_case : forall x y, iden <> case x y.
let x y.
prove "core_simplicity_iden" <> pair "core_simplicity_case" (pair x y).apply distinct_1.
Qed.

Theorem neq_comp_case : forall x y z w, comp x y <> case z w.
let x y z w.
prove pair "core_simplicity_comp" (pair x y) <> pair "core_simplicity_case" (pair z w).
distinct.
Qed.

Theorem neq_unit_case : forall x y, unit <> case x y.
let x y.
prove "core_simplicity_unit" <> pair "core_simplicity_case" (pair x y).apply distinct_1.
Qed.

Theorem neq_injl_case : forall x y z, injl x <> case y z.
let x y z.
prove pair "core_simplicity_injl" x <> pair "core_simplicity_case" (pair y z).
distinct.
Qed.

Theorem neq_injr_case : forall x y z, injr x <> case y z.
let x y z.
prove pair "core_simplicity_injr" x <> pair "core_simplicity_case" (pair y z).
distinct.
Qed.

Theorem neq_iden_spair : forall x y, iden <> spair x y.
let x y.
prove "core_simplicity_iden" <> pair "core_simplicity_pair" (pair x y).apply distinct_1.
Qed.

Theorem neq_comp_spair : forall x y z w, comp x y <> spair z w.
let x y z w.
prove pair "core_simplicity_comp" (pair x y) <> pair "core_simplicity_pair" (pair z w).
distinct.
Qed.

Theorem neq_unit_spair : forall x y, unit <> spair x y.
let x y.
prove "core_simplicity_unit" <> pair "core_simplicity_pair" (pair x y).apply distinct_1.
Qed.

Theorem neq_injl_spair : forall x y z, injl x <> spair y z.
let x y z.
prove pair "core_simplicity_injl" x <> pair "core_simplicity_pair" (pair y z).
distinct.
Qed.

Theorem neq_injr_spair : forall x y z, injr x <> spair y z.
let x y z.
prove pair "core_simplicity_injr" x <> pair "core_simplicity_pair" (pair y z).
distinct.
Qed.

Theorem neq_case_spair : forall x y z w, case x y <> spair z w.
let x y z w.
prove pair "core_simplicity_case" (pair x y) <> pair "core_simplicity_pair" (pair z w).
distinct.
Qed.

Theorem neq_iden_take : forall x, iden <> take x.
let x.
prove "core_simplicity_iden" <> pair "core_simplicity_take" x.apply distinct_1.
Qed.

Theorem neq_comp_take : forall x y z, comp x y <> take z.
let x y z.
prove pair "core_simplicity_comp" (pair x y) <> pair "core_simplicity_take" z.
distinct.
Qed.

Theorem neq_unit_take : forall x, unit <> take x.
let x.
prove "core_simplicity_unit" <> pair "core_simplicity_take" x.apply distinct_1.
Qed.

Theorem neq_injl_take : forall x y, injl x <> take y.
let x y.
prove pair "core_simplicity_injl" x <> pair "core_simplicity_take" y.
distinct.
Qed.

Theorem neq_injr_take : forall x y, injr x <> take y.
let x y.
prove pair "core_simplicity_injr" x <> pair "core_simplicity_take" y.
distinct.
Qed.

Theorem neq_case_take : forall x y z, case x y <> take z.
let x y z.
prove pair "core_simplicity_case" (pair x y) <> pair "core_simplicity_take" z.
distinct.
Qed.

Theorem neq_spair_take : forall x y z, spair x y <> take z.
let x y z.
prove pair "core_simplicity_pair" (pair x y) <> pair "core_simplicity_take" z.
distinct.
Qed.

Theorem neq_iden_drop : forall x, iden <> drop x.
let x.
prove "core_simplicity_iden" <> pair "core_simplicity_drop" x.apply distinct_1.
Qed.

Theorem neq_comp_drop : forall x y z, comp x y <> drop z.
let x y z.
prove pair "core_simplicity_comp" (pair x y) <> pair "core_simplicity_drop" z.
distinct.
Qed.

Theorem neq_unit_drop : forall x, unit <> drop x.
let x.
prove "core_simplicity_unit" <> pair "core_simplicity_drop" x.apply distinct_1.
Qed.

Theorem neq_injl_drop : forall x y, injl x <> drop y.
let x y.
prove pair "core_simplicity_injl" x <> pair "core_simplicity_drop" y.
distinct.
Qed.

Theorem neq_injr_drop : forall x y, injr x <> drop y.
let x y.
prove pair "core_simplicity_injr" x <> pair "core_simplicity_drop" y.
distinct.
Qed.

Theorem neq_case_drop : forall x y z, case x y <> drop z.
let x y z.
prove pair "core_simplicity_case" (pair x y) <> pair "core_simplicity_drop" z.
distinct.
Qed.

Theorem neq_spair_drop : forall x y z, spair x y <> drop z.
let x y z.
prove pair "core_simplicity_pair" (pair x y) <> pair "core_simplicity_drop" z.
distinct.
Qed.

Theorem neq_take_drop : forall x y, take x <> drop y.
let x y.
prove pair "core_simplicity_take" x <> pair "core_simplicity_drop" y.
distinct.
Qed.

Theorem comp_inj : forall x y z w, comp x y = comp z w -> x = z /\ y = w.
let x y z w. assume H. exact pair_inj x y z w (pair_inj_2 "core_simplicity_comp" (pair x y) "core_simplicity_comp" (pair z w) H).
Qed.

Theorem comp_inj_1 : forall x y z w, comp x y = comp z w -> x = z.
let x y z w. assume H. apply comp_inj x y z w H. assume H1 _. exact H1.
Qed.

Theorem comp_inj_2 : forall x y z w, comp x y = comp z w -> y = w.
let x y z w. assume H. apply comp_inj x y z w H. assume _ H2. exact H2.
Qed.

Theorem injl_inj : forall x y, injl x = injl y -> x = y.
let x y. assume H. exact pair_inj_2 "core_simplicity_injl" x "core_simplicity_injl" y H.
Qed.

Theorem injr_inj : forall x y, injr x = injr y -> x = y.
let x y. assume H. exact pair_inj_2 "core_simplicity_injr" x "core_simplicity_injr" y H.
Qed.

Theorem case_inj : forall x y z w, case x y = case z w -> x = z /\ y = w.
let x y z w. assume H. exact pair_inj x y z w (pair_inj_2 "core_simplicity_case" (pair x y) "core_simplicity_case" (pair z w) H).
Qed.

Theorem case_inj_1 : forall x y z w, case x y = case z w -> x = z.
let x y z w. assume H. apply case_inj x y z w H. assume H1 _. exact H1.
Qed.

Theorem case_inj_2 : forall x y z w, case x y = case z w -> y = w.
let x y z w. assume H. apply case_inj x y z w H. assume _ H2. exact H2.
Qed.

Theorem spair_inj : forall x y z w, spair x y = spair z w -> x = z /\ y = w.
let x y z w. assume H. exact pair_inj x y z w (pair_inj_2 "core_simplicity_pair" (pair x y) "core_simplicity_pair" (pair z w) H).
Qed.

Theorem spair_inj_1 : forall x y z w, spair x y = spair z w -> x = z.
let x y z w. assume H. apply spair_inj x y z w H. assume H1 _. exact H1.
Qed.

Theorem spair_inj_2 : forall x y z w, spair x y = spair z w -> y = w.
let x y z w. assume H. apply spair_inj x y z w H. assume _ H2. exact H2.
Qed.

Theorem take_inj : forall x y, take x = take y -> x = y.
let x y. assume H. exact pair_inj_2 "core_simplicity_take" x "core_simplicity_take" y H.
Qed.

Theorem drop_inj : forall x y, drop x = drop y -> x = y.
let x y. assume H. exact pair_inj_2 "core_simplicity_drop" x "core_simplicity_drop" y H.
Qed.

(** Types **)
Definition type_p : set -> prop := fun A =>
  forall p:set -> prop,
       p one
    -> (forall A B, p A -> p B -> p (A + B))
    -> (forall A B, p A -> p B -> p (A * B))
    -> p A.

Theorem type_one : type_p one.
let p. assume H1 H2 H3. exact H1.
Qed.

Theorem type_sum : forall A B, type_p A -> type_p B -> type_p (A + B).
let A B. assume HA HB.
let p. assume H1 H2 H3. exact H2 A B (HA p H1 H2 H3) (HB p H1 H2 H3).
Qed.

Theorem type_prod : forall A B, type_p A -> type_p B -> type_p (A * B).
let A B. assume HA HB.
let p. assume H1 H2 H3. exact H3 A B (HA p H1 H2 H3) (HB p H1 H2 H3).
Qed.

Theorem type_ind : forall p:set -> prop,
       p one
    -> (forall A B, type_p A -> p A -> type_p B -> p B -> p (A + B))
    -> (forall A B, type_p A -> p A -> type_p B -> p B -> p (A * B))
    -> forall A, type_p A -> p A.
let p. assume H1 H2 H3.
let A. assume HA.
claim L1: type_p A /\ p A.
{ apply HA (fun A => type_p A /\ p A).
  - prove type_p one /\ p one.
    apply andI.
    + exact type_one.
    + exact H1.
  - let A B. assume IHA IHB.
    apply IHA. assume IHA1 IHA2.
    apply IHB. assume IHB1 IHB2.
    prove type_p (A + B) /\ p (A + B).
    apply andI.
    + apply type_sum.
      * exact IHA1.
      * exact IHB1.
    + exact H2 A B IHA1 IHA2 IHB1 IHB2.
  - let A B. assume IHA IHB.
    apply IHA. assume IHA1 IHA2.
    apply IHB. assume IHB1 IHB2.
    prove type_p (A * B) /\ p (A * B).
    apply andI.
    + apply type_prod.
      * exact IHA1.
      * exact IHB1.
    + exact H3 A B IHA1 IHA2 IHB1 IHB2.
}
apply L1. assume _ H. exact H.
Qed.

Theorem type_sum_inv : forall A B, type_p (A + B) -> type_p A /\ type_p B.
claim L1: forall C, type_p C -> forall A B, C = A + B -> type_p A /\ type_p B.
{ apply type_ind.
  - let A B. assume H1: one = A + B.
    prove False.
    exact neq_one_sum A B H1.
  - let C D. assume HC IHC HD IHD.
    let A B. assume H1: C + D = A + B.
    prove type_p A /\ type_p B.
    apply sum_inj C D A B H1.
    assume HCA: C = A.
    assume HDB: D = B.
    apply andI.
    + rewrite <- HCA. exact HC.
    + rewrite <- HDB. exact HD.
  - let C D. assume HC IHC HD IHD.
    let A B. assume H1: C * D = A + B.
    prove False.
    apply neq_sum_prod A B C D. symmetry. exact H1.
}
let A B. assume H1.
apply L1 (A + B) H1 A B.
reflexivity.
Qed.

Theorem type_prod_inv : forall A B, type_p (A * B) -> type_p A /\ type_p B.
claim L1: forall C, type_p C -> forall A B, C = A * B -> type_p A /\ type_p B.
{ apply type_ind.
  - let A B. assume H1: one = A * B.
    prove False.
    exact neq_one_prod A B H1.
  - let C D. assume HC IHC HD IHD.
    let A B. assume H1: C + D = A * B.
    prove False.
    apply neq_sum_prod C D A B. exact H1.
  - let C D. assume HC IHC HD IHD.
    let A B. assume H1: C * D = A * B.
    prove type_p A /\ type_p B.
    apply prod_inj C D A B H1.
    assume HCA: C = A.
    assume HDB: D = B.
    apply andI.
    + rewrite <- HCA. exact HC.
    + rewrite <- HDB. exact HD.
}
let A B. assume H1.
apply L1 (A * B) H1 A B.
reflexivity.
Qed.

(** Terms **)
Definition term_p : set -> prop := fun t =>
  forall p:set -> prop,
       p iden
    -> (forall s t, p s -> p t -> p (comp s t))
    -> p unit
    -> (forall t, p t -> p (injl t))
    -> (forall t, p t -> p (injr t))
    -> (forall s t, p s -> p t -> p (case s t))
    -> (forall s t, p s -> p t -> p (spair s t))
    -> (forall t, p t -> p (take t))
    -> (forall t, p t -> p (drop t))
    -> p t.

Theorem term_iden : term_p iden.
let p. assume H1 H2 H3 H4 H5 H6 H7 H8 H9. exact H1.
Qed.

Theorem term_comp : forall s t, term_p s -> term_p t -> term_p (comp s t).
let s t. assume Hs Ht.
let p. assume H1 H2 H3 H4 H5 H6 H7 H8 H9.
exact H2 s t (Hs p H1 H2 H3 H4 H5 H6 H7 H8 H9) (Ht p H1 H2 H3 H4 H5 H6 H7 H8 H9).
Qed.

Theorem term_unit : term_p unit.
let p. assume H1 H2 H3 H4 H5 H6 H7 H8 H9. exact H3.
Qed.

Theorem term_injl : forall t, term_p t -> term_p (injl t).
let t. assume Ht.
let p. assume H1 H2 H3 H4 H5 H6 H7 H8 H9.
exact H4 t (Ht p H1 H2 H3 H4 H5 H6 H7 H8 H9).
Qed.

Theorem term_injr : forall t, term_p t -> term_p (injr t).
let t. assume Ht.
let p. assume H1 H2 H3 H4 H5 H6 H7 H8 H9.
exact H5 t (Ht p H1 H2 H3 H4 H5 H6 H7 H8 H9).
Qed.

Theorem term_case : forall s t, term_p s -> term_p t -> term_p (case s t).
let s t. assume Hs Ht.
let p. assume H1 H2 H3 H4 H5 H6 H7 H8 H9.
exact H6 s t (Hs p H1 H2 H3 H4 H5 H6 H7 H8 H9) (Ht p H1 H2 H3 H4 H5 H6 H7 H8 H9).
Qed.

Theorem term_spair : forall s t, term_p s -> term_p t -> term_p (spair s t).
let s t. assume Hs Ht.
let p. assume H1 H2 H3 H4 H5 H6 H7 H8 H9.
exact H7 s t (Hs p H1 H2 H3 H4 H5 H6 H7 H8 H9) (Ht p H1 H2 H3 H4 H5 H6 H7 H8 H9).
Qed.

Theorem term_take : forall t, term_p t -> term_p (take t).
let t. assume Ht.
let p. assume H1 H2 H3 H4 H5 H6 H7 H8 H9.
exact H8 t (Ht p H1 H2 H3 H4 H5 H6 H7 H8 H9).
Qed.

Theorem term_drop : forall t, term_p t -> term_p (drop t).
let t. assume Ht.
let p. assume H1 H2 H3 H4 H5 H6 H7 H8 H9.
exact H9 t (Ht p H1 H2 H3 H4 H5 H6 H7 H8 H9).
Qed.

(** Typing Relation **)
Definition of : set -> set -> set -> prop := fun t A B =>
  forall p:set -> set -> set -> prop,
       (forall A, type_p A -> p iden A A)
    -> (forall A B C s t, p s A B -> p t B C -> p (comp s t) A C)
    -> (forall A, type_p A -> p unit A one)
    -> (forall A B C t, type_p C -> p t A B -> p (injl t) A (B + C))
    -> (forall A B C t, type_p B -> p t A C -> p (injr t) A (B + C))
    -> (forall A B C D s t, p s (A * C) D -> p t (B * C) D -> p (case s t) ((A + B) * C) D)
    -> (forall A B C s t, p s A B -> p t A C -> p (spair s t) A (B * C))
    -> (forall A B C t, type_p B -> p t A C -> p (take t) (A * B) C)
    -> (forall A B C t, type_p A -> p t B C -> p (drop t) (A * B) C)
    -> p t A B.

Theorem of_iden : forall A, type_p A -> of iden A A.
let A. assume HA.
let p. assume H1 H2 H3 H4 H5 H6 H7 H8 H9.
exact H1 A HA.
Qed.

Theorem of_comp : forall A B C s t, of s A B -> of t B C -> of (comp s t) A C.
let A B C s t. assume Hs Ht.
let p. assume H1 H2 H3 H4 H5 H6 H7 H8 H9.
exact H2 A B C s t (Hs p H1 H2 H3 H4 H5 H6 H7 H8 H9) (Ht p H1 H2 H3 H4 H5 H6 H7 H8 H9).
Qed.

Theorem of_unit : forall A, type_p A -> of unit A one.
let A. assume HA.
let p. assume H1 H2 H3 H4 H5 H6 H7 H8 H9.
exact H3 A HA.
Qed.

Theorem of_injl : forall A B C t, type_p C -> of t A B -> of (injl t) A (B + C).
let A B C t. assume HC Ht.
let p. assume H1 H2 H3 H4 H5 H6 H7 H8 H9.
exact H4 A B C t HC (Ht p H1 H2 H3 H4 H5 H6 H7 H8 H9).
Qed.

Theorem of_injr : forall A B C t, type_p B -> of t A C -> of (injr t) A (B + C).
let A B C t. assume HB Ht.
let p. assume H1 H2 H3 H4 H5 H6 H7 H8 H9.
exact H5 A B C t HB (Ht p H1 H2 H3 H4 H5 H6 H7 H8 H9).
Qed.

Theorem of_case : forall A B C D s t, of s (A * C) D -> of t (B * C) D -> of (case s t) ((A + B) * C) D.
let A B C D s t. assume Hs Ht.
let p. assume H1 H2 H3 H4 H5 H6 H7 H8 H9.
exact H6 A B C D s t (Hs p H1 H2 H3 H4 H5 H6 H7 H8 H9) (Ht p H1 H2 H3 H4 H5 H6 H7 H8 H9).
Qed.

Theorem of_spair : forall A B C s t, of s A B -> of t A C -> of (spair s t) A (B * C).
let A B C s t. assume Hs Ht.
let p. assume H1 H2 H3 H4 H5 H6 H7 H8 H9.
exact H7 A B C s t (Hs p H1 H2 H3 H4 H5 H6 H7 H8 H9) (Ht p H1 H2 H3 H4 H5 H6 H7 H8 H9).
Qed.

Theorem of_take : forall A B C t, type_p B -> of t A C -> of (take t) (A * B) C.
let A B C t. assume HB Ht.
let p. assume H1 H2 H3 H4 H5 H6 H7 H8 H9.
exact H8 A B C t HB (Ht p H1 H2 H3 H4 H5 H6 H7 H8 H9).
Qed.

Theorem of_drop : forall A B C t, type_p A -> of t B C -> of (drop t) (A * B) C.
let A B C t. assume HA Ht.
let p. assume H1 H2 H3 H4 H5 H6 H7 H8 H9.
exact H9 A B C t HA (Ht p H1 H2 H3 H4 H5 H6 H7 H8 H9).
Qed.

Theorem of_ind : forall p:set -> set -> set -> prop,
       (forall A, type_p A -> p iden A A)
    -> (forall A B C s t, of s A B -> p s A B -> of t B C -> p t B C -> p (comp s t) A C)
    -> (forall A, type_p A -> p unit A one)
    -> (forall A B C t, type_p C -> of t A B -> p t A B -> p (injl t) A (B + C))
    -> (forall A B C t, type_p B -> of t A C -> p t A C -> p (injr t) A (B + C))
    -> (forall A B C D s t, of s (A * C) D -> p s (A * C) D -> of t (B * C) D -> p t (B * C) D -> p (case s t) ((A + B) * C) D)
    -> (forall A B C s t, of s A B -> p s A B -> of t A C -> p t A C -> p (spair s t) A (B * C))
    -> (forall A B C t, type_p B -> of t A C -> p t A C -> p (take t) (A * B) C)
    -> (forall A B C t, type_p A -> of t B C -> p t B C -> p (drop t) (A * B) C)
    -> forall t A B, of t A B -> p t A B.
let p. assume H1 H2 H3 H4 H5 H6 H7 H8 H9.
let t A B. assume Ht.
set q := fun t A B:set => of t A B /\ p t A B.
claim LqE: forall t A B, forall r:prop, (of t A B -> p t A B -> r) -> (q t A B -> r).
{ let t A B r. assume Hr Hq. apply Hq. assume Hof Hp. exact Hr Hof Hp. }
claim LqI: forall t A B, of t A B -> p t A B -> q t A B.
{ let t A B. assume Hof Hp. prove of t A B /\ p t A B. apply andI.
  - exact Hof.
  - exact Hp.
}
claim L1: of t A B /\ p t A B.
{ prove q t A B.
  apply Ht q.
  - let A. assume HA: type_p A. apply LqI.
    + apply of_iden. exact HA.
    + apply H1. exact HA.
  - let A B C s t.
    apply LqE.
    assume IHs1 IHs2.
    apply LqE.
    assume IHt1 IHt2.
    apply LqI.
    + apply of_comp A B C s t.
      * exact IHs1.
      * exact IHt1.
    + apply H2 A B C s t.
      * exact IHs1.
      * exact IHs2.
      * exact IHt1.
      * exact IHt2.
  - let A. assume HA: type_p A. apply LqI.
    + apply of_unit. exact HA.
    + apply H3. exact HA.
  - let A B C t. assume HC. apply LqE.
    assume IHt1 IHt2.
    apply LqI.
    + apply of_injl.
      * exact HC.
      * exact IHt1.
    + apply H4.
      * exact HC.
      * exact IHt1.
      * exact IHt2.
  - let A B C t. assume HB. apply LqE.
    assume IHt1 IHt2.
    apply LqI.
    + apply of_injr.
      * exact HB.
      * exact IHt1.
    + apply H5.
      * exact HB.
      * exact IHt1.
      * exact IHt2.
  - let A B C D s t.
    apply LqE. assume IHs1 IHs2.
    apply LqE. assume IHt1 IHt2.
    apply LqI.
    + apply of_case.
      * exact IHs1.
      * exact IHt1.
    + apply H6.
      * exact IHs1.
      * exact IHs2.
      * exact IHt1.
      * exact IHt2.
  - let A B C s t.
    apply LqE. assume IHs1 IHs2.
    apply LqE. assume IHt1 IHt2.
    apply LqI.
    + apply of_spair.
      * exact IHs1.
      * exact IHt1.
    + apply H7.
      * exact IHs1.
      * exact IHs2.
      * exact IHt1.
      * exact IHt2.
  - let A B C t. assume HB.
    apply LqE. assume IHt1 IHt2.
    apply LqI.
    + apply of_take.
      * exact HB.
      * exact IHt1.
    + apply H8.
      * exact HB.
      * exact IHt1.
      * exact IHt2.
  - let A B C t. assume HA.
    apply LqE. assume IHt1 IHt2.
    apply LqI.
    + apply of_drop.
      * exact HA.
      * exact IHt1.
    + apply H9.
      * exact HA.
      * exact IHt1.
      * exact IHt2.
}
apply L1. assume _ H. exact H.
Qed.

Theorem of_wf : forall t A B, of t A B -> term_p t /\ type_p A /\ type_p B.
let t A B. assume HtAB.
apply HtAB (fun t A B => term_p t /\ type_p A /\ type_p B).
- let A. assume HA.
  prove term_p iden /\ type_p A /\ type_p A.
  apply and3I.
  + exact term_iden.
  + exact HA.
  + exact HA.
- let A B C s t.
  assume IHs IHt.
  apply IHs. assume IHs. apply IHs.
  assume IHs1 IHs2 IHs3.
  apply IHt. assume IHt. apply IHt.
  assume IHt1 IHt2 IHt3.
  prove term_p (comp s t) /\ type_p A /\ type_p C.
  apply and3I.
  + apply term_comp.
    * exact IHs1.
    * exact IHt1.
  + exact IHs2.
  + exact IHt3.
- let A. assume HA.
  prove term_p unit /\ type_p A /\ type_p one.
  apply and3I.
  + exact term_unit.
  + exact HA.
  + exact type_one.
- let A B C t. assume HC.
  assume IHt.
  apply IHt. assume IHt. apply IHt.
  assume IHt1 IHt2 IHt3.
  prove term_p (injl t) /\ type_p A /\ type_p (B + C).
  apply and3I.
  + apply term_injl. exact IHt1.
  + exact IHt2.
  + apply type_sum.
    * exact IHt3.
    * exact HC.
- let A B C t. assume HB.
  assume IHt.
  apply IHt. assume IHt. apply IHt.
  assume IHt1 IHt2 IHt3.
  prove term_p (injr t) /\ type_p A /\ type_p (B + C).
  apply and3I.
  + apply term_injr. exact IHt1.
  + exact IHt2.
  + apply type_sum.
    * exact HB.
    * exact IHt3.
- let A B C D s t.
  assume IHs IHt.
  apply IHs. assume IHs. apply IHs.
  assume IHs1 IHs2 IHs3.
  apply IHt. assume IHt. apply IHt.
  assume IHt1 IHt2 IHt3.
  apply type_prod_inv A C IHs2.
  assume HA HC.
  apply type_prod_inv B C IHt2.
  assume HB _.
  prove term_p (case s t) /\ type_p ((A + B) * C) /\ type_p D.
  apply and3I.
  + apply term_case.
    * exact IHs1.
    * exact IHt1.
  + apply type_prod.
    * { apply type_sum.
        - exact HA.
        - exact HB.
      }
    * exact HC.
  + exact IHs3.
- let A B C s t.
  assume IHs IHt.
  apply IHs. assume IHs. apply IHs.
  assume IHs1 IHs2 IHs3.
  apply IHt. assume IHt. apply IHt.
  assume IHt1 IHt2 IHt3.
  prove term_p (spair s t) /\ type_p A /\ type_p (B * C).
  apply and3I.
  + apply term_spair.
    * exact IHs1.
    * exact IHt1.
  + exact IHs2.
  + apply type_prod.
    * exact IHs3.
    * exact IHt3.
- let A B C t. assume HB.
  assume IHt.
  apply IHt. assume IHt. apply IHt.
  assume IHt1 IHt2 IHt3.
  prove term_p (take t) /\ type_p (A * B) /\ type_p C.
  apply and3I.
  + apply term_take. exact IHt1.
  + apply type_prod.
    * exact IHt2.
    * exact HB.
  + exact IHt3.
- let A B C t. assume HA.
  assume IHt.
  apply IHt. assume IHt. apply IHt.
  assume IHt1 IHt2 IHt3.
  prove term_p (drop t) /\ type_p (A * B) /\ type_p C.
  apply and3I.
  + apply term_drop. exact IHt1.
  + apply type_prod.
    * exact HA.
    * exact IHt2.
  + exact IHt3.
Qed.

