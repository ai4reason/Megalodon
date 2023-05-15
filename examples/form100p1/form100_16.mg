Definition Ring_with_id_omega : set -> set -> set
 := fun R n =>
      unpack_b_b_e_e_i R
         (fun Q plus mult zero one => nat_primrec zero (fun _ r => plus r one) n).

Definition Ring_with_id_minus_omega : set -> set -> set
 := fun R n => Ring_minus (Ring_of_Ring_with_id R) (Ring_with_id_omega R n).

Definition Ring_with_id_eval_poly : set -> set -> set -> set -> set
 := fun R n cs x =>
      unpack_b_b_e_e_i R
        (fun R plus mult zero one =>
	  explicit_Ring_with_id_eval_poly R zero one plus mult n cs x).

Definition Field_characteristic_0 : set -> prop
 := fun F => struct_b_b_e_e F
          /\ unpack_b_b_e_e_o F
               (fun Q plus mult zero one =>
                    explicit_Field Q zero one plus mult
                 /\ forall n :e omega, nat_primrec one (fun _ r => plus one r) n <> zero).

Definition Ring_with_id_exp_nat : set -> set -> set -> set :=
    fun R a n =>
      unpack_b_b_e_e_i R
         (fun Q plus mult zero one => explicit_Ring_with_id_exp_nat Q zero one plus mult a n).

Definition poly_splits_in_field : set -> set -> set -> set -> prop
 := fun F F' n cs =>
        subfield F F'
     /\ cs :e F 0 :^: ordsucc n (** n+1 coefficients from the carrier of F, degree n poly **)
     /\ exists q:set -> (set -> set -> set) -> (set -> set -> set) -> set -> set,
           exists a :e F 0,
           unpack_b_b_e_e_o F'
            (fun Q' plus' mult' zero' one' =>
              exists ps :e (Q' :^: 2) :^: n, (** n degree 1 polynomials with coefficients from Q', should be of the form x + r where -r is a root **)
                 (forall i :e n, ps i 1 = one') (** leading coefficient of each linear poly is one **)
              /\ (forall x :e Q', Ring_with_id_eval_poly F' (ordsucc n) cs x
                                = nat_primrec a (fun i r => mult' r (Ring_with_id_eval_poly F' 2 (ps i) x)) n)).

Definition splitting_field_for : set -> set -> set -> set -> prop
 := fun F F' n cs => poly_splits_in_field F F' n cs
     /\ forall F'', poly_splits_in_field F F'' n cs
          -> exists g, Field_Hom F' F'' g
                    /\ (forall a :e F 0, g a = a)
                    /\ (forall a b :e F 0, g a = g b -> a = b).

Definition Univar_Polynomial_solvable_by_radicals : set -> set -> set -> prop
 := fun F n cs =>
     exists F', radical_field_extension F F' /\ splitting_field_for F F' n cs.

Theorem Abel_Ruffini_Theorem_v1 :
  exists F, Field_characteristic_0 F /\
  exists n :e omega, exists cs :e F 0 :^: ordsucc n,
    ~Univar_Polynomial_solvable_by_radicals F (ordsucc n) cs.
Admitted.

Theorem Abel_Ruffini_Theorem_v2 :
  exists F, Field_characteristic_0 F /\
  exists cs :e F 0 :^: 6,
    ~Univar_Polynomial_solvable_by_radicals F 5 cs.
Admitted.

(** https://en.wikipedia.org/wiki/Abel%E2%80%93Ruffini_theorem **)
Theorem Abel_Ruffini_Theorem_v2a :
  exists F, Field_characteristic_0 F /\
   ~Univar_Polynomial_solvable_by_radicals F 5
     (Ring_with_id_minus_omega F 1,
      Ring_with_id_minus_omega F 1,
      Ring_with_id_omega F 0,
      Ring_with_id_omega F 0,
      Ring_with_id_omega F 0,
      Ring_with_id_omega F 1).
Admitted.

(** Burton. Abstract Algebra. 1988. Wm. C. Brown. **)
Theorem Abel_Ruffini_Theorem_v2b :
  exists F, Field_characteristic_0 F /\
   ~Univar_Polynomial_solvable_by_radicals F 5
     (Ring_with_id_omega F 5,
      Ring_with_id_minus_omega F 10,
      Ring_with_id_omega F 0,
      Ring_with_id_omega F 0,
      Ring_with_id_omega F 0,
      Ring_with_id_omega F 1).
Admitted.

Theorem Galois_Group_radical_solvable : forall F K, radical_field_extension F K -> solvable_Group_p (Galois_Group K F).
Admitted.
