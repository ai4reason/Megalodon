Section Group1.

Variable Gs:set.
Hypothesis HGs: Group Gs.

Let G : set := Group_carrier Gs.
Infix * 355 right := Group_op Gs.

Variable Ns:set.
Hypothesis HNs: normal_subgroup Ns Gs.

Theorem Group_quotient_Group: Group (quotient_Group Gs Ns).
Admitted.

Theorem canonmap_quotient_Group: Group_Hom Gs (quotient_Group Gs Ns) (fun a :e G => canonical_elt (normal_subgroup_equiv Gs Ns) a).
Admitted.

End Group1.
