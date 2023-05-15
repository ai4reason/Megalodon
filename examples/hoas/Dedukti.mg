Theorem transclos_mono : forall R R':set -> set -> prop, R c= R' -> transclos R c= transclos R'.
let R R'. assume HRR'.
let x y. assume Hxy.
let r. assume H1 H2.
apply Hxy r.
- let z w. assume Hzw: R z w. apply H1. apply HRR'. exact Hzw.
- exact H2.
Qed.

Definition bit0 : set := bind (fun x => nil).
Definition bit1 : set := bind (fun x => bind (fun y => x)).

Theorem nil_not_bit0 : nil <> bit0.
assume H. apply neq_nil_bind_bind (fun x y => y) H.
Qed.

Theorem nil_not_bit1 : nil <> bit1.
assume H. apply neq_nil_bind_bind (fun x y => x) H.
Qed.

Theorem bit0_not_bit1 : bit0 <> bit1.
assume H1.
apply nil_not_bit0.
prove nil = bit0.
prove (fun x:set => nil) nil = (fun x:set => bind (fun y => x)) nil.
claim L1: (fun x:set => nil) = (fun x:set => bind (fun y => x)).
{ exact bind_inj (fun x:set => nil) (fun x:set => bind (fun y => x)) H1. }
rewrite <- L1.
exact (fun q H => H).
Qed.

Let Kind := bit0.
Let Type := bit1.

Definition ap : set -> set -> set := fun x y => pair nil (pair x y).
Definition lam : set -> (set -> set) -> set := fun A f => pair bit0 (pair A (bind f)).
Definition Pi : set -> (set -> set) -> set := fun A f => pair bit1 (pair A (bind f)).

Definition arr : set -> set -> set := fun A B => Pi A (fun _ => B).

Definition congclos : (set -> set -> prop) -> set -> set -> prop
  := fun R M N =>
  forall q:set -> set -> prop,
     (forall M N, R M N -> q M N)
  -> (forall M, q M M)
  -> (forall M N P Q, q M N -> q P Q -> q (ap M P) (ap N Q))
  -> (forall A B, forall M N:set -> set, q A B -> (forall z, q (M z) (N z)) -> q (lam A M) (lam B N))
  -> (forall A B, forall C D:set -> set, q A B -> (forall z, q (C z) (D z)) -> q (Pi A C) (Pi B D))
  -> q M N.

Theorem congclos_mono : forall R R':set -> set -> prop, R c= R' -> congclos R c= congclos R'.
let R R'. assume HRR'.
let x y. assume Hxy.
let q. assume H1 H2 H3 H4 H5.
apply Hxy q.
- let M N. assume HMN. apply H1. apply HRR'. exact HMN.
- exact H2.
- exact H3.
- exact H4.
- exact H5.
Qed.

Definition betared : set -> set -> prop
  := fun M N =>
  forall q:set -> set -> prop,
     (forall A, forall M:set -> set, forall N, q (lam A M) (M N))
  -> q M N.

Definition etared : set -> set -> prop
  := fun M N =>
  forall q:set -> set -> prop,
     (forall A, forall M, q (lam A (fun x => ap M x)) M)
  -> q M N.

Definition red : (set -> set -> prop) -> set -> set -> prop := fun R => transclos (congclos (fun M N => R M N \/ betared M N)).

Definition redweta : (set -> set -> prop) -> set -> set -> prop := fun R => transclos (congclos (fun M N => R M N \/ betared M N \/ etared M N)).

Theorem red_mono : forall R R':set -> set -> prop, R c= R' -> red R c= red R'.
let R R'. assume HRR'.
prove red R c= red R'.
prove transclos (congclos (fun M N => R M N \/ betared M N))
   c= transclos (congclos (fun M N => R' M N \/ betared M N)).
apply transclos_mono (congclos (fun M N => R M N \/ betared M N)) (congclos (fun M N => R' M N \/ betared M N)).
prove congclos (fun M N => R M N \/ betared M N)
   c= congclos (fun M N => R' M N \/ betared M N).
apply congclos_mono (fun M N => R M N \/ betared M N) (fun M N => R' M N \/ betared M N).
let M N. assume H1: R M N \/ betared M N.
prove R' M N \/ betared M N.
apply H1.
- assume H2. apply orIL. exact HRR' M N H2.
- assume H2. apply orIR. exact H2.
Qed.

Definition emp2 : set -> set -> prop := fun x y => False.

Definition adj2 : (set -> set -> prop) -> set -> set -> set -> set -> prop := fun G x A y B => G y B \/ y = x /\ B = A.

Theorem adj2_Subq : forall G G':set -> set -> prop, forall x A, G c= G' -> adj2 G x A c= adj2 G' x A.
let G G' x A.
assume HGG'.
let y B.
assume H1: G y B \/ y = x /\ B = A.
prove G' y B \/ y = x /\ B = A.
apply H1.
- assume H2. apply orIL. apply HGG'. exact H2.
- assume H2. apply orIR. exact H2.
Qed.

Definition sortp : set -> prop := fun s => s = Type \/ s = Kind.

Theorem sortp_Type : sortp Type.
prove Type = Type \/ Type = Kind.
apply orIL. exact (fun q H => H).
Qed.

Theorem sortp_Kind : sortp Kind.
prove Kind = Type \/ Kind = Kind.
apply orIR. exact (fun q H => H).
Qed.

Definition of : (set -> set -> prop) -> (set -> set -> prop) -> (set -> set -> prop) -> set -> set -> prop
  := fun S R G M A =>
  forall q : (set -> set -> prop) -> set -> set -> prop,
     (forall G:set -> set -> prop, forall c A, S c A -> q G c A)
  -> (forall G:set -> set -> prop, forall x A, G x A -> q G x A)
  -> (forall G:set -> set -> prop, q G Type Kind)
  -> (forall G:set -> set -> prop, forall s A, forall B:set -> set, sortp s -> q G A Type -> (forall z, q (adj2 G z A) (B z) s) -> q G (Pi A B) s)
  -> (forall G:set -> set -> prop, forall M N A, forall B:set -> set, q G M (Pi A B) -> q G N A -> q G (ap M N) (B N))
  -> (forall G:set -> set -> prop, forall s A, forall M B:set -> set, sortp s -> q G (Pi A B) s -> (forall z, q (adj2 G z A) (M z) (B z)) -> q G (lam nil M) (Pi A B))
  -> (forall G:set -> set -> prop, forall s A, forall M B:set -> set, sortp s -> q G (Pi A B) s -> (forall z, q (adj2 G z A) (M z) (B z)) -> q G (lam A M) (Pi A B))
  -> (forall G:set -> set -> prop, forall s M A B C, sortp s -> q G M A -> q G B s -> red R A C -> red R B C -> q G M B)
  -> q G M A.

Theorem of_con : forall S R G:set -> set -> prop, forall c A, S c A -> of S R G c A.
let S R G c A. assume Hc.
let q. assume H1 H2 H3 H4 H5 H6 H7 H8.
exact H1 G c A Hc.
Qed.

Theorem of_var : forall S R G:set -> set -> prop, forall x A, G x A -> of S R G x A.
let S R G x A. assume Hx.
let q. assume H1 H2 H3 H4 H5 H6 H7 H8.
exact H2 G x A Hx.
Qed.

Theorem of_Type : forall S R G:set -> set -> prop, of S R G Type Kind.
let S R G.
let q. assume H1 H2 H3 H4 H5 H6 H7 H8.
exact H3 G.
Qed.

Theorem of_Pi : forall S R G:set -> set -> prop, forall s A, forall B:set -> set, sortp s -> of S R G A Type -> (forall z, of S R (adj2 G z A) (B z) s) -> of S R G (Pi A B) s.
let S R G s A B. assume Hs HA HB.
let q. assume H1 H2 H3 H4 H5 H6 H7 H8.
apply H4 G s A B Hs.
- exact HA q H1 H2 H3 H4 H5 H6 H7 H8.
- let z. exact HB z q H1 H2 H3 H4 H5 H6 H7 H8.
Qed.

Theorem of_ap : forall S R G:set -> set -> prop, forall M N A, forall B:set -> set, of S R G M (Pi A B) -> of S R G N A -> of S R G (ap M N) (B N).
let S R G M N A B. assume HM HN.
let q. assume H1 H2 H3 H4 H5 H6 H7 H8.
apply H5 G M N A B.
- exact HM q H1 H2 H3 H4 H5 H6 H7 H8.
- exact HN q H1 H2 H3 H4 H5 H6 H7 H8.
Qed.

Theorem of_lam_nil : forall S R G:set -> set -> prop, forall s A, forall M B:set -> set, sortp s -> of S R G (Pi A B) s -> (forall z, of S R (adj2 G z A) (M z) (B z)) -> of S R G (lam nil M) (Pi A B).
let S R G s A M B. assume Hs HAB HM.
let q. assume H1 H2 H3 H4 H5 H6 H7 H8.
apply H6 G s A M B Hs.
- exact HAB q H1 H2 H3 H4 H5 H6 H7 H8.
- let z. exact HM z q H1 H2 H3 H4 H5 H6 H7 H8.
Qed.

Theorem of_lam : forall S R G:set -> set -> prop, forall s A, forall M B:set -> set, sortp s -> of S R G (Pi A B) s -> (forall z, of S R (adj2 G z A) (M z) (B z)) -> of S R G (lam A M) (Pi A B).
let S R G s A M B. assume Hs HAB HM.
let q. assume H1 H2 H3 H4 H5 H6 H7 H8.
apply H7 G s A M B Hs.
- exact HAB q H1 H2 H3 H4 H5 H6 H7 H8.
- let z. exact HM z q H1 H2 H3 H4 H5 H6 H7 H8.
Qed.

Theorem of_conv : forall S R G:set -> set -> prop, forall s M A B C, sortp s -> of S R G M A -> of S R G B s -> red R A C -> red R B C -> of S R G M B.
let S R G s M A B C. assume Hs HM HB HAC HBC.
let q. assume H1 H2 H3 H4 H5 H6 H7 H8.
apply H8 G s M A B C Hs.
- exact HM q H1 H2 H3 H4 H5 H6 H7 H8.
- exact HB q H1 H2 H3 H4 H5 H6 H7 H8.
- exact HAC.
- exact HBC.
Qed.

Theorem of_mono : forall S R S' R' G:set -> set -> prop, S c= S' -> R c= R' -> forall M A, of S R G M A -> of S' R' G M A.
let S R S' R' G.
assume HSS' HRR'.
let M A.
assume H.
claim L1: forall G:set -> set -> prop, forall c A, S c A -> of S' R' G c A.
{ let G c A.
  assume Hc: S c A.
  apply of_con S' R' G.
  prove S' c A. apply HSS'. exact Hc.
}
claim L2: forall G:set -> set -> prop, forall x A, G x A -> of S' R' G x A.
{ exact of_var S' R'. }
claim L3: forall G:set -> set -> prop, of S' R' G Type Kind.
{ exact of_Type S' R'. }
claim L4: forall G:set -> set -> prop, forall s A, forall B:set -> set, sortp s -> of S' R' G A Type -> (forall z, of S' R' (adj2 G z A) (B z) s) -> of S' R' G (Pi A B) s.
{ exact of_Pi S' R'. }
claim L5: forall G:set -> set -> prop, forall M N A, forall B:set -> set, of S' R' G M (Pi A B) -> of S' R' G N A -> of S' R' G (ap M N) (B N).
{ exact of_ap S' R'. }
claim L6: forall G:set -> set -> prop, forall s A, forall M B:set -> set, sortp s -> of S' R' G (Pi A B) s -> (forall z, of S' R' (adj2 G z A) (M z) (B z)) -> of S' R' G (lam nil M) (Pi A B).
{ exact of_lam_nil S' R'. }
claim L7: forall G:set -> set -> prop, forall s A, forall M B:set -> set, sortp s -> of S' R' G (Pi A B) s -> (forall z, of S' R' (adj2 G z A) (M z) (B z)) -> of S' R' G (lam A M) (Pi A B).
{ exact of_lam S' R'. }
claim L8: forall G:set -> set -> prop, forall s M A B C, sortp s -> of S' R' G M A -> of S' R' G B s -> red R A C -> red R B C -> of S' R' G M B.
{ let G s M A B C. assume Hs HM HB HAC HBC.
  apply of_conv S' R' G s M A B C Hs HM HB.
  - prove red R' A C. apply red_mono R R' HRR'. exact HAC.
  - prove red R' B C. apply red_mono R R' HRR'. exact HBC.
}
exact H (of S' R') L1 L2 L3 L4 L5 L6 L7 L8.
Qed.

Theorem of_monoG : forall S R G:set -> set -> prop, forall M A, of S R G M A -> forall G':set -> set -> prop, G c= G' -> of S R G' M A.
let S R G M A. assume HM.
set q : (set -> set -> prop) -> set -> set -> prop := fun G M A => forall G':set -> set -> prop, G c= G' -> of S R G' M A.
prove q G M A.
apply HM q.
- prove forall G:set -> set -> prop, forall c A, S c A -> q G c A.
  let G c A. assume Hc. let G'. assume HGG'.
  apply of_con. exact Hc.
- prove forall G:set -> set -> prop, forall x A, G x A -> q G x A.
  let G x A. assume Hx. let G'. assume HGG'.
  apply of_var. apply HGG'. exact Hx.
- prove forall G:set -> set -> prop, q G Type Kind.
  let G G'. assume HGG'. apply of_Type.
- prove forall G:set -> set -> prop, forall s A, forall B:set -> set, sortp s -> q G A Type -> (forall z, q (adj2 G z A) (B z) s) -> q G (Pi A B) s.
  let G s A B. assume Hs IHA IHB.
  let G'. assume HGG'.
  apply of_Pi.
  + exact Hs.
  + exact IHA G' HGG'.
  + let z. exact IHB z (adj2 G' z A) (adj2_Subq G G' z A HGG').
- prove forall G:set -> set -> prop, forall M N A, forall B:set -> set, q G M (Pi A B) -> q G N A -> q G (ap M N) (B N).
  let G M N A B. assume IHM IHN.
  let G'. assume HGG'.
  apply of_ap S R G' M N A B.
  + exact IHM G' HGG'.
  + exact IHN G' HGG'.
- prove forall G:set -> set -> prop, forall s A, forall M B:set -> set, sortp s -> q G (Pi A B) s -> (forall z, q (adj2 G z A) (M z) (B z)) -> q G (lam nil M) (Pi A B).
  let G s A M B. assume Hs IHAB IHM.
  let G'. assume HGG'.
  apply of_lam_nil S R G' s A M B.
  + exact Hs.
  + exact IHAB G' HGG'.
  + let z. exact IHM z (adj2 G' z A) (adj2_Subq G G' z A HGG').
- prove forall G:set -> set -> prop, forall s A, forall M B:set -> set, sortp s -> q G (Pi A B) s -> (forall z, q (adj2 G z A) (M z) (B z)) -> q G (lam A M) (Pi A B).
  let G s A M B. assume Hs IHAB IHM.
  let G'. assume HGG'.
  apply of_lam S R G' s A M B.
  + exact Hs.
  + exact IHAB G' HGG'.
  + let z. exact IHM z (adj2 G' z A) (adj2_Subq G G' z A HGG').
- prove forall G:set -> set -> prop, forall s M A B C, sortp s -> q G M A -> q G B s -> red R A C -> red R B C -> q G M B.
  let G s M A B C. assume Hs IHM IHB HAC HBC.
  let G'. assume HGG'.
  apply of_conv S R G' s M A B C Hs.
  + exact IHM G' HGG'.
  + exact IHB G' HGG'.
  + exact HAC.
  + exact HBC.
Qed.

Theorem of_arr : forall S R G:set -> set -> prop, forall s A B, sortp s -> of S R G A Type -> of S R G B s -> of S R G (arr A B) s.
let S R G s A B. assume Hs HA HB.
prove of S R G (Pi A (fun _ => B)) s.
apply of_Pi S R G s A (fun _ => B) Hs HA.
prove forall z, of S R (adj2 G z A) B s.
let z.
apply of_monoG S R G B s HB.
prove G c= adj2 G z A.
let y C. assume Hy: G y C.
prove G y C \/ y = z /\ C = A.
apply orIL.
exact Hy.
Qed.

Theorem of_arr_Type : forall S R G:set -> set -> prop, forall A B, of S R G A Type -> of S R G B Type -> of S R G (arr A B) Type.
let S R G A B. 
exact of_arr S R G Type A B sortp_Type.
Qed.

Definition functionalp : (set -> set -> prop) -> prop := fun S => forall c A B, S c A -> S c B -> A = B.

Definition valid_sig_tp : (set -> set -> prop) -> (set -> set -> prop) -> set -> prop
  := fun S R A => of S R emp2 A Kind \/ of S R emp2 A Type.

Theorem valid_sig_tp_Kind : forall S R:set -> set -> prop, forall A, of S R emp2 A Kind -> valid_sig_tp S R A.
let S R A. assume H.
prove of S R emp2 A Kind \/ of S R emp2 A Type.
apply orIL. exact H.
Qed.

Theorem valid_sig_tp_Type : forall S R:set -> set -> prop, forall A, of S R emp2 A Type -> valid_sig_tp S R A.
let S R A. assume H.
prove of S R emp2 A Kind \/ of S R emp2 A Type.
apply orIR. exact H.
Qed.

