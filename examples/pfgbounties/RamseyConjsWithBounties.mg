Definition TwoRamseyProp : set -> set -> set -> prop
 := fun M N V =>
      forall R:set -> set -> prop,
        (forall x y, R x y -> R y x)
       -> ((exists X c= V, equip M X /\ (forall x y :e X, x <> y -> R x y))
        \/ (exists Y c= V, equip N Y /\ (forall x y :e Y, x <> y -> ~R x y))).

(** not_TwoRamseyProp_3_7_22 TMJKbZjgHwR1R1hCak4EgwPjmA8HNR1AzVe bounty of about 300 bars **)
Theorem not_TwoRamseyProp_3_7_22 : ~TwoRamseyProp 3 7 22.
Admitted.

(** not_TwoRamseyProp_3_8_27 TMXv8MmejVaeybNBgqmLP4so3SqWZWxqJE7 bounty of about 500 bars **)
Theorem not_TwoRamseyProp_3_8_27 : ~TwoRamseyProp 3 8 27.
Admitted.

(** not_TwoRamseyProp_3_9_35 TMdKrj9bPB76LVKYCPjJUYHDSFYdfmXkww3 bounty of about 500 bars **)
Theorem not_TwoRamseyProp_3_9_35 : ~TwoRamseyProp 3 9 35.
Admitted.

(** not_TwoRamseyProp_3_10_39 TMKUcnY4Z28obHfQWVZn56bFru9zRQdBzzA bounty of about 500 bars **)
Theorem not_TwoRamseyProp_3_10_39 : ~TwoRamseyProp 3 10 39.
Admitted.

(** not_TwoRamseyProp_4_7_48 TMWNCQzzBFKBFRj2Vg4QhjCUg9Pno3QpkbU bounty of about 500 bars **)
Theorem not_TwoRamseyProp_4_7_48 : ~TwoRamseyProp 4 7 48.
Admitted.

(** not_TwoRamseyProp_4_8_58 TMEoc7MD7M2kuGeqGA7VTD67gWsQvS7QyjS bounty of about 500 bars **)
Theorem not_TwoRamseyProp_4_8_58 : ~TwoRamseyProp 4 8 58.
Admitted.

(** not_TwoRamseyProp_4_9_72 TMVDStJK2rAYDiNJCHMNaCGuAU5KY6GpwG1 bounty of about 500 bars **)
Theorem not_TwoRamseyProp_4_9_72 : ~TwoRamseyProp 4 9 72.
Admitted.

(** not_TwoRamseyProp_5_5_42 TMbu5cNHpJ8J5t435KssbZiaKf7Av2ASGBH bounty of about 300 bars **)
Theorem not_TwoRamseyProp_5_5_42 : ~TwoRamseyProp 5 5 42.
Admitted.

(** not_TwoRamseyProp_5_6_57 TMGVzjSdaN6obxzPsnYbvq9nQJ5sH3qYUGL bounty of about 500 bars **)
Theorem not_TwoRamseyProp_5_6_57 : ~TwoRamseyProp 5 6 57.
Admitted.

(** not_TwoRamseyProp_5_7_79 TMW6xdLtbxVSHVaUL6epngvPdpDXyzQoeHp bounty of about 500 bars **)
Theorem not_TwoRamseyProp_5_7_79 : ~TwoRamseyProp 5 7 79.
Admitted.

(** not_TwoRamseyProp_5_8_100 TMPs8cxp8Zg5ugHirdaPo8qrEuBCkcZ8tcf bounty of about 500 bars **)
Theorem not_TwoRamseyProp_5_8_100 : ~TwoRamseyProp 5 8 100.
Admitted.

(** not_TwoRamseyProp_6_6_101 TMLsyJxzLDBGJt4RLuXffhVfBnk72RE9DL4 bounty of about 500 bars **)
Theorem not_TwoRamseyProp_6_6_101 : ~TwoRamseyProp 6 6 101.
Admitted.

(** not_TwoRamseyProp_6_7_114 TMcWxeWu1w1WJJfzUim5sTbF4UaXzfcJuDa bounty of about 500 bars **)
Theorem not_TwoRamseyProp_6_7_114 : ~TwoRamseyProp 6 7 114.
Admitted.

(** TwoRamseyProp_3_6_18 TMbJ1MogStdKCGN3J3j1hThprkcWjA8ggEB bounty of about 800 bars **)
Theorem TwoRamseyProp_3_6_18 : TwoRamseyProp 3 6 18.
Admitted.

(** TwoRamseyProp_3_7_23 TMGKH8FtpMKQL5nSjsU22A45gjtZpd5Yarm bounty of about 300 bars **)
Theorem TwoRamseyProp_3_7_23 : TwoRamseyProp 3 7 23.
Admitted.

(** TwoRamseyProp_3_8_28 TMJeasRF8U3ej45EdWxUA85TXjati3kbPyS bounty of about 500 bars **)
Theorem TwoRamseyProp_3_8_28 : TwoRamseyProp 3 8 28.
Admitted.

(** TwoRamseyProp_3_9_36 TMavx891tAmc71YDKiSXQBD2Rm932Qp23tk bounty of about 500 bars **)
Theorem TwoRamseyProp_3_9_36 : TwoRamseyProp 3 9 36.
Admitted.

(** TwoRamseyProp_3_10_42 TMLgkDpY2A4KZzDRtTk8w1SzySmFN7ygd1R bounty of about 500 bars **)
Theorem TwoRamseyProp_3_10_42 : TwoRamseyProp 3 10 42.
Admitted.

(** TwoRamseyProp_4_5_25 TMaGCJ8SmUjESVqqhCFM894vFTpNfi7Zcbo bounty of about 800 bars **)
Theorem TwoRamseyProp_4_5_25 : TwoRamseyProp 4 5 25.
Admitted.

(** TwoRamseyProp_4_6_41 TMGyu8j3dnjTxE99spsMGXnkEp8QU5d7ePK bounty of about 300 bars **)
Theorem TwoRamseyProp_4_6_41 : TwoRamseyProp 4 6 41.
Admitted.

(** TwoRamseyProp_4_7_61 TMXtyXPKJFL6wYpipDCsjK7fJScGSuFPN1S bounty of about 500 bars **)
Theorem TwoRamseyProp_4_7_61 : TwoRamseyProp 4 7 61.
Admitted.

(** TwoRamseyProp_4_8_84 TML8t7q8Wz5HP9YGrvJcp2vGuNDwrRGNP57 bounty of about 500 bars **)
Theorem TwoRamseyProp_4_8_84 : TwoRamseyProp 4 8 84.
Admitted.

(** TwoRamseyProp_4_9_115 TMRc1h6FhfYCoCofHKNvxpR82dzXF2ndG1R bounty of about 500 bars **)
Theorem TwoRamseyProp_4_9_115 : TwoRamseyProp 4 9 115.
Admitted.

(** TwoRamseyProp_5_5_48 TMctie53cBVHdM4Dvc2CpJMCm7QGMPDGRQm bounty of about 300 bars **)
Theorem TwoRamseyProp_5_5_48 : TwoRamseyProp 5 5 48.
Admitted.

(** TwoRamseyProp_5_6_87 TMcD2ZaGBnE6sxdoAA2GFAG6mQsKZPZHvdq bounty of about 500 bars **)
Theorem TwoRamseyProp_5_6_87 : TwoRamseyProp 5 6 87.
Admitted.

(** TwoRamseyProp_5_7_143 TMVSgM5dy7dbA4eVmKwUK4yUt8vdufNQapi bounty of about 500 bars **)
Theorem TwoRamseyProp_5_7_143 : TwoRamseyProp 5 7 143.
Admitted.

(** TwoRamseyProp_5_8_216 TMMm14Wr2mksV4NLhHHbALNnE9PqjBKWHKT bounty of about 500 bars **)
Theorem TwoRamseyProp_5_8_216 : TwoRamseyProp 5 8 216.
Admitted.

(** TwoRamseyProp_6_6_165 TMFcryYsFNf2kRz2njXmBfrmXoxJ9Dp7FkP bounty of about 500 bars **)
Theorem TwoRamseyProp_6_6_165 : TwoRamseyProp 6 6 165.
Admitted.

(** TwoRamseyProp_6_7_298 TMTj9pJWZUioWqtxHD9EmyauhheXzt3yYRj bounty of about 500 bars **)
Theorem TwoRamseyProp_6_7_298 : TwoRamseyProp 6 7 298.
Admitted.

(** not_TwoRamseyProp_3_9_Power_5 TMPP44pD9m61Ua5QkmuR3pGQpGyy1uVuguG bounty of about 500 bars **)
Theorem not_TwoRamseyProp_3_9_Power_5 : ~TwoRamseyProp 3 9 (Power 5).
Admitted.

(** not_TwoRamseyProp_3_10_Power_5 TMVPg3DwriFjvu4n82kK8Ka8fkKqzddN4vH bounty of about 500 bars **)
Theorem not_TwoRamseyProp_3_10_Power_5 : ~TwoRamseyProp 3 10 (Power 5).
Admitted.

(** not_TwoRamseyProp_4_9_Power_6 TMQGT6GGrGNc3fnpNVVyzYp1UfDQkmUx5hh bounty of about 500 bars **)
Theorem not_TwoRamseyProp_4_9_Power_6 : ~TwoRamseyProp 4 9 (Power 6).
Admitted.

(** not_TwoRamseyProp_5_5_Power_5 TMGmDYbRXrpoiZjRi312cY1fvzjX3vVcMbz bounty of about 100 bars **)
Theorem not_TwoRamseyProp_5_5_Power_5 : ~TwoRamseyProp 5 5 (Power 5).
Admitted.

(** not_TwoRamseyProp_5_7_Power_6 TMNXFB9HwrMCgkiMLxVBRW5nkQVbRbLU9YD bounty of about 500 bars **)
Theorem not_TwoRamseyProp_5_7_Power_6 : ~TwoRamseyProp 5 7 (Power 6).
Admitted.

(** not_TwoRamseyProp_5_8_Power_6 TMYZ6xiWaWa4LUtduMqzRe1BndeKk1nnKcV bounty of about 500 bars **)
Theorem not_TwoRamseyProp_5_8_Power_6 : ~TwoRamseyProp 5 8 (Power 6).
Admitted.

(** not_TwoRamseyProp_6_6_Power_6 TMTxgdseSpFSGHDNR7RSMbhK5Wk3jSstF5Q bounty of about 500 bars **)
Theorem not_TwoRamseyProp_6_6_Power_6 : ~TwoRamseyProp 6 6 (Power 6).
Admitted.

(** not_TwoRamseyProp_6_7_Power_6 TMExwwLP8cRBB4esj7b44gEfGL8BFAi8H6F bounty of about 500 bars **)
Theorem not_TwoRamseyProp_6_7_Power_6 : ~TwoRamseyProp 6 7 (Power 6).
Admitted.

(** TwoRamseyProp_3_8_Power_5 TMXaAN4JK3kL6dtksJvq6QFMvxFqNdDnm74 bounty of about 500 bars **)
Theorem TwoRamseyProp_3_8_Power_5 : TwoRamseyProp 3 8 (Power 5).
Admitted.

(** TwoRamseyProp_4_6_Power_6 TMd3rAdqu6qzfWvG6z8fctmdsnvMEex6ykJ bounty of about 100 bars **)
Theorem TwoRamseyProp_4_6_Power_6 : TwoRamseyProp 4 6 (Power 6).
Admitted.

(** TwoRamseyProp_4_7_Power_6 TMUTpcc8in2onNu2AC3fbS6Q9SegWNaMCmE bounty of about 500 bars **)
Theorem TwoRamseyProp_4_7_Power_6 : TwoRamseyProp 4 7 (Power 6).
Admitted.

(** TwoRamseyProp_4_9_Power_7 TMYjJ5cgHonhxfDky3NTprMxo36acV14s8x bounty of about 500 bars **)
Theorem TwoRamseyProp_4_9_Power_7 : TwoRamseyProp 4 9 (Power 7).
Admitted.

(** TwoRamseyProp_5_6_Power_7 TMdu7Jgg2EakX7Nvz69Z1gfVbW2afcXvDVA bounty of about 500 bars **)
Theorem TwoRamseyProp_5_6_Power_7 : TwoRamseyProp 5 6 (Power 7).
Admitted.

(** TwoRamseyProp_5_7_Power_8 TMQjipjMrCSNCqNGoiGJVr3qghrzBSnicBx bounty of about 500 bars **)
Theorem TwoRamseyProp_5_7_Power_8 : TwoRamseyProp 5 7 (Power 8).
Admitted.

(** TwoRamseyProp_5_8_Power_8 TMQjEqYWm45Jzke34ekXu4NhZB6ejU4NJKb bounty of about 500 bars **)
Theorem TwoRamseyProp_5_8_Power_8 : TwoRamseyProp 5 8 (Power 8).
Admitted.

(** TwoRamseyProp_6_6_Power_8 TMH3bevkcqvh8mvvjxFmnKn1ZN54nPPmNma bounty of about 500 bars **)
Theorem TwoRamseyProp_6_6_Power_8 : TwoRamseyProp 6 6 (Power 8).
Admitted.

(** TwoRamseyProp_3_10_40 TMdvEn8UmrSjZRZwuJBKRu3CDNJVsVpbEZJ bounty of about 500 bars **)
Theorem TwoRamseyProp_3_10_40 : TwoRamseyProp 3 10 40.
Admitted.

(** TwoRamseyProp_3_10_41 TMFULvhHjCsGFYPpsvnET6iD7oP1RL5JiHW bounty of about 500 bars **)
Theorem TwoRamseyProp_3_10_41 : TwoRamseyProp 3 10 41.
Admitted.

(** TwoRamseyProp_4_6_36 TMUnmw49fNPNqFFquQctTBy16LwoDRrxTg7 bounty of about 500 bars **)
Theorem TwoRamseyProp_4_6_36 : TwoRamseyProp 4 6 36.
Admitted.

(** TwoRamseyProp_4_6_40 TMN4q5W37NkZMoR6vedSpCh9okznLfUoQbH bounty of about 500 bars **)
Theorem TwoRamseyProp_4_6_40 : TwoRamseyProp 4 6 40.
Admitted.

(** TwoRamseyProp_4_7_49 TMXZCujSRwE3ypPsErAyadfWgkYTrvzwgKb bounty of about 500 bars **)
Theorem TwoRamseyProp_4_7_49 : TwoRamseyProp 4 7 49.
Admitted.

(** TwoRamseyProp_4_7_60 TMa9UyXyWCAfApzbofsANmb2xABVQdP4og7 bounty of about 500 bars **)
Theorem TwoRamseyProp_4_7_60 : TwoRamseyProp 4 7 60.
Admitted.

(** TwoRamseyProp_4_8_59 TMdvK7rphvbxbWK3nPKGsaqxfChhJg49aCK bounty of about 500 bars **)
Theorem TwoRamseyProp_4_8_59 : TwoRamseyProp 4 8 59.
Admitted.

(** TwoRamseyProp_4_8_83 TMVJbMfaXk3HFrKnfAMfXYBJzo57MiwdVe6 bounty of about 500 bars **)
Theorem TwoRamseyProp_4_8_83 : TwoRamseyProp 4 8 83.
Admitted.

(** TwoRamseyProp_4_9_73 TMVRXEJ5cjvMtDZmVkM6JU5ZrWgQHMk4dVn bounty of about 500 bars **)
Theorem TwoRamseyProp_4_9_73 : TwoRamseyProp 4 9 73.
Admitted.

(** TwoRamseyProp_4_9_114 TMKENiMj8e2EAfjfbMajJn6DVuR7nGTomoB bounty of about 500 bars **)
Theorem TwoRamseyProp_4_9_114 : TwoRamseyProp 4 9 114.
Admitted.

(** TwoRamseyProp_5_5_43 TMNUq5RbcM6eMfgZZQwN7xZNjZQaoV9H2Vo bounty of about 500 bars **)
Theorem TwoRamseyProp_5_5_43 : TwoRamseyProp 5 5 43.
Admitted.

(** TwoRamseyProp_5_5_47 TMHQLAu8LNq833psgUYemBdTPiRj2wTeAyb bounty of about 500 bars **)
Theorem TwoRamseyProp_5_5_47 : TwoRamseyProp 5 5 47.
Admitted.

(** TwoRamseyProp_5_6_58 TMPGnKYdBa3khY844daC3MQL8bRM2LmZ8yv bounty of about 500 bars **)
Theorem TwoRamseyProp_5_6_58 : TwoRamseyProp 5 6 58.
Admitted.

(** TwoRamseyProp_5_6_86 TMJ7MPMgsZpZQkTaVS352SSVg1mcEGMKtkx bounty of about 500 bars **)
Theorem TwoRamseyProp_5_6_86 : TwoRamseyProp 5 6 86.
Admitted.

(** TwoRamseyProp_5_7_80 TMbpMY5y2tVTnzo6TLtjiRUusv3eKTSXsKn bounty of about 500 bars **)
Theorem TwoRamseyProp_5_7_80 : TwoRamseyProp 5 7 80.
Admitted.

(** TwoRamseyProp_5_7_142 TMa7KQh2wjJGHQ2Kyf5VPBowLgAaKWQ1LDa bounty of about 500 bars **)
Theorem TwoRamseyProp_5_7_142 : TwoRamseyProp 5 7 142.
Admitted.

(** TwoRamseyProp_5_8_101 TMXm5VieR3P3dBUvtSEpesaMqWpwDN1M3Va bounty of about 500 bars **)
Theorem TwoRamseyProp_5_8_101 : TwoRamseyProp 5 8 101.
Admitted.

(** TwoRamseyProp_5_8_215 TMLZCSMmwK2QPMcAiYXtjNvHzpWoeRrAtn2 bounty of about 500 bars **)
Theorem TwoRamseyProp_5_8_215 : TwoRamseyProp 5 8 215.
Admitted.

(** TwoRamseyProp_6_6_102 TMVADVhyFCzdS62thUm1sCyWzWwqbrZgrjq bounty of about 500 bars **)
Theorem TwoRamseyProp_6_6_102 : TwoRamseyProp 6 6 102.
Admitted.

(** TwoRamseyProp_6_6_164 TMW9bczVUMdHGUsDKNseVb6Z4KJxYd5HK9R bounty of about 500 bars **)
Theorem TwoRamseyProp_6_6_164 : TwoRamseyProp 6 6 164.
Admitted.

(** TwoRamseyProp_6_7_115 TMWy6aLQZ8awR6aqVNTTgj3ZLwovY2a39s2 bounty of about 500 bars **)
Theorem TwoRamseyProp_6_7_115 : TwoRamseyProp 6 7 115.
Admitted.

(** TwoRamseyProp_6_7_297 TMZXeYbd2fNjbxnQqC2Fxqgp3AK6JjC9dHT bounty of about 500 bars **)
Theorem TwoRamseyProp_6_7_297 : TwoRamseyProp 6 7 297.
Admitted.
