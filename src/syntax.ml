(* Copyright (c) 2020-2022 CIIRC (Czech Institute of Informatics, Robotics and Cybernetics) / CTU (Czech Technical University) *)
(*** File: syntax.ml ***)
(*** Chad E. Brown ***)
(*** Jan 18 2014 (Egal version started) ***)

let reportbushydeps = ref None;;

type pfgthy = HF | Egal | Mizar | HOAS;;

let pfgtheory : pfgthy ref = ref Egal;;

let pfgreserved : (string,unit) Hashtbl.t = Hashtbl.create 100;;

let eagerdeltas = ref false;;

let prim_legend : (int,string) Hashtbl.t = Hashtbl.create 100;;
let tmh_legend : (string,string) Hashtbl.t = Hashtbl.create 100;;
let knownh_legend : (string,string) Hashtbl.t = Hashtbl.create 100;;

Hashtbl.add pfgreserved "Prim" ();;
Hashtbl.add pfgreserved "Ap" ();;
Hashtbl.add pfgreserved "Lam" ();;
Hashtbl.add pfgreserved "Imp" ();;
Hashtbl.add pfgreserved "All" ();;
Hashtbl.add pfgreserved "Ex" ();;
Hashtbl.add pfgreserved "Eq" ();;
Hashtbl.add pfgreserved "PrAp" ();;
Hashtbl.add pfgreserved "TmAp" ();;
Hashtbl.add pfgreserved "PrLa" ();;
Hashtbl.add pfgreserved "TmLa" ();;
Hashtbl.add pfgreserved "Ext" ();;

(** HF theory **)
let pfghfprim : (string,int) Hashtbl.t = Hashtbl.create 100;;
let pfghfknname : (string,string) Hashtbl.t = Hashtbl.create 100;;

Hashtbl.add pfghfprim "174b78e53fc239e8c2aab4ab5a996a27e3e5741e88070dad186e05fb13f275e5" 0;;
Hashtbl.add pfghfprim "5bf697cb0d1cdefbe881504469f6c48cc388994115b82514dfc4fb5e67ac1a87" 1;;
Hashtbl.add pfghfprim "5867641425602c707eaecd5be95229f6fd709c9b58d50af108dfe27cb49ac069" 2;;
Hashtbl.add pfghfprim "058f630dd89cad5a22daa56e097e3bdf85ce16ebd3dbf7994e404e2a98800f7f" 3;;
Hashtbl.add pfghfprim "87fba1d2da67f06ec37e7ab47c3ef935ef8137209b42e40205afb5afd835b738" 4;;
Hashtbl.add pfghfprim "cfe97741543f37f0262568fe55abbab5772999079ff734a49f37ed123e4363d7" 5;;
Hashtbl.add pfghfprim "9c60bab687728bc4482e12da2b08b8dbc10f5d71f5cab91acec3c00a79b335a3" 6;;
Hashtbl.add pfghfprim "73c9efe869770ab42f7cde0b33fe26bbc3e2bd157dad141c0c27d1e7348d60f5" 7;;
Hashtbl.add pfghfprim "8a8e36b858cd07fc5e5f164d8075dc68a88221ed1e4c9f28dac4a6fdb2172e87" 8;;
Hashtbl.add pfghfprim "e2a83319facad3a3d8ff453f4ef821d9da495e56a623695546bb7d7ac333f3fe" 9;;
Hashtbl.add pfghfprim "844774016d959cff921a3292054b30b52f175032308aa11e418cb73f5fef3d54" 10;;
Hashtbl.add pfghfprim "2a38dbb37506341b157c11dddf8eb7d8404ce97eb50d5e940b23d5094ae39d70" 11;;
Hashtbl.add pfghfprim "b1b8f6f9d4d6136be8375ed2faddb54df84cdb3018ec6bd2ac07b2c25d3d8af8" 12;;
Hashtbl.add pfghfprim "e7493d5f5a73b6cb40310f6fcb87d02b2965921a25ab96d312adf7eb8157e4b3" 13;;
Hashtbl.add pfghfprim "384d9f66d8806a02ebe28da535de6ad3715d7edbe784c055e3c70df3ad888708" 14;;
Hashtbl.add pfghfprim "bb3da8f6f3861e950e002517b27fe9407103f6d9bfacf8e3d7600f2396cc1059" 15;;
Hashtbl.add pfghfprim "dcde207b36b2fb5f060060582bf079763feaf495d2165b7092e20cd10daf7a99" 16;;
Hashtbl.add pfghfprim "7c09f0cab3d30d5ff3c2ec8c2cff61e158c82ce67d886c8b6a8763990b8a0515" 17;;
Hashtbl.add pfghfprim "c59022da27533d1a9c86144e1d2afd1512d11dfffd04a979887af2e1ee5f6e59" 18;;
Hashtbl.add pfghfprim "c7df083c7cf25a97335c4c9d8dc333551ed272dcab0c9c75bdb57679962006f5" 19;;
Hashtbl.add pfghfprim "06a9db6a163cde1bda5ecbfee9ca49f646ff205577687d3f603d53e0c58aefb5" 20;;
Hashtbl.add pfghfprim "3c3963fd1d3e8a801895ec2bc1bdd6c0d1f64c3f6bee436c56b146112890c357" 21;;
Hashtbl.add pfghfprim "f73cdba5a4e557a8f57fbba8517c0f7593a0b36795e8f51b63ba62b37035c3d0" 22;;
Hashtbl.add pfghfprim "67f7963d11a96caa6d857a801e3a87a49e63de70c1a4d3f1be82810c5ca7eca7" 23;;
Hashtbl.add pfghfprim "161886ed663bc514c81ed7fe836cca71861bfe4dfe4e3ede7ef3a48dbc07d247" 24;;
Hashtbl.add pfghfprim "3e5bc5e85f7552688ed0ced52c5cb8a931e179c99646161ada3249216c657566" 25;;
Hashtbl.add pfghfprim "591ebe2d703dc011fd95f000dd1ad77b0dca9230146d2f3ea2cb96d6d1fba074" 26;;
Hashtbl.add pfghfprim "e66ec047c09acdc1e824084ea640c5c9a30ab00242f4c1f80b83c667c930e87e" 27;;
Hashtbl.add pfghfprim "8f39e0d849db8334a6b514454a2aef6235afa9fc2b6ae44712b4bfcd7ac389cc" 28;;
Hashtbl.add pfghfprim "0609dddba15230f51d1686b31544ff39d4854c4d7f71062511cc07689729b68d" 29;;
Hashtbl.add pfghfprim "4a0f686cd7e2f152f8da5616b417a9f7c3b6867397c9abde39031fa0217d2692" 30;;
Hashtbl.add pfghfprim "4267a4cfb6e147a3c1aa1c9539bd651e22817ab41fd8ab5d535fbf437db49145" 31;;
Hashtbl.add pfghfprim "f3818d36710e8c0117c589ed2d631e086f82fbcbf323e45d2b12a4eaddd3dd85" 32;;
Hashtbl.add pfghfprim "5057825a2357ee2306c9491a856bb7fc4f44cf9790262abb72d8cecde03e3df4" 33;;
Hashtbl.add pfghfprim "f3976896fb7038c2dd6ace65ec3cce7244df6bf443bacb131ad83c3b4d8f71fb" 34;;
Hashtbl.add pfghfprim "35f61b92f0d8ab66d988b2e71c90018e65fc9425895b3bae5d40ddd5e59bebc1" 35;;
Hashtbl.add pfghfprim "b90ec130fa720a21f6a1c02e8b258f65af5e099282fe8b3927313db7f25335ed" 36;;
Hashtbl.add pfghfprim "8c8f550868df4fdc93407b979afa60092db4b1bb96087bc3c2f17fadf3f35cbf" 37;;
Hashtbl.add pfghfprim "3578b0d6a7b318714bc5ea889c6a38cf27f08eaccfab7edbde3cb7a350cf2d9b" 38;;
Hashtbl.add pfghfprim "d2a0e4530f6e4a8ef3d5fadfbb12229fa580c2add302f925c85ede027bb4b175" 39;;
Hashtbl.add pfghfprim "2f8b7f287504f141b0f821928ac62823a377717763a224067702eee02fc1f359" 40;;
Hashtbl.add pfghfprim "f275e97bd8920540d5c9b32de07f69f373d6f93ba6892c9e346254a85620fa17" 41;;
Hashtbl.add pfghfprim "80aea0a41bb8a47c7340fe8af33487887119c29240a470e920d3f6642b91990d" 42;;
Hashtbl.add pfghfprim "158bae29452f8cbf276df6f8db2be0a5d20290e15eca88ffe1e7b41d211d41d7" 43;;
Hashtbl.add pfghfprim "0a445311c45f0eb3ba2217c35ecb47f122b2301b2b80124922fbf03a5c4d223e" 44;;
Hashtbl.add pfghfprim "153bff87325a9c7569e721334015eeaf79acf75a785b960eb1b46ee9a5f023f8" 45;;
Hashtbl.add pfghfprim "d772b0f5d472e1ef525c5f8bd11cf6a4faed2e76d4eacfa455f4d65cc24ec792" 46;;
Hashtbl.add pfghfprim "f7e63d81e8f98ac9bc7864e0b01f93952ef3b0cbf9777abab27bcbd743b6b079" 47;;
Hashtbl.add pfghfprim "f627d20f1b21063483a5b96e4e2704bac09415a75fed6806a2587ce257f1f2fd" 48;;
Hashtbl.add pfghfprim "8cf6b1f490ef8eb37db39c526ab9d7c756e98b0eb12143156198f1956deb5036" 49;;
Hashtbl.add pfghfprim "cc569397a7e47880ecd75c888fb7c5512aee4bcb1e7f6bd2c5f80cccd368c060" 50;;
Hashtbl.add pfghfprim "2ce94583b11dd10923fde2a0e16d5b0b24ef079ca98253fdbce2d78acdd63e6e" 51;;
Hashtbl.add pfghfprim "9ef333480205115fcb54535d5d8de44756eee80867000051222280db0c9646e4" 52;;
Hashtbl.add pfghfprim "6f4d9bb1b2eaccdca0b575e1c5e5a35eca5ce1511aa156bebf7a824f08d1d69d" 53;;
Hashtbl.add pfghfprim "7b717effbbdb47e1c3b6b0b11d8afebd925fdf397e15abe9de1d5ea74224420c" 54;;
Hashtbl.add pfghfprim "ee2e1f36ccc047af9077fcfe6de79d6c9574876b02cae0b4b919e11461760f0d" 55;;
Hashtbl.add pfghfprim "f97da687c51f5a332ff57562bd465232bc70c9165b0afe0a54e6440fc4962a9f" 56;;
Hashtbl.add pfghfprim "9db634daee7fc36315ddda5f5f694934869921e9c5f55e8b25c91c0a07c5cbec" 57;;
Hashtbl.add pfghfprim "25c483dc8509e17d4b6cf67c5b94c2b3f3902a45c3c34582da3e29ab1dc633ab" 58;;
Hashtbl.add pfghfprim "9161ec45669e68b6f032fc9d4d59e7cf0b3f5f860baeb243e29e767a69d600b1" 59;;
Hashtbl.add pfghfprim "e4d45122168d3fb3f5723ffffe4d368988a1be62792f272e949c6728cec97865" 60;;
Hashtbl.add pfghfprim "7a45b2539da964752f7e9409114da7fc18caef138c5d0699ec226407ece64991" 61;;
Hashtbl.add pfghfprim "dab6e51db9653e58783a3fde73d4f2dc2637891208c92c998709e8795ba4326f" 62;;
Hashtbl.add pfghfprim "dc688de6dbfa5c75bd45f1eb198583d07be144f0cdabb44def09da1c0976495b" 63;;
Hashtbl.add pfghfprim "fb5286197ee583bb87a6f052d00fee2b461d328cc4202e5fb40ec0a927da5d7e" 64;;
Hashtbl.add pfghfprim "3585d194ae078f7450f400b4043a7820330f482343edc5773d1d72492da8d168" 65;;
Hashtbl.add pfghfprim "d3f7df13cbeb228811efe8a7c7fce2918025a8321cdfe4521523dc066cca9376" 66;;
Hashtbl.add pfghfprim "f0267e2cbae501ea3433aecadbe197ba8f39c96e80326cc5981a1630fda29909" 67;;
Hashtbl.add pfghfprim "b260cb5327df5c1f762d4d3068ddb3c7cc96a9cccf7c89cee6abe113920d16f1" 68;;
Hashtbl.add pfghfprim "877ee30615a1a7b24a60726a1cf1bff24d7049b80efb464ad22a6a9c9c4f6738" 69;;
Hashtbl.add pfghfprim "dc75c4d622b258b96498f307f3988491e6ba09fbf1db56d36317e5c18aa5cac6" 70;;
Hashtbl.add pfghfprim "d744bcd791713cf88021ce34168c3e2d109a8a6c45637d74541d94007e3139ca" 71;;
Hashtbl.add pfghfprim "93592da87a6f2da9f7eb0fbd449e0dc4730682572e0685b6a799ae16c236dcae" 72;;
Hashtbl.add pfghfprim "ecef5cea93b11859a42b1ea5e8a89184202761217017f3a5cdce1b91d10b34a7" 73;;
Hashtbl.add pfghfprim "58c1782da006f2fb2849c53d5d8425049fad551eb4f8025055d260f0c9e1fe40" 74;;
Hashtbl.add pfghfprim "dac986a57e8eb6cc7f35dc0ecc031b9ba0403416fabe2dbe130edd287a499231" 75;;
Hashtbl.add pfghfprim "091d1f35158d5ca6063f3c5949e5cbe3d3a06904220214c5781c49406695af84" 76;;
Hashtbl.add pfghfprim "8ab5fa18b3cb4b4b313a431cc37bdd987f036cc47f175379215f69af5977eb3b" 77;;
Hashtbl.add pfghfprim "fcd77a77362d494f90954f299ee3eb7d4273ae93d2d776186c885fc95baa40dc" 78;;
Hashtbl.add pfghfprim "0775ebd23cf37a46c4b7bc450bd56bce8fc0e7a179485eb4384564c09a44b00f" 79;;
Hashtbl.add pfghfprim "04c0176f465abbde82b7c5c716ac86c00f1b147c306ffc6b691b3a5e8503e295" 80;;
Hashtbl.add pfghfprim "dc7715ab5114510bba61a47bb1b563d5ab4bbc08004208d43961cf61a850b8b5" 81;;
Hashtbl.add pfghfprim "ac96e86902ef72d5c44622f4a1ba3aaf673377d32cc26993c04167cc9f22067f" 82;;
Hashtbl.add pfghfprim "f36b5131fd375930d531d698d26ac2fc4552d148f386caa7d27dbce902085320" 83;;
Hashtbl.add pfghfprim "2336eb45d48549dd8a6a128edc17a8761fd9043c180691483bcf16e1acc9f00a" 84;;
Hashtbl.add pfghfprim "f91c31af54bc4bb4f184b6de34d1e557a26e2d1c9f3c78c2b12be5ff6d66df66" 85;;
Hashtbl.add pfghfprim "e59af381b17c6d7665103fc55f99405c91c5565fece1832a6697045a1714a27a" 86;;
Hashtbl.add pfghfprim "eb5699f1770673cc0c3bfaa04e50f2b8554934a9cbd6ee4e9510f57bd9e88b67" 87;;
Hashtbl.add pfghfprim "1e55e667ef0bb79beeaf1a09548d003a4ce4f951cd8eb679eb1fed9bde85b91c" 88;;
Hashtbl.add pfghfprim "3bbf071b189275f9b1ce422c67c30b34c127fdb067b3c9b4436b02cfbe125351" 89;;
Hashtbl.add pfghfprim "89e534b3d5ad303c952b3eac3b2b69eb72d95ba1d9552659f81c57725fc03350" 90;;
Hashtbl.add pfghfprim "87d7604c7ea9a2ae0537066afb358a94e6ac0cd80ba277e6b064422035a620cf" 91;;
Hashtbl.add pfghfprim "bf1decfd8f4025a2271f2a64d1290eae65933d0f2f0f04b89520449195f1aeb8" 92;;
Hashtbl.add pfghfprim "6f17daea88196a4c038cd716092bd8ddbb3eb8bddddfdc19e65574f30c97ab87" 93;;
Hashtbl.add pfghfprim "0d574978cbb344ec3744139d5c1d0d90336d38f956e09a904d230c4fa06b30d1" 94;;
Hashtbl.add pfghfprim "09cdd0b9af76352f6b30bf3c4bca346eaa03d280255f13afb2e73fe8329098b6" 95;;
Hashtbl.add pfghfprim "c271c80f80f5f72a61f48aa63abcf552ccb5c1c1455890804f46f810f52c1725" 96;;
Hashtbl.add pfghfprim "8aee977f39b94de3060d4e641f09019ff1a3f86f5572cb3093ec9aa4a0a4c21b" 97;;
Hashtbl.add pfghfprim "65c0daed14d78ada9e0321a2b41d12cc9f628aacc67d8a940c28f08abf25f617" 98;;
Hashtbl.add pfghfprim "c309fccae6f2952d12a16bfffc197737f9a1e290345afcd106428e646f9cbd2e" 99;;
Hashtbl.add pfghfprim "cbf428d60d780d655f1b7593b16f52a9cbc57bf95a866db8389c330113d406f3" 100;;
Hashtbl.add pfghfprim "f152c3f1281bd34cf1c2b19b596c7883b3995533b2fcccc0eaa6048037ebe4d3" 101;;
Hashtbl.add pfghfprim "4bc888f121f3c8defd33607bf8c316d9626aeb31d9d8b49058dc19828f9be72b" 102;;
Hashtbl.add pfghfprim "dff028b00391bf89df7db2deea89f2e8932114cc819135e93697f3555f1f256d" 103;;

Hashtbl.add pfghfknname "4d0b1b3ca489073915e8701e021a09da22887f41f83e407df8eafe040825db18" "Eps_i_R";;
Hashtbl.add pfghfknname "e4b03c310442ae760be9945e176494db51515dfb952ee60fbd42e05527752af0" "dneg";;
Hashtbl.add pfghfknname "0fab0105f86e62d59255f98965bf1f26e395b983e8db295c63f7ead552040aef" "prop_ext";;
Hashtbl.add pfghfknname "41b1004b8f2e1e9141952323c57666ef1579b53152eaac85192b8cb654c248b2" "set_ext";;
Hashtbl.add pfghfknname "4e2bc7210cca188ef72b6d1b20c4c39a92ac7ec6125ddca771f7a09009ead068" "EmptyAx";;
Hashtbl.add pfghfknname "5206cb1e5c68cffe15ac7d921c8f21359f42b338372c195a95adce69872cfe55" "UnionEq";;
Hashtbl.add pfghfknname "b492ab96942311595fd53c93243cb7ab5314986bb8460d580d9382dfab90f7d1" "PowerEq";;
Hashtbl.add pfghfknname "36cbd0e8c9859edf89f9d4e1c909caa30ef1b164cf86c3a590cd13c7750534e9" "ReplEq";;
Hashtbl.add pfghfknname "de0eaf5d33c0b573d63cc09df92572f243045babd3e3cb9aa49e72d618f6c7c9" "HF_Min";;
Hashtbl.add pfghfknname "73fa935250c44cafb3971bffe3b0cdef8869cd5693da6149f81741261543e04d" "In_ind";;
Hashtbl.add pfghfknname "b473ad9c9918cc7be1d7c29b9ee03bc23f47466c37aeaf71e6be8cb7e1cf303f" "False_def";;
Hashtbl.add pfghfknname "d8b1e4f182bfcec470fe7eea737c79a527fc286ab08d2c395b0361f45f2ba0ee" "True_def";;
Hashtbl.add pfghfknname "f025439203fb01208b8741e899c3517dde02d78a3ac94c10d78cc84af88508bd" "not_def";;
Hashtbl.add pfghfknname "dc1664fc81c300e53160f04faaeaff65a2bb7223fee8d688ae4138c009f113dd" "and_def";;
Hashtbl.add pfghfknname "27759e669158c829fb7d3d5b7f08a9a556dace9913d27ba8a473751e0f58a125" "or_def";;
Hashtbl.add pfghfknname "b86970ee1757eea1f06bfdbeab04661f2eb58efecec3ec51a690f2034fb178a2" "iff_def";;
Hashtbl.add pfghfknname "d19695f3f232d868e0d173308b1485f5a672db8d6d2e2fdb22798c72e3a24b1e" "Subq_def";;
Hashtbl.add pfghfknname "866dbcf42d4554c0d35bc97d0273c3851c37e26e2a87fa1e029b654d8bf8d1ca" "TransSet_def";;
Hashtbl.add pfghfknname "f90aa94ea2ccb281dc50b80c53cd84d43c275f66c3cb45ef83130cd5ea5f84db" "atleast2_def";;
Hashtbl.add pfghfknname "a703842a9d0a604aa91bd6de73ae7c7599f2b89d0195246be3eb7cfad204f480" "atleast3_def";;
Hashtbl.add pfghfknname "141dce782ecd197c13dc05628f4fe040032438393762d62874daffe79ef2268a" "atleast4_def";;
Hashtbl.add pfghfknname "6620b2ab1330a972ee8d13edfb67de4eacfea4623021a69ab91aba1bc5486482" "atleast5_def";;
Hashtbl.add pfghfknname "6ba14c122e9a0dc11fb0cc698721916647647d29869c54a909f7ac9aaa20b4de" "atleast6_def";;
Hashtbl.add pfghfknname "d2009e03cbbe1ff649d90ca190353c0195ad2a37a3e0b4aae69e88f5760763b4" "exactly2_def";;
Hashtbl.add pfghfknname "6660815c9e18e7c5d06d6b80ed5861acf153606a08bd14cb03f5ce1f9bb7c549" "exactly3_def";;
Hashtbl.add pfghfknname "586cb383efcc9274c1a5cd6c007638d11fafffa82c9ca73a3b2df8bbea8a0ac7" "exactly4_def";;
Hashtbl.add pfghfknname "4ef4fc126a12b2291e1d600f286444a9a3606d764e477007b40b95371bf7662c" "exactly5_def";;
Hashtbl.add pfghfknname "1ee3302698bcb2c7867b8148330fec36841a07ec0b898f45cb8df19bd47ad8ca" "exu_i_def";;
Hashtbl.add pfghfknname "15fec847b5eedab6f8bc99ebb50781626caef5d65b4ef634ac1c140003145eba" "reflexive_i_def";;
Hashtbl.add pfghfknname "064251eb4d64bfcfe2dbb7036e2cffb5e9be4debe64169fc0b64e5c816af2d2d" "irreflexive_i_def";;
Hashtbl.add pfghfknname "7d00bc10f6ad193d17d0b88423d050d76590ec9a00f9b240e0f2ccf907eee3ed" "symmetric_i_def";;
Hashtbl.add pfghfknname "ef3aa3e1b4d689ddd4c0fe2668544fdb470034e66da44594d21a07ac7aed20da" "antisymmetric_i_def";;
Hashtbl.add pfghfknname "f1d38952a8e7f77cb5b871bea26c16ee679f1bf1bd1bc40c7985e7187c3ea0bb" "transitive_i_def";;
Hashtbl.add pfghfknname "5a3fd8f2cf1480eee62b842b1c0b3b6db5ba80c1985063ca6dcbb06abf4d34f0" "eqreln_i_def";;
Hashtbl.add pfghfknname "d587051f0ca663beaee539b5c7c1a03ceaa1b46c97d7383a1ca8806db09f1d8e" "per_i_def";;
Hashtbl.add pfghfknname "b200928a20d21735cc0af6fa7c870b170a4db3d5e88217cc242329b25d84cf86" "linear_i_def";;
Hashtbl.add pfghfknname "741acbc5a4bf92baedfa5c23ed298e1b520b91aed70ca83f4269f898a4106541" "trichotomous_or_i_def";;
Hashtbl.add pfghfknname "9e462710824cabfec9de39cdff20d19402310de37dfef2dc568e559856c868aa" "partialorder_i_def";;
Hashtbl.add pfghfknname "2e048bda28405de21b9e617b3f745e5d3035361962c675a82a3b5b0bab8d9300" "totalorder_i_def";;
Hashtbl.add pfghfknname "ac246827b8e30ee0bdb769ad911ccc2c1e1a54654ecaa200e86fbb3da01a6a61" "strictpartialorder_i_def";;
Hashtbl.add pfghfknname "365a7281af1cbf5fc69c86c6e7ba6645ec88e69ee08fa41cb3507cbb003d4eeb" "stricttotalorder_i_def";;
Hashtbl.add pfghfknname "f527171847882df226b7124e83d0030a8d25a522554ec88ebdfdf6f3f4d0f0e8" "If_i_def";;
Hashtbl.add pfghfknname "464987a2ad498860dd6a7cc33bada9e963b7bb7853b08edfd85f53b6f6fe7381" "exactly1of2_def";;
Hashtbl.add pfghfknname "dbd431814e07ea423fc6370b502780c8a0872537fd7a4c5bd4549246503ae3ed" "exactly1of3_def";;
Hashtbl.add pfghfknname "bd76e531fc7a8ed39d008c4f87c276d214b522875c8315b99b6c9b38485023d2" "nIn_def";;
Hashtbl.add pfghfknname "572abf072260ddf309f0a2f3b3f13276fefde702e2f5c70aaa72cc2efbb816ef" "nSubq_def";;
Hashtbl.add pfghfknname "d2f3d81ce8b6ea6e95412f66720543226e9ea3741ce88e14e8e3c4c8b7812a0a" "UPair_def";;
Hashtbl.add pfghfknname "554a477931702afb1eb68ab4324d4de9da80e73236430fade24c2c7080cfb1fa" "Sing_def";;
Hashtbl.add pfghfknname "b10119e58d408c73522a7820cd9a29b903ddc3a37b5fe8fca1e45bd1b4101b5f" "binunion_def";;
Hashtbl.add pfghfknname "afec65b390095d370779e024c711ab868bf135e8a62cdf3b8893e70afc7503d5" "SetAdjoin_def";;
Hashtbl.add pfghfknname "922c01fecc8a6d771b07a08c465fb687f099d674c3630deb232d5553ec648ad1" "famunion_def";;
Hashtbl.add pfghfknname "12820df3302265c7fbaf0a4fbe09ac48b4ebad48e7953a671aee16d60a5610f3" "Sep_def";;
Hashtbl.add pfghfknname "6b83e25db3df911537a2cde43995008632e245b0679e12c1949fb168ef626372" "ReplSep_def";;
Hashtbl.add pfghfknname "2d84495a5a228c61e5bcfa757b06de12a5cb7eaf22e1979742846f5d18a7a98d" "binintersect_def";;
Hashtbl.add pfghfknname "dc87a9ffd7a39a5d72301ac394d9604bbdfb6b2cfe5e507a7248d05a87ad6f60" "setminus_def";;
Hashtbl.add pfghfknname "8725773844f3b041309396003ac8e76b21fcb56c96e54747e95ba01a831f33e8" "inj_def";;
Hashtbl.add pfghfknname "3443f52b74e17e8105890fbeac1841b246d71469124783f7c9fdadc8b49308be" "bij_def";;
Hashtbl.add pfghfknname "f7a09b7a58d286a0dfb678d8da4ab8320983e945baf203133136ac4d50401b41" "atleastp_def";;
Hashtbl.add pfghfknname "eaaf4094c0ea89ec07b329573cb8bedd33850f5653f1510b2f843cdbdaceb9f7" "equip_def";;
Hashtbl.add pfghfknname "9d44a6b7062eb0daf6dee4f01808066e44babe00dab2f300d5c2888e2373aac3" "In_rec_poly_G_i_def";;
Hashtbl.add pfghfknname "64272f2d4ac604200cce5a7199adacfe999b58f69968fab44d934b23391b77eb" "In_rec_poly_i_def";;
Hashtbl.add pfghfknname "55a742b445a6c791407a41bcacf3cb7b1ec710a463c251f6134eaa2de74bcf18" "ordsucc_def";;
Hashtbl.add pfghfknname "3420d9d032cef82dd17e9dacfe93f8763ff4470d6c5faab0c94d9b692148c412" "nat_p_def";;
Hashtbl.add pfghfknname "7c67e84f3df4606d476677f0a80b26df40de299f16e87eafc3d28a86de41d745" "nat_primrec_def";;
Hashtbl.add pfghfknname "54b3761cc4b2183c3459b377fb2511e605f1a8fd2f1ddebbfc909450dad5a4ef" "add_nat_def";;
Hashtbl.add pfghfknname "b35f97e058888684b8c42a84bc499032f00499ebcbd1102d4e5126243eaf92f7" "mul_nat_def";;
Hashtbl.add pfghfknname "52482519eeceb4095a9410aafda54d9170e6251f2659499c52424539b6ba90a9" "ordinal_def";;
Hashtbl.add pfghfknname "7e67c13b91338ac608b29691e8375854b932c9b06d10cacb0c9e83d08478eb1a" "V__def";;
Hashtbl.add pfghfknname "904df15a641757811fc64e68c8790dc99255f6f23a5a1fca8a2dd0062214dd5f" "Inj1_def";;
Hashtbl.add pfghfknname "6102787581a22e0f58454da3c71dd11253824a00fbd97b9e4f475a608e2018dc" "Inj0_def";;
Hashtbl.add pfghfknname "39d403033e64174a835078c562805e92c60140a2c89cfb32806fbf1eb4ed7022" "Unj_def";;
Hashtbl.add pfghfknname "a568f6925326a250e7600b97f266e41dc669ec030235bc057dd16ef29828e7e4" "combine_funcs_def";;
Hashtbl.add pfghfknname "2599898996462cb0162aff0720f0d4eb974df2d07bc5fb8eeaf0fc413dea29ef" "setsum_def";;
Hashtbl.add pfghfknname "7f1c52313b1eeccaf710e7b8ebe2bcd81bca044598e4bfb524cc12ea41ce29e7" "proj0_def";;
Hashtbl.add pfghfknname "df80873a64df56bcf11135a2789ea9b13989067b38647620bb14a7002ebe7bbf" "proj1_def";;
Hashtbl.add pfghfknname "867da1c87d86c7decce481bc3ce02387488e600047c980a9987e5d3a84819255" "binrep_def";;
Hashtbl.add pfghfknname "ff656464c2a35843ba4bbf94ca8fcda010281b38ff3033ab11c801132ecf4488" "lam_def";;
Hashtbl.add pfghfknname "04066c2662d563918cacf3cdb8201eadccda7b3cd977dfb5c48f0ae0c4404814" "setprod_def";;
Hashtbl.add pfghfknname "4cc5a2ff81402353f76b313a8c49f54c017dda5deb9df22bac241e5b1f3edc30" "ap_def";;
Hashtbl.add pfghfknname "8f7fc690f78c58bbd65abb579da0a2ea977736fa04f68db517c1c38b08b99db0" "setsum_p_def";;
Hashtbl.add pfghfknname "abaac70d1f1b814c8db56598d6add19e82cd31fbb80b6d00d5ba992524854b0c" "tuple_p_def";;
Hashtbl.add pfghfknname "3ab62e54b8183ce5a71e0795deda20c0690cfd0e9ebb775b90c0af1dd485b602" "Pi_def";;
Hashtbl.add pfghfknname "96d4dd0c1ba9b65eecf037e4e8d9b8357f903b6a6e7b0d5840b34402a761e2aa" "setexp_def";;
Hashtbl.add pfghfknname "dd0ad40c7379761f12272cbe82205119e86020fa48b5cb68a84e812ea0dc4cf2" "Sep2_def";;
Hashtbl.add pfghfknname "53d1c88cf93b204c23fdc73ee1f2a31faab3555092dcf2d13bd2930ade3aa9fd" "set_of_pairs_def";;
Hashtbl.add pfghfknname "2258ad14aeb3646753a99caf86749fafbed7e4c6b96b123c179b5eb35590c00c" "lam2_def";;
Hashtbl.add pfghfknname "f5c78d7ac16bbd897ebb3d454ab1cd7f9293aacb85b51d6e2d77ac161c6aeaa9" "PNoEq__def";;
Hashtbl.add pfghfknname "162375fbd86c5d519196cf18da14d5ed54c3f7cf82940247e45769aa76a57e40" "PNoLt__def";;
Hashtbl.add pfghfknname "4a3f268d85564bb8791305d5cfc00c7ca583ac2643af08c9c64aaed9d9502d2b" "PNoLt_def";;
Hashtbl.add pfghfknname "5cba52f2347cd25c57321e4b4b84c86be9c4563eab6471d084a316fba6d25030" "PNoLe_def";;
Hashtbl.add pfghfknname "13258e1f5d4a2643a1549f9714a456fca2aade1be40f8499faa7cd1c4869d332" "PNo_downc_def";;
Hashtbl.add pfghfknname "c6f87070e0538a2770d3dd759caea31f3628afbec8831176292f6ea08b25af4f" "PNo_upc_def";;
Hashtbl.add pfghfknname "1b21a591a91c0eb2f7d4082a3c5bf9588c29e41b071c31e04a33ebb58a8dda8d" "SNoElts__def";;
Hashtbl.add pfghfknname "82df04260594aa489dc5962975a15987938bbb37690535eaaeaa91b7c08a3868" "SNo__def";;
Hashtbl.add pfghfknname "ee04f5da0f3d645ba581e47989d64793ffb8cd3fdc8a053aa7f70c9f23c8df23" "PSNo_def";;
Hashtbl.add pfghfknname "00821ffdcd36dda11c2adb0d9ba6d074888e7e61d5c48a8edf3d5c49d89326b3" "SNo_def";;
Hashtbl.add pfghfknname "7952f08fb7fe7fb44139cd3db3228728b70d916b37bd8b042cea4808b7f23407" "SNoLev_def";;
Hashtbl.add pfghfknname "7150dcb5337f259199e19ef556b5bb9b251a47e4a5a86cd0da160c3a54f2e681" "SNoEq__def";;
Hashtbl.add pfghfknname "ef0fdb780cd7881d61cdf680d4163acad949a5d9ceb5f69bbfe03e6b7e1e13aa" "SNoLt_def";;
Hashtbl.add pfghfknname "692ba143db461ed1eecaf80a8d1b3a764e60a1bba5e63aded7267c4c9296cd9d" "SNoLe_def";;
Hashtbl.add pfghfknname "f37386d70cae9fddb0dc5ca7e4ce6be135d7ac249832b637f6adfdd8b801b5e3" "binop_on_def";;
Hashtbl.add pfghfknname "c3226671e2aa9c97d68996272ba2f85e00d1e4985718658f39eb97f95cf854a8" "Loop_def";;
Hashtbl.add pfghfknname "224f062ec0e5871d4e35b2277008bcbb5cf06f9cee2a8c0d0f3797dfafc390e3" "Loop_with_defs_def";;
Hashtbl.add pfghfknname "e788b52757ccbf1862b39f5567d43501ac796f21bffe2ea598d811bbdb2133d3" "Loop_with_defs_cex1_def";;
Hashtbl.add pfghfknname "99dcd262fd027f306fbe8ad22cbd1732f1179e836383110a981b77b6bc2dbeac" "Loop_with_defs_cex2_def";;
Hashtbl.add pfghfknname "604c7a9ddc69ab30c7a270d93252bf0a28677a3c64eebd21010fa447cb8add57" "combinator_def";;
Hashtbl.add pfghfknname "366c5817fcc8d04be3dca45a9e89b91d6aade49505bc119294c3de0c7d18e564" "combinator_equiv_def";;
Hashtbl.add pfghfknname "8d5eb1ebcd652bb09f43c4e1195948a20678aa89140a42013186ec6bc4e0e0cc" "equip_mod_def";;

(** Egal theory **)
let pfgegalprim : (string,int) Hashtbl.t = Hashtbl.create 100;;
let pfgegalknname : (string,string) Hashtbl.t = Hashtbl.create 100;;

Hashtbl.add pfgegalprim "174b78e53fc239e8c2aab4ab5a996a27e3e5741e88070dad186e05fb13f275e5" 0;;
Hashtbl.add pfgegalprim "73c9efe869770ab42f7cde0b33fe26bbc3e2bd157dad141c0c27d1e7348d60f5" 1;;
Hashtbl.add pfgegalprim "e2a83319facad3a3d8ff453f4ef821d9da495e56a623695546bb7d7ac333f3fe" 2;;
Hashtbl.add pfgegalprim "844774016d959cff921a3292054b30b52f175032308aa11e418cb73f5fef3d54" 3;;
Hashtbl.add pfgegalprim "2a38dbb37506341b157c11dddf8eb7d8404ce97eb50d5e940b23d5094ae39d70" 4;;
Hashtbl.add pfgegalprim "b1b8f6f9d4d6136be8375ed2faddb54df84cdb3018ec6bd2ac07b2c25d3d8af8" 5;;
Hashtbl.add pfgegalprim "5a50bfe3a33a99c34615616f54f10cc2df28717bcf140147a4c61b78529a8e94" 6;;

(** Mizar theory **)
let pfgmizprim : (string,int) Hashtbl.t = Hashtbl.create 100;;
let pfgmizknname : (string,string) Hashtbl.t = Hashtbl.create 100;;

Hashtbl.add pfgmizprim "174b78e53fc239e8c2aab4ab5a996a27e3e5741e88070dad186e05fb13f275e5" 0;;
Hashtbl.add pfgmizprim "73c9efe869770ab42f7cde0b33fe26bbc3e2bd157dad141c0c27d1e7348d60f5" 1;;
Hashtbl.add pfgmizprim "f55f90f052decfc17a366f12be0ad237becf63db26be5d163bf4594af99f943a" 2;;
Hashtbl.add pfgmizprim "844774016d959cff921a3292054b30b52f175032308aa11e418cb73f5fef3d54" 3;;

(** HOAS theory **)
let pfghoasprim : (string,int) Hashtbl.t = Hashtbl.create 100;;
let pfghoasknname : (string,string) Hashtbl.t = Hashtbl.create 100;;

Hashtbl.add pfghoasprim "d58762d200971dcc7f1850726d9f2328403127deeba124fc3ba2d2d9f7c3cb8c" 0;;
Hashtbl.add pfghoasprim "73c9efe869770ab42f7cde0b33fe26bbc3e2bd157dad141c0c27d1e7348d60f5" 1;;

Hashtbl.add pfghoasknname "d4decebfc69ca1960129ec4e292e1ccb592c50bca5d450a12c0bba887817b174" "pair_inj";;
Hashtbl.add pfghoasknname "76b2a66bedf76e57ff081dcbd56ad689d603f4eff70621cd55343f7c04d909fe" "bind_inj";;
Hashtbl.add pfghoasknname "315a2984b1ac53cb8ff29dfca7ce2575250602b580ff9a68928b107ee1db6d02" "pair_not_bind";;
Hashtbl.add pfghoasknname "539481cbfe76d6724bab04370be9feb170330706d71fd7faed0680556c1bd902" "prop_ext";;
            
let currtmid : string ref = ref ""
let thmcount : int ref = ref 0
let pflinestart : int ref = ref 0
let pfcharstart : int ref = ref 0
let pftext : Buffer.t = Buffer.create 10000

type tp = TpVar of int | Prop | Set | Ar of tp * tp

let rec notpvarsp a =
  match a with
  | TpVar _ -> false
  | Ar(a1,a2) -> notpvarsp a1 && notpvarsp a2
  | _ -> true

(*** assume number of type variables is between 0 and 3 ***)
type ptp = int * tp

let primname x =
  match x with
(*  | "Eps" -> (0,(1,Ar(Ar(TpVar 0,Prop),TpVar 0))) *)
  | "In" -> if !pfgtheory = HOAS then raise Not_found else (1,(0,Ar(Set,Ar(Set,Prop))))
  | "Empty" -> if !pfgtheory = HF || !pfgtheory = Egal then (2,(0,Set)) else raise Not_found
  | "Union" -> if !pfgtheory = HOAS then raise Not_found else (3,(0,Ar(Set,Set)))
  | "Power" -> if !pfgtheory = HF || !pfgtheory = Egal then (4,(0,Ar(Set,Set))) else raise Not_found
  | "Repl" -> if !pfgtheory = HF || !pfgtheory = Egal then (5,(0,Ar(Set,Ar(Ar(Set,Set),Set)))) else raise Not_found
  | "UnivOf" -> if !pfgtheory = Egal then (6,(0,Ar(Set,Set))) else raise Not_found
  | _ -> raise Not_found

type tm =
  | DB of int
  | TmH of string
  | Prim of int
  | TpAp of tm * tp
  | Ap of tm * tm
  | Lam of tp * tm
  | Imp of tm * tm
  | All of tp * tm

type ptm = int * tm

type pf =
  | Hyp of int
  | Known of string
  | PTpAp of pf * tp
  | PTmAp of pf * tm
  | PPfAp of pf * pf
  | PLam of tm * pf
  | TLam of tp * pf

type ppf = int * pf

type setinfixop = InfMem | InfSubq

type infixop =
  | InfSet of setinfixop
  | InfNam of string

type asckind = AscTp | AscSet | AscSubeq

type atree =
  | Byte of int
  | String of string
  | QString of string
  | Na of string
  | Nu of bool * string * string option * string option
  | Le of string * (asckind * atree) option * atree * atree
  | LeM of string * string list * atree * atree
  | Bi of string * (string list * (asckind * atree) option) list * atree
  | Preo of string * atree
  | Posto of string * atree
  | Info of infixop * atree * atree
  | Implop of atree * atree
  | Sep of string * setinfixop * atree * atree
  | Rep of string * setinfixop * atree * atree
  | SepRep of string * setinfixop * atree * atree * atree
  | SetEnum of atree list
  | MTuple of atree * atree list
  | Tuple of atree * atree * atree list
  | IfThenElse of atree * atree * atree

type ltree =
  | ByteL of int
  | StringL of string
  | QStringL of string
  | NaL of string
  | NuL of bool * string * string option * string option
  | LeL of string * (asckind * ltree) option * ltree * ltree
  | LeML of string * string list * ltree * ltree
  | BiL of string * string * (string list * (asckind * ltree) option) list * ltree
  | PreoL of string * ltree
  | PostoL of string * ltree
  | InfoL of infixop * ltree * ltree
  | ImplopL of ltree * ltree
  | SepL of string * setinfixop * ltree * ltree
  | RepL of string * setinfixop * ltree * ltree
  | SepRepL of string * setinfixop * ltree * ltree * ltree
  | SetEnumL of ltree list
  | MTupleL of ltree * ltree list
  | ParenL of ltree * ltree list
  | IfThenElseL of ltree * ltree * ltree

let rec binderishp (a:ltree) : bool =
  match a with
  | BiL(_) -> true
  | LeL(_) -> true
  | LeML(_) -> true
  | IfThenElseL(_) -> true
  | PreoL(x,a) -> binderishp a
  | InfoL(i,a,b) -> binderishp b
  | _ -> false

let setinfixop_string i =
  match i with
  | InfMem -> ":e"
  | InfSubq -> "c="

let asckind_string i =
  match i with
  | AscTp -> ":"
  | AscSet -> ":e"
  | AscSubeq -> "c="

let rec output_ltree ch a =
  match a with
  | ByteL(x) -> Printf.fprintf ch "\\x%02x" x
  | StringL(x) -> output_char ch '"'; output_string ch x; output_char ch '"'
  | QStringL(x) -> output_char ch '?'; output_string ch x; output_char ch '?'
  | NaL(x) -> output_string ch x
  | NuL(b,x,None,None) ->
      begin
	if b then output_char ch '-';
	output_string ch x;
      end
  | NuL(b,x,Some y,None) ->
      begin
	if b then output_char ch '-';
	output_string ch x;
	output_char ch '.';
	output_string ch y;
      end
  | NuL(b,x,None,Some z) ->
      begin
	if b then output_char ch '-';
	output_string ch x;
	output_char ch 'E';
	output_string ch z;
      end
  | NuL(b,x,Some y,Some z) ->
      begin
	if b then output_char ch '-';
	output_string ch x;
	output_char ch '.';
	output_string ch y;
	output_char ch 'E';
	output_string ch z;
      end
  | LeL(x,None,a,c) ->
      output_string ch "let ";
      output_string ch x;
      output_string ch " := ";
      output_ltree ch a;
      output_string ch " in ";
      output_ltree ch c
  | LeL(x,Some (i,b),a,c) ->
      output_string ch "let ";
      output_string ch x;
      output_char ch ' ';
      output_string ch (asckind_string i);
      output_char ch ' ';
      output_ltree ch b;
      output_string ch " := ";
      output_ltree ch a;
      output_string ch " in ";
      output_ltree ch c
  | LeML(x,xl,a,c) ->
      output_string ch "let [";
      output_string ch x;
      List.iter (fun y -> output_char ch ','; output_string ch y) xl;
      output_string ch "] := ";
      output_ltree ch a;
      output_string ch " in ";
      output_ltree ch c
  | BiL(x,m,[(xl,None)],c) ->
      output_string ch x;
      List.iter (fun y -> output_char ch ' '; output_string ch y) xl;
      output_char ch ' ';
      output_string ch m;
      output_char ch ' ';
      output_ltree ch c
  | BiL(x,m,[(xl,Some(i,b))],c) ->
      output_string ch x;
      List.iter (fun y -> output_char ch ' '; output_string ch y) xl;
      output_char ch ' ';
      output_string ch (asckind_string i);
      output_char ch ' ';
      output_ltree ch b;
      output_char ch ' ';
      output_string ch m;
      output_char ch ' ';
      output_ltree ch c
  | BiL(x,m,vll,c) ->
      output_string ch x;
      List.iter
	(fun vl ->
	  output_string ch " (";
	  let nfst = ref false in
	  begin
	    match vl with
	    | (xl,None) ->
		List.iter (fun y -> if !nfst then output_char ch ' '; nfst := true; output_string ch y) xl;
	    | (xl,Some(AscTp,b)) ->
		List.iter (fun y -> if !nfst then output_char ch ' '; nfst := true; output_string ch y) xl;
		output_string ch " : ";
		output_ltree ch b
	    | (xl,Some(AscSet,b)) ->
		List.iter (fun y -> if !nfst then output_char ch ' '; nfst := true; output_string ch y) xl;
		output_string ch " :e ";
		output_ltree ch b
	    | (xl,Some(AscSubeq,b)) ->
		List.iter (fun y -> if !nfst then output_char ch ' '; nfst := true; output_string ch y) xl;
		output_string ch " c= ";
		output_ltree ch b
	  end;
	  output_char ch ')';
	  )
	vll;
      output_char ch ' ';
      output_string ch m;
      output_char ch ' ';
      output_ltree ch c
  | PreoL(x,a) ->
      output_string ch x;
      output_char ch ' ';
      output_ltree ch a
  | PostoL(x,a) ->
      output_ltree ch a;
      output_char ch ' ';
      output_string ch x
  | InfoL(InfSet i,a,b) ->
      output_ltree ch a;
      output_char ch ' ';
      output_string ch (setinfixop_string i);
      output_char ch ' ';
      output_ltree ch b
  | InfoL(InfNam x,a,b) ->
      output_ltree ch a;
      output_char ch ' ';
      output_string ch x;
      output_char ch ' ';
      output_ltree ch b
  | ImplopL(a,b) ->
      output_ltree ch a;
      output_char ch ' ';
      output_ltree ch b
  | SepL(x,i,a,b) ->
      output_char ch '{';
      output_string ch x;
      output_char ch ' ';
      output_string ch (setinfixop_string i);
      output_char ch ' ';
      output_ltree ch a;
      output_char ch '|';
      output_ltree ch b;
      output_char ch '}';
  | RepL(x,i,a,b) ->
      output_char ch '{';
      output_ltree ch a;
      output_char ch '|';
      output_string ch x;
      output_char ch ' ';
      output_string ch (setinfixop_string i);
      output_char ch ' ';
      output_ltree ch b;
      output_char ch '}';
  | SepRepL(x,i,a,b,c) ->
      output_char ch '{';
      output_ltree ch a;
      output_char ch '|';
      output_string ch x;
      output_char ch ' ';
      output_string ch (setinfixop_string i);
      output_char ch ' ';
      output_ltree ch b;
      output_char ch ',';
      output_ltree ch c;
      output_char ch '}';
  | SetEnumL(al) ->
      begin
	output_char ch '{';
	match al with
	| [] -> output_char ch '}';
	| (a::bl) ->
	    output_ltree ch a;
	    List.iter (fun b -> output_char ch ','; output_ltree ch b) bl;
	    output_char ch '}';
      end
  | MTupleL(a,bl) ->
      output_char ch '[';
      output_ltree ch a;
      List.iter (fun b -> output_char ch ','; output_ltree ch b) bl;
      output_char ch ']';
  | ParenL(a,bl) ->
      output_char ch '(';
      output_ltree ch a;
      List.iter (fun b -> output_char ch ','; output_ltree ch b) bl;
      output_char ch ')';
  | IfThenElseL(a,b,c) ->
      output_string ch "if ";
      output_ltree ch a;
      output_string ch " then ";
      output_ltree ch b;
      output_string ch " else ";
      output_ltree ch c

let rec ltree_to_atree a =
  match a with
  | ByteL(x) -> Byte(x)
  | StringL(x) -> String(x)
  | QStringL(x) -> QString(x)
  | NaL(x) -> Na(x)
  | NuL(b,x,y,z) -> Nu(b,x,y,z)
  | LeL(x,None,a,c) -> Le(x,None,ltree_to_atree a,ltree_to_atree c)
  | LeL(x,Some(i,b),a,c) -> Le(x,Some(i,ltree_to_atree b),ltree_to_atree a,ltree_to_atree c)
  | LeML(x,xl,a,c) -> LeM(x,xl,ltree_to_atree a,ltree_to_atree c)
  | BiL(x,m,vll,c) ->
      let vlla = List.map
	  (fun (xl,o) ->
	    match o with
	    | None -> (xl,None)
	    | Some(i,b) -> (xl,Some(i,ltree_to_atree b)))
	  vll
      in
      Bi(x,vlla,ltree_to_atree c)
  | PreoL(x,a) -> Preo(x,ltree_to_atree a)
  | PostoL(x,a) -> Posto(x,ltree_to_atree a)
  | InfoL(x,a,b) -> Info(x,ltree_to_atree a,ltree_to_atree b)
  | ImplopL(a,b) -> Implop(ltree_to_atree a,ltree_to_atree b)
  | SepL(x,i,a,b) -> Sep(x,i,ltree_to_atree a,ltree_to_atree b)
  | RepL(x,i,a,b) -> Rep(x,i,ltree_to_atree a,ltree_to_atree b)
  | SepRepL(x,i,a,b,c) -> SepRep(x,i,ltree_to_atree a,ltree_to_atree b,ltree_to_atree c)
  | SetEnumL(al) -> SetEnum(List.map ltree_to_atree al)
  | MTupleL(a,bl) -> MTuple(ltree_to_atree a,List.map ltree_to_atree bl)
  | ParenL(a,[]) -> ltree_to_atree a
  | ParenL(a,b::cl) -> Tuple(ltree_to_atree a,ltree_to_atree b,List.map ltree_to_atree cl)
  | IfThenElseL(a,b,c) -> IfThenElse(ltree_to_atree a,ltree_to_atree b,ltree_to_atree c)

type picase = Postfix | InfixNone | InfixLeft | InfixRight

type docitem =
  | Author of string * string list
  | Title of string
  | Salt of string
  | Treasure of string
  | ShowProofTerms of bool
  | Section of string
  | End of string
  | VarDecl of string list * asckind * ltree
  | LetDecl of string * (asckind * ltree) option * ltree
  | HypDecl of string * ltree
  | PostInfixDecl of string * ltree * int * picase
  | PrefixDecl of string * ltree * int
  | BinderDecl of bool * bool * string * ltree * ltree option
  | NotationDecl of string * string list
  | UnicodeDecl of string * string list
  | SubscriptDecl of string
  | SuperscriptDecl of string
  | ParamDecl of string * ltree
  | DefDecl of string * ltree option * ltree
  | ParamHash of string * string * string option
  | AxDecl of string * ltree
  | ThmDecl of string * string * ltree

type pftacitem =
  | PfStruct of int
  | Exact of ltree
  | LetTac of string list * ltree option
  | AssumeTac of string list * ltree option
  | SetTac of string * ltree option * ltree
  | ApplyTac of ltree
  | ClaimTac of string * ltree
  | ProveTac of ltree * ltree list
  | CasesTac of ltree * (string * ltree) list list
  | WitnessTac of ltree
  | RewriteTac of bool * ltree * int list
  | SpecialTac of string * ltree list
  | Qed
  | Admitted
  | Admit

type docorpftacitem =
  | DocItem : docitem -> docorpftacitem
  | PfTacItem : pftacitem -> docorpftacitem

type doc = (string * string) list * docorpftacitem list

(*** DocPromise(hashofdocyettobepublished,[...listofhashesofpropositionsprovenindocyettobepublished...]) ***)
type formalmetablockitem =
  | Doc of doc
  | DocPromise of string * string list

type formalmetablock = formalmetablockitem list

let rec tp_to_str m =
  match m with
  | TpVar(i) -> "?" ^ string_of_int i
  | Prop -> "prop"
  | Set -> "set"
  | Ar(m1,m2) -> "(" ^ tp_to_str m1 ^ " -> " ^ tp_to_str m2 ^ ")"

let rec tm_to_str m =
  match m with
  | DB(i) -> "_" ^ string_of_int i
  | TmH(h) ->
     begin
       try
         Hashtbl.find tmh_legend h
       with Not_found -> "#" ^ h
     end
  | Prim(i) ->
     begin
       try
         Hashtbl.find prim_legend i
       with Not_found -> "\"" ^ string_of_int i ^ "\""
     end
  | TpAp(m1,m2) -> "(" ^ tm_to_str m1 ^ " " ^ tp_to_str m2 ^ ")"
  | Ap(m1,m2) -> "(" ^ tm_to_str m1 ^ " " ^ tm_to_str m2 ^ ")"
  | Lam(m1,m2) -> "(fun _:" ^ tp_to_str m1 ^ " => " ^ tm_to_str m2 ^ ")"
  | Imp(m1,m2) -> "(" ^ tm_to_str m1 ^ " -> " ^ tm_to_str m2 ^ ")"
  | All(m1,m2) -> "(forall _:" ^ tp_to_str m1 ^ ", " ^ tm_to_str m2 ^ ")"

let rec pf_to_str m =
  match m with
  | Hyp(i) -> "__" ^ string_of_int i
  | Known(h) ->
     begin
       try
         Hashtbl.find knownh_legend h
       with Not_found -> "##" ^ h
     end
  | PTpAp(m1,m2) -> "(" ^ pf_to_str m1 ^ " " ^ tp_to_str m2 ^ ")"
  | PTmAp(m1,m2) -> "(" ^ pf_to_str m1 ^ " " ^ tm_to_str m2 ^ ")"
  | PPfAp(m1,m2) -> "(" ^ pf_to_str m1 ^ " " ^ pf_to_str m2 ^ ")"
  | PLam(m1,m2) -> "(fun _:" ^ tm_to_str m1 ^ " => " ^ pf_to_str m2 ^ ")"
  | TLam(m1,m2) -> "(fun _:" ^ tp_to_str m1 ^ " => " ^ pf_to_str m2 ^ ")"

let rec tp_to_sexpr m =
  match m with
  | TpVar(i) -> "(TPVAR " ^ string_of_int i ^ ")"
  | Prop -> "(PROP)"
  | Set -> "(SET)"
  | Ar(m1,m2) -> "(AR " ^ tp_to_sexpr m1 ^ " " ^ tp_to_sexpr m2 ^ ")"

let rec tm_to_sexpr m =
  match m with
  | DB(i) -> "(DB " ^ string_of_int i ^ ")"
  | TmH(h) -> "(TMH \"" ^ h ^ "\")"
  | Prim(i) -> Printf.sprintf "(PRIM %d)" i
  | TpAp(m1,m2) -> "(TPAP " ^ tm_to_sexpr m1 ^ " " ^ tp_to_sexpr m2 ^ ")"
  | Ap(m1,m2) -> "(AP " ^ tm_to_sexpr m1 ^ " " ^ tm_to_sexpr m2 ^ ")"
  | Lam(m1,m2) -> "(LAM " ^ tp_to_sexpr m1 ^ " " ^ tm_to_sexpr m2 ^ ")"
  | Imp(m1,m2) -> "(IMP " ^ tm_to_sexpr m1 ^ " " ^ tm_to_sexpr m2 ^ ")"
  | All(m1,m2) -> "(ALL " ^ tp_to_sexpr m1 ^ " " ^ tm_to_sexpr m2 ^ ")"

let rec pf_to_sexpr m =
  match m with
  | Hyp(i) -> "(HYP " ^ string_of_int i ^ ")"
  | Known(h) -> "(KNOWN \"" ^ h ^ "\")"
  | PTpAp(m1,m2) -> "(PTPAP " ^ pf_to_sexpr m1 ^ " " ^ tp_to_sexpr m2 ^ ")"
  | PTmAp(m1,m2) -> "(PTMAP " ^ pf_to_sexpr m1 ^ " " ^ tm_to_sexpr m2 ^ ")"
  | PPfAp(m1,m2) -> "(PPFAP " ^ pf_to_sexpr m1 ^ " " ^ pf_to_sexpr m2 ^ ")"
  | PLam(m1,m2) -> "(PLAM " ^ tm_to_sexpr m1 ^ " " ^ pf_to_sexpr m2 ^ ")"
  | TLam(m1,m2) -> "(TLAM " ^ tp_to_sexpr m1 ^ " " ^ pf_to_sexpr m2 ^ ")"

(*** serialization code ***)
let hex_char h =
  List.nth ['0';'1';'2';'3';'4';'5';'6';'7';'8';'9';'A';'B';'C';'D';'E';'F'] h

(*** position function ***)
let rec position_rec l x i =
match l with
| (y::r) when x = y -> i
| (y::r) -> position_rec r x (i+1)
| [] -> raise Not_found

let position l x = position_rec l x 0

let tplookup ctxtp x =
  TpVar (position ctxtp x)

exception NegDB

let rec tmshift i j m =
  match m with
  | DB(k) when k < i -> DB(k)
  | DB(k) ->
      let l = k + j in
      if l >= i then DB(l) else raise NegDB
  | TpAp(m1,a) -> TpAp(tmshift i j m1,a)
  | Ap(m1,m2) -> Ap(tmshift i j m1,tmshift i j m2)
  | Lam(a1,m1) -> Lam(a1,tmshift (i+1) j m1)
  | Imp(m1,m2) -> Imp(tmshift i j m1,tmshift i j m2)
  | All(a1,m1) -> All(a1,tmshift (i+1) j m1)
  | _ -> m

let rec tmtplookup_rec ctxtm x i =
  match ctxtm with
  | ((y,(a,None))::_) when y = x -> (DB i,a)
  | ((y,(a,Some(m)))::_) when y = x && i = 0 -> (m,a)
  | ((y,(a,Some(m)))::_) when y = x -> (tmshift 0 i m,a)
  | ((_,(_,None))::r) -> tmtplookup_rec r x (i+1) (*** Shift for variables ***)
  | ((_,(_,Some(_)))::r) -> tmtplookup_rec r x i (*** Do not shift for lets ***)
  | [] -> raise Not_found

let tmtplookup ctxtm x =
  tmtplookup_rec ctxtm x 0

let tmlookup ctxtm x =
  let (n,_) = tmtplookup_rec ctxtm x 0 in n

let rec pfshift i j d =
  match d with
  | Hyp(k) when k < i -> Hyp(k)
  | Hyp(k) -> let l = k+j in if l >= i then Hyp(k+j) else raise NegDB
  | PTpAp(d1,a) -> PTpAp(pfshift i j d1,a)
  | PTmAp(d1,m2) -> PTmAp(pfshift i j d1,m2)
  | PPfAp(d1,d2) -> PPfAp(pfshift i j d1,pfshift i j d2)
  | PLam(m1,d1) -> PLam(m1,pfshift (i+1) j d1)
  | TLam(a1,d1) -> TLam(a1,pfshift i j d1)
  | _ -> d

let rec pftmshift i j d =
  match d with
  | Hyp(k) -> Hyp(k)
  | PTpAp(d1,a) -> PTpAp(pftmshift i j d1,a)
  | PTmAp(d1,m2) -> PTmAp(pftmshift i j d1,tmshift i j m2)
  | PPfAp(d1,d2) -> PPfAp(pftmshift i j d1,pftmshift i j d2)
  | PLam(m1,d1) -> PLam(tmshift i j m1,pftmshift i j d1)
  | TLam(a1,d1) -> TLam(a1,pftmshift (i+1) j d1)
  | _ -> d

let rec pflookup_rec ctxpf x i =
  match ctxpf with
  | ((y,m)::_) when y = x -> Hyp i
  | (_::r) -> pflookup_rec r x (i+1)
  | [] -> raise Not_found

let pflookup ctxpf x = pflookup_rec ctxpf x 0

let rec pfproplookup_rec ctxpf x i =
  match ctxpf with
  | ((y,m)::_) when y = x -> (Hyp i,m)
  | (_::r) -> pfproplookup_rec r x (i+1)
  | [] -> raise Not_found

let pfproplookup ctxpf x = pfproplookup_rec ctxpf x 0

let rec tp_closed_p a =
  match a with
  | Ar(a1,a2) -> tp_closed_p a1 && tp_closed_p a2
  | TpVar _ -> false
  | _ -> true

let rec tpsubst a cl =
  match a with
  | TpVar i -> List.nth cl i
  | Set -> Set
  | Prop -> Prop
  | Ar(a,b) -> Ar(tpsubst a cl,tpsubst b cl)

let rec tmtpsubst m cl =
  match m with
  | TpAp(m1,a1) -> TpAp(tmtpsubst m1 cl,tpsubst a1 cl)
  | Ap(m1,m2) -> Ap(tmtpsubst m1 cl,tmtpsubst m2 cl)
  | Lam(a1,m1) -> Lam(tpsubst a1 cl,tmtpsubst m1 cl)
  | Imp(m1,m2) -> Imp(tmtpsubst m1 cl,tmtpsubst m2 cl)
  | All(a1,m1) -> All(tpsubst a1 cl,tmtpsubst m1 cl)
  | _ -> m

let rec pftpsubst d cl =
  match d with
  | PTpAp(d1,a1) -> PTpAp(pftpsubst d1 cl,tpsubst a1 cl)
  | PTmAp(d1,m1) -> PTmAp(pftpsubst d1 cl,tmtpsubst m1 cl)
  | PPfAp(d1,d2) -> PPfAp(pftpsubst d1 cl,pftpsubst d2 cl)
  | PLam(m1,d1) -> PLam(tmtpsubst m1 cl,pftpsubst d1 cl)
  | TLam(a1,d1) -> TLam(tpsubst a1 cl,pftpsubst d1 cl)
  | _ -> d

let rec tmsubst m j n =
  match m with
  | DB(i) when i = j && j = 0 -> n
  | DB(i) when i = j -> tmshift 0 j n
  | DB(i) when i > j -> DB(i-1)
  | TpAp(m1,a) -> TpAp(tmsubst m1 j n,a) (*** This could be omitted since it should always be TmH applied to <= 3 type variables, and so will contain no de Bruijns. ***)
  | Ap(m1,m2) -> Ap(tmsubst m1 j n,tmsubst m2 j n)
  | Lam(a,m1) -> Lam(a,tmsubst m1 (j+1) n)
  | Imp(m1,m2) -> Imp(tmsubst m1 j n,tmsubst m2 j n)
  | All(a,m1) -> All(a,tmsubst m1 (j+1) n)
  | _ -> m

let rec free_in_tm_p m j =
  match m with
  | DB(i) when i = j -> true
  | Ap(m1,m2) -> free_in_tm_p m1 j || free_in_tm_p m2 j
  | Lam(a,m1) -> free_in_tm_p m1 (j+1)
  | Imp(m1,m2) -> free_in_tm_p m1 j || free_in_tm_p m2 j
  | All(a,m1) -> free_in_tm_p m1 (j+1)
  | TpAp(m1,a) -> false (*** invariant: m1 is closed ***)
  | _ -> false

let rec free_in_pf_p d j =
  match d with
  | PTpAp(d1,_) -> free_in_pf_p d1 j
  | PTmAp(d1,m2) -> free_in_pf_p d1 j || free_in_tm_p m2 j
  | PPfAp(d1,d2) -> free_in_pf_p d1 j || free_in_pf_p d2 j
  | PLam(m1,d2) -> free_in_tm_p m1 j || free_in_pf_p d2 j
  | TLam(a1,d2) -> free_in_pf_p d2 (j+1)
  | _ -> false

let rec hyp_in_pf_p d j =
  match d with
  | Hyp(i) -> i = j
  | PTpAp(d1,_) -> hyp_in_pf_p d1 j
  | PTmAp(d1,m2) -> hyp_in_pf_p d1 j
  | PPfAp(d1,d2) -> hyp_in_pf_p d1 j || hyp_in_pf_p d2 j
  | PLam(m1,d2) -> hyp_in_pf_p d2 (j+1)
  | TLam(a1,d2) -> hyp_in_pf_p d2 j
  | _ -> false

let beta_count = ref None

let beta_count_check () =
  match !beta_count with
  | None -> ()
  | Some b when b > 0 ->
      beta_count := Some (b-1)
  | _ ->
     raise (Failure("Resource Bound Reached -- Too many beta reductions"))

let beta_report () =
  match !beta_count with
  | Some(b) ->
     Printf.printf "beta_count remaining: %d\n" b;
     Printf.printf "betas used: %d\n" (150000000 - b)
  | None -> ()

let rec tm_beta_eta_norm_1 m =
  match m with
  | Ap(m1,m2) ->
      let (m1r,m1b) = tm_beta_eta_norm_1 m1 in
      let (m2r,m2b) = tm_beta_eta_norm_1 m2 in
      begin
	match m1r with
	| Lam(a,m) ->
	    beta_count_check ();
	    (tmsubst m 0 m2r,false) (*** beta ***)
	| _ -> (Ap(m1r,m2r),m1b && m2b)
      end
  | Lam(a,m1) ->
      let (m1r,m1b) = tm_beta_eta_norm_1 m1 in
      begin
	match m1r with
	| Ap(m1f,DB(0)) when not (free_in_tm_p m1f 0) -> (tmshift 0 (-1) m1f,false) (*** eta ***)
	| _ -> (Lam(a,m1r),m1b)
      end
  | Imp(m1,m2) ->
      let (m1r,m1b) = tm_beta_eta_norm_1 m1 in
      let (m2r,m2b) = tm_beta_eta_norm_1 m2 in
      (Imp(m1r,m2r),m1b && m2b)
  | All(a,m1) ->
      let (m1r,m1b) = tm_beta_eta_norm_1 m1 in
      (All(a,m1r),m1b)
  | TpAp(m1,a1) -> (m,true) (*** invariant: polydefs are gone, so m1 is either Prim(0) or TmH(h) where h is the id of Prim(0). No reduction here. ***)
  | _ -> (m,true)

let rec tm_beta_eta_norm m =
  let (mr,mb) = tm_beta_eta_norm_1 m in
  if mb then
    mr
  else
    tm_beta_eta_norm mr

let rec tm_beta_eta_exeq_norm_1 m =
  match m with
  | Ap(m1,m2) ->
      let (m1r,m1b) = tm_beta_eta_exeq_norm_1 m1 in
      let (m2r,m2b) = tm_beta_eta_exeq_norm_1 m2 in
      begin
	match m1r with
	| Lam(a,m) ->
	    beta_count_check ();
	    (tmsubst m 0 m2r,false) (*** beta ***)
	| _ -> (Ap(m1r,m2r),m1b && m2b)
      end
  | Lam(a,m1) ->
      let (m1r,m1b) = tm_beta_eta_exeq_norm_1 m1 in
      begin
	match m1r with
	| Ap(m1f,DB(0)) when not (free_in_tm_p m1f 0) -> (tmshift 0 (-1) m1f,false) (*** eta ***)
	| _ -> (Lam(a,m1r),m1b)
      end
  | Imp(m1,m2) ->
      let (m1r,m1b) = tm_beta_eta_exeq_norm_1 m1 in
      let (m2r,m2b) = tm_beta_eta_exeq_norm_1 m2 in
      (Imp(m1r,m2r),m1b && m2b)
  | All(a,m1) ->
      let (m1r,m1b) = tm_beta_eta_exeq_norm_1 m1 in
      (All(a,m1r),m1b)
  | TpAp(TmH(h),a) when h = "912ad2cdc2d23bb8aa0a5070945f2a90976a948b0e8308917244591f3747f099" -> (** ex **)
     (Lam(Ar(a,Prop),All(Prop,Imp(All(a,Imp(Ap(DB(2),DB(0)),DB(1))),DB(0)))),false)
  | TpAp(TmH(h),a) when h = "5a6af35fb6d6bea477dd0f822b8e01ca0d57cc50dfd41744307bc94597fdaa4a" -> (** eq **)
     (Lam(a,Lam(a,All(Ar(a,Ar(a,Prop)),Imp(Ap(Ap(DB(0),DB(2)),DB(1)),Ap(Ap(DB(0),DB(1)),DB(2)))))),false)
  | TpAp(TmH(h),a) when h = "7966a66a9bb198103c2a540ccd5ebebdff33c10843cc10eebfc98715e142989c" -> (** neq **)
     if !pfgtheory = HF then
       (Lam(a,Lam(a,Ap(TmH("058f630dd89cad5a22daa56e097e3bdf85ce16ebd3dbf7994e404e2a98800f7f"),All(Ar(a,Ar(a,Prop)),Imp(Ap(Ap(DB(0),DB(2)),DB(1)),Ap(Ap(DB(0),DB(1)),DB(2))))))),false)
     else
       (Lam(a,Lam(a,Imp(All(Ar(a,Ar(a,Prop)),Imp(Ap(Ap(DB(0),DB(2)),DB(1)),Ap(Ap(DB(0),DB(1)),DB(2)))),All(Prop,DB(0))))),false)
  | TpAp(m1,a1) -> (m,true) (*** invariant: polydefs are gone, so m1 is either Prim(0) or TmH(h) where h is the id of Prim(0). No reduction here. ***)
  | _ -> (m,true)

let rec tm_beta_eta_exeq_norm m =
  let (mr,mb) = tm_beta_eta_exeq_norm_1 m in
  if mb then
    mr
  else
    tm_beta_eta_exeq_norm mr

let tpofprim i =
  match i with
  | 0 -> Ar(Ar(TpVar 0,Prop),TpVar 0)
  | 1 -> Ar(Set,Ar(Set,Prop))
  | 2 -> Set
  | 3 -> Ar(Set,Set)
  | 4 -> Ar(Set,Set)
  | 5 -> Ar(Set,Ar(Ar(Set,Set),Set))
  | 6 -> Ar(Set,Set)
  | _ -> raise Not_found

let rec extr_tpoftm sgtmof cxtm m =
  match m with
  | DB i -> List.nth cxtm i
  | TpAp(Prim 0,a) -> Ar(Ar(a,Prop),a)
  | TpAp(TpAp(TpAp(TpAp(TpAp(TpAp(TmH h,a1),a2),a3),a4),a5),a6) ->
      begin
	match Hashtbl.find sgtmof h with
	| (6,d) -> tpsubst d [a1;a2;a3;a4;a5;a6]
	| (i,_) -> raise (Failure(h ^ " applied to 6 types, but expected to be applied to " ^ (string_of_int i)))
      end
  | TpAp(TpAp(TpAp(TpAp(TpAp(TmH h,a1),a2),a3),a4),a5) ->
      begin
	match Hashtbl.find sgtmof h with
	| (5,d) -> tpsubst d [a1;a2;a3;a4;a5]
	| (i,_) -> raise (Failure(h ^ " applied to 5 types, but expected to be applied to " ^ (string_of_int i)))
      end
  | TpAp(TpAp(TpAp(TpAp(TmH h,a1),a2),a3),a4) ->
      begin
	match Hashtbl.find sgtmof h with
	| (4,d) -> tpsubst d [a1;a2;a3;a4]
	| (i,_) -> raise (Failure(h ^ " applied to 4 types, but expected to be applied to " ^ (string_of_int i)))
      end
  | TpAp(TpAp(TpAp(TmH h,a),b),c) ->
      begin
	match Hashtbl.find sgtmof h with
	| (3,d) -> tpsubst d [a;b;c]
	| (i,_) -> raise (Failure(h ^ " applied to 3 types, but expected to be applied to " ^ (string_of_int i)))
      end
  | TpAp(TpAp(TmH h,a),b) ->
      begin
	match Hashtbl.find sgtmof h with
	| (2,d) -> tpsubst d [a;b]
	| (i,_) -> raise (Failure(h ^ " applied to 2 types, but expected to be applied to " ^ (string_of_int i)))
      end
  | TpAp(TmH h,a) ->
      begin
	match Hashtbl.find sgtmof h with
	| (1,d) -> tpsubst d [a]
	| (i,_) -> raise (Failure(h ^ " applied to 1 type, but expected to be applied to " ^ (string_of_int i)))
      end
  | TmH h ->
      begin
	match Hashtbl.find sgtmof h with
	| (0,d) -> d
	| (i,_) -> raise (Failure(h ^ " applied to no types, but expected to be applied to " ^ (string_of_int i)))
      end
  | Prim 0 -> raise (Failure("The polymorphic primitive Eps applied to no types, but expected to be applied to 1"))
  | Prim i -> tpofprim i
  | TpAp(_,_) -> raise (Failure("Nonprefix polymorphism in term"))
  | Ap(m1,m2) ->
      begin
	match extr_tpoftm sgtmof cxtm m1 with
	| Ar(a,b) -> (check_tpoftm sgtmof cxtm m2 a; b)
	| _ -> raise (Failure("Type Error: Nonfunction applied to an argument."))
      end
  | Lam(a,m) -> Ar(a,extr_tpoftm sgtmof (a::cxtm) m)
  | Imp(m1,m2) -> (check_tpoftm sgtmof cxtm m1 Prop; check_tpoftm sgtmof cxtm m2 Prop; Prop)
  | All(a,m) -> (check_tpoftm sgtmof (a::cxtm) m Prop; Prop)
and check_tpoftm sgtmof cxtm m a =
  let b = extr_tpoftm sgtmof cxtm m in
  if a = b then
    ()
  else
    raise (Failure("Type Error: Found " ^ tp_to_str b ^ "\nbut expected " ^ tp_to_str a))

let rec tm_head_args_r m args =
  match m with
  | Ap(m1,m2) -> tm_head_args_r m1 (m2::args)
  | _ -> (m,args)

let tm_head_args m =
  tm_head_args_r m []

(*** assume m is beta eta normal and not a Lam, and args are all beta eta normal ***)
let rec tm_app_beta_eta_norm2 m args =
  match args with
  | (n::argr) -> tm_app_beta_eta_norm2 (Ap(m,n)) argr
  | _ -> m

(*** assume m is beta eta normal already and args are all beta eta normal ***)
let rec tm_app_beta_eta_norm m args =
  match (m,args) with
  | (Lam(_,m1),n::argr) ->
      tm_app_beta_eta_norm (tm_beta_eta_norm (tmsubst m1 0 n)) argr
  | _ ->
      tm_app_beta_eta_norm2 m args

let defp sdel h =
  match h with
  | TmH(c) -> Hashtbl.mem sdel c
  | TpAp(TmH(c),_) -> Hashtbl.mem sdel c
  | TpAp(TpAp(TmH(c),_),_) -> Hashtbl.mem sdel c
  | TpAp(TpAp(TpAp(TmH(c),_),_),_) -> Hashtbl.mem sdel c
  | TpAp(TpAp(TpAp(TpAp(TmH(c),_),_),_),_) -> Hashtbl.mem sdel c
  | TpAp(TpAp(TpAp(TpAp(TpAp(TmH(c),_),_),_),_),_) -> Hashtbl.mem sdel c
  | TpAp(TpAp(TpAp(TpAp(TpAp(TpAp(TmH(c),_),_),_),_),_),_) -> Hashtbl.mem sdel c
  | _ -> false

let deltap dl h =
  match h with
  | TmH(c) -> List.mem c dl
  | TpAp(TmH(c),_) -> true
  | TpAp(TpAp(TmH(c),_),_) -> true
  | TpAp(TpAp(TpAp(TmH(c),_),_),_) -> true
  | TpAp(TpAp(TpAp(TpAp(TmH(c),_),_),_),_) -> true
  | TpAp(TpAp(TpAp(TpAp(TpAp(TmH(c),_),_),_),_),_) -> true
  | TpAp(TpAp(TpAp(TpAp(TpAp(TpAp(TmH(c),_),_),_),_),_),_) -> true
  | _ -> false

(*** assume all defs are beta eta normal ***)
let delta_exp sdel h args =
  try
    match h with
    | TmH(c) ->
	begin
	  let (i,m) = Hashtbl.find sdel c in
	  if i = 0 then
	    tm_app_beta_eta_norm m args
	  else if i = 1 then
	    raise (Failure(c ^ " should be applied to 1 type, but is applied to none."))
	  else
	    raise (Failure(c ^ " should be applied to " ^ (string_of_int i) ^ " types, but is applied to none."))
	end
    | TpAp(TmH(c),a1) ->
	begin
	  let (i,m) = Hashtbl.find sdel c in
	  if i = 1 then
	    tm_app_beta_eta_norm (tmtpsubst m [a1]) args
	  else
	    raise (Failure(c ^ " should be applied to " ^ (string_of_int i) ^ " types, but is applied to 1."))
	end
    | TpAp(TpAp(TmH(c),a1),a2) ->
	begin
	  let (i,m) = Hashtbl.find sdel c in
	  if i = 2 then
	    tm_app_beta_eta_norm (tmtpsubst m [a1;a2]) args
	  else if i = 1 then
	    raise (Failure(c ^ " should be applied to 1 type, but is applied to 2."))
	  else
	    raise (Failure(c ^ " should be applied to " ^ (string_of_int i) ^ " types, but is applied to 2."))
	end
    | TpAp(TpAp(TpAp(TmH(c),a1),a2),a3) ->
	begin
	  let (i,m) = Hashtbl.find sdel c in
	  if i = 3 then
	    tm_app_beta_eta_norm (tmtpsubst m [a1;a2;a3]) args
	  else if i = 1 then
	    raise (Failure(c ^ " should be applied to 1 type, but is applied to 3."))
	  else
	    raise (Failure(c ^ " should be applied to " ^ (string_of_int i) ^ " types, but is applied to 3."))
	end
    | TpAp(TpAp(TpAp(TpAp(TmH(c),a1),a2),a3),a4) ->
	begin
	  let (i,m) = Hashtbl.find sdel c in
	  if i = 4 then
	    tm_app_beta_eta_norm (tmtpsubst m [a1;a2;a3;a4]) args
	  else if i = 1 then
	    raise (Failure(c ^ " should be applied to 1 type, but is applied to 4."))
	  else
	    raise (Failure(c ^ " should be applied to " ^ (string_of_int i) ^ " types, but is applied to 4."))
	end
    | TpAp(TpAp(TpAp(TpAp(TpAp(TmH(c),a1),a2),a3),a4),a5) ->
	begin
	  let (i,m) = Hashtbl.find sdel c in
	  if i = 5 then
	    tm_app_beta_eta_norm (tmtpsubst m [a1;a2;a3;a4;a5]) args
	  else if i = 1 then
	    raise (Failure(c ^ " should be applied to 1 type, but is applied to 5."))
	  else
	    raise (Failure(c ^ " should be applied to " ^ (string_of_int i) ^ " types, but is applied to 5."))
	end
    | TpAp(TpAp(TpAp(TpAp(TpAp(TpAp(TmH(c),a1),a2),a3),a4),a5),a6) ->
	begin
	  let (i,m) = Hashtbl.find sdel c in
	  if i = 5 then
	    tm_app_beta_eta_norm (tmtpsubst m [a1;a2;a3;a4;a5;a6]) args
	  else if i = 1 then
	    raise (Failure(c ^ " should be applied to 1 type, but is applied to 6."))
	  else
	    raise (Failure(c ^ " should be applied to " ^ (string_of_int i) ^ " types, but is applied to 6."))
	end
    | _ -> raise Not_found
  with Not_found ->
    (*** By checking with defp above before delta_exp is called, I should know that this doesn't happen. **)
    raise (Failure("delta_exp called with an inappropriate head. Bug"))

let delta_cons h dl =
  match h with
  | TmH(c) -> (c::dl)
  | _ -> dl

let rec headnorm1 m sdel dl =
  match m with
  | Lam(_,_) -> (m,dl)
  | Imp(_,_) -> (m,dl)
  | All(_,_) -> (m,dl)
  | _ ->
      let (mh,margs) = tm_head_args m in
      if defp sdel mh then
	headnorm1 (delta_exp sdel mh margs) sdel (delta_cons mh dl)
      else
	(m,dl)

let headnorm m sdel dl = headnorm1 (tm_beta_eta_norm m) sdel dl

let gen_lam_body m =
  match m with
  | Lam(_,mb) -> mb
  | _ -> Ap(tmshift 0 1 m,DB(0))

(*** conv2 assumes m and n are beta-eta normal ***)
let rec conv2 m n sdel dl =
  match (m,n) with
  | (Lam(a1,m1),Lam(b1,n1)) ->
      if a1 = b1 then
	conv2 m1 n1 sdel dl
      else
	None
  | (All(a1,m1),All(b1,n1)) ->
      if a1 = b1 then
	conv2 m1 n1 sdel dl
      else
	None
  | (Imp(m1,m2),Imp(n1,n2)) ->
      convl [m1;m2] [n1;n2] sdel dl
  | (Lam(_,_),All(_,_)) -> None
  | (Lam(_,_),Imp(_,_)) -> None
  | (All(_,_),Lam(_,_)) -> None
  | (All(_,_),Imp(_,_)) -> None
  | (Imp(_,_),All(_,_)) -> None
  | (Imp(_,_),Lam(_,_)) -> None
  | (_,Lam(_,n1)) -> conv2 (gen_lam_body m) n1 sdel dl
  | (Lam(_,m1),_) -> conv2 m1 (gen_lam_body n) sdel dl
  | (_,All(_,_)) ->
      let (mh,margs) = tm_head_args m in
      if defp sdel mh then
	conv2 (delta_exp sdel mh margs) n sdel (delta_cons mh dl)
      else
	None
  | (_,Imp(_,_)) ->
      let (mh,margs) = tm_head_args m in
      if defp sdel mh then
	conv2 (delta_exp sdel mh margs) n sdel (delta_cons mh dl)
      else
	None
  | (All(_,_),_) ->
      let (nh,nargs) = tm_head_args n in
      if defp sdel nh then
	conv2 m (delta_exp sdel nh nargs) sdel (delta_cons nh dl)
      else
	None
  | (Imp(_,_),_) ->
      let (nh,nargs) = tm_head_args n in
      if defp sdel nh then
	conv2 m (delta_exp sdel nh nargs) sdel (delta_cons nh dl)
      else
	None
  | _ ->
      let (mh,margs) = tm_head_args m in
      if defp sdel mh then
        if deltap dl mh then
	  conv2 (delta_exp sdel mh margs) n sdel dl
	else if !eagerdeltas then
          conv2 (delta_exp sdel mh margs) n sdel (delta_cons mh dl)
        else
	  begin
	    match convrigid1 mh margs n sdel dl with
	    | Some(dl) -> Some(dl)
	    | None -> (*** try delta expanding mh ***)
		conv2 (delta_exp sdel mh margs) n sdel (delta_cons mh dl)
	  end
      else
	convrigid1 mh margs n sdel dl
and convrigid1 mh margs n sdel dl =
  let (nh,nargs) = tm_head_args n in
  if defp sdel nh then
    if deltap dl nh then
      convrigid1 mh margs (delta_exp sdel nh nargs) sdel dl
    else if !eagerdeltas then
      convrigid1 mh margs (delta_exp sdel nh nargs) sdel (delta_cons nh dl)
    else
      begin
	match convrigid2 mh margs nh nargs sdel dl with
	| Some(dl) -> Some(dl)
	| None -> (*** try delta expanding nh ***)
	    convrigid1 mh margs (delta_exp sdel nh nargs) sdel (delta_cons nh dl)
      end
  else
    convrigid2 mh margs nh nargs sdel dl
and convrigid2 mh margs nh nargs sdel dl =
  if mh = nh then
    convl margs nargs sdel dl
  else
    None
and convl ml nl sdel dl =
  match (ml,nl) with
  | ([],[]) -> Some(dl)
  | (m::mr,n::nr) ->
      begin
	match conv2 m n sdel dl with
	| Some(dl) -> convl mr nr sdel dl
	| None -> None
      end
  | _ -> None

let conv m n sdel dl =
  conv2 (tm_beta_eta_norm m) (tm_beta_eta_norm n) sdel dl

let rec extr_propofpf sgdelta sgtmof cxtm cxpf d dl =
  match d with
  | Hyp j ->
     begin
       match !reportbushydeps with
       | Some(ch) -> Printf.fprintf ch "H %d\n" (List.length cxpf - j)
       | None -> ()
     end;
     (List.nth cxpf j,dl)
  | PTpAp(PTpAp(PTpAp(PTpAp(PTpAp(PTpAp(Known(h),a1),a2),a3),a4),a5),a6) ->
      begin
	try
	  match Hashtbl.find sgdelta h with
	  | (i,p) ->
	      if i = 6 then
		(tmtpsubst p [a1;a2;a3;a4;a5;a6],dl)
	      else if i = 1 then
		raise (Failure(h ^ " requires 1 type but 6 were given"))
	      else
		raise (Failure(h ^ " requires " ^ (string_of_int i) ^ " types but was given 6"))
	with Not_found -> raise (Failure(h ^ " should be known, but is not known")) 
      end
  | PTpAp(PTpAp(PTpAp(PTpAp(PTpAp(Known(h),a1),a2),a3),a4),a5) ->
      begin
	try
	  match Hashtbl.find sgdelta h with
	  | (i,p) ->
	      if i = 5 then
		(tmtpsubst p [a1;a2;a3;a4;a5],dl)
	      else if i = 1 then
		raise (Failure(h ^ " requires 1 type but 5 were given"))
	      else
		raise (Failure(h ^ " requires " ^ (string_of_int i) ^ " types but was given 5"))
	with Not_found -> raise (Failure(h ^ " should be known, but is not known")) 
      end
  | PTpAp(PTpAp(PTpAp(PTpAp(Known(h),a1),a2),a3),a4) ->
      begin
	try
	  match Hashtbl.find sgdelta h with
	  | (i,p) ->
	      if i = 4 then
		(tmtpsubst p [a1;a2;a3;a4],dl)
	      else if i = 1 then
		raise (Failure(h ^ " requires 1 type but 4 were given"))
	      else
		raise (Failure(h ^ " requires " ^ (string_of_int i) ^ " types but was given 4"))
	with Not_found -> raise (Failure(h ^ " should be known, but is not known")) 
      end
  | PTpAp(PTpAp(PTpAp(Known(h),a1),a2),a3) ->
      begin
	try
	  match Hashtbl.find sgdelta h with
	  | (i,p) ->
	      if i = 3 then
		(tmtpsubst p [a1;a2;a3],dl)
	      else if i = 1 then
		raise (Failure(h ^ " requires 1 type but 3 were given"))
	      else
		raise (Failure(h ^ " requires " ^ (string_of_int i) ^ " types but was given 3"))
	with Not_found -> raise (Failure(h ^ " should be known, but is not known")) 
      end
  | PTpAp(PTpAp(Known(h),a1),a2) ->
      begin
	try
	  match Hashtbl.find sgdelta h with
	  | (i,p) ->
	      if i = 2 then
		(tmtpsubst p [a1;a2],dl)
	      else if i = 1 then
		raise (Failure(h ^ " requires 1 type but 2 were given"))
	      else
		raise (Failure(h ^ " requires " ^ (string_of_int i) ^ " types but was given 2"))
	with Not_found -> raise (Failure(h ^ " should be known, but is not known")) 
      end
  | PTpAp(Known(h),a1) ->
      begin
	try
	  match Hashtbl.find sgdelta h with
	  | (i,p) ->
	      if i = 1 then
		(tmtpsubst p [a1],dl)
	      else
		raise (Failure(h ^ " requires " ^ (string_of_int i) ^ " types but was given 1"))
	with Not_found -> raise (Failure(h ^ " should be known, but is not known")) 
      end
  | Known(h) ->
      begin
        begin
          match !reportbushydeps with
          | Some(ch) -> Printf.fprintf ch "K %s\n" h
          | None -> ()
        end;
	try
	  match Hashtbl.find sgdelta h with
	  | (i,p) ->
	      if i = 0 then
		(p,dl)
	      else if i = 1 then
		raise (Failure(h ^ " requires 1 type but was given none"))
	      else
		raise (Failure(h ^ " requires " ^ (string_of_int i) ^ " types but was given none"))
	with Not_found -> (TmH(h),dl) (* raise (Failure(h ^ " should be known, but is not known"))  *)
      end
  | PTmAp(d1,m) ->
      begin
	let (q,dl) = extr_propofpf sgdelta sgtmof cxtm cxpf d1 dl in
	match headnorm q sgdelta dl with
	| (All(a,p),dl) ->
            let b = extr_tpoftm sgtmof cxtm m in
	    if b = a then
	      (tmsubst p 0 m,dl)
	    else
              raise (Failure(Printf.sprintf "Proof term for a universally quantified proposition applied to a term of the wrong type\npf %s\nof %s\napplied to %s\nof type %s\n" (pf_to_str d1) (tm_to_str (All(a,p))) (tm_to_str m) (tp_to_str b)))
	| (p,_) ->
	    raise (Failure("Proof term does not prove a universally quantified proposition but is applied to a term"))
      end
  | PPfAp(d1,d2) ->
      begin
	let (q,dl) = extr_propofpf sgdelta sgtmof cxtm cxpf d1 dl in
	match headnorm q sgdelta dl with
	| (Imp(p1,p2),dl) ->
	    begin
	      match check_propofpf sgdelta sgtmof cxtm cxpf d2 p1 dl with
	      | Some(dl) -> (p2,dl)
	      | None ->
		  raise (Failure("Proof term for an implication applied to a proof term for the wrong proposition"))
	    end
	| (p,_) ->
	    raise (Failure("Proof term does not prove an implication but is applied to a proof term"))
      end
  | TLam(a,d1) ->
      let (q,dl) = extr_propofpf sgdelta sgtmof (a::cxtm) (List.map (fun q -> tmshift 0 1 q) cxpf) d1 dl in
      (All(a,q),dl)
  | PLam(p,d1) ->
      let (q,dl) = extr_propofpf sgdelta sgtmof cxtm (p::cxpf) d1 dl in
      (Imp(p,q),dl)
  | _ -> raise (Failure("Ill-formed Proof Term"))
and check_propofpf sgdelta sgtmof cxtm cxpf d p dl =
  let (q,dl) = extr_propofpf sgdelta sgtmof cxtm cxpf d dl in
  conv q p sgdelta dl

exception MatchFail

type mtm =
  | MVar of int * mtm list
  | MDB of int
  | MTmH of string
  | MPrim of int
  | MTpAp of mtm * tp
  | MAp of mtm * mtm
  | MLam of tp * mtm
  | MImp of mtm * mtm
  | MAll of tp * mtm

let rec mtm_to_str m =
  match m with
  | MVar(x,[]) -> "?" ^ string_of_int x
  | MVar(x,(n::sigma)) -> "?" ^ string_of_int x ^ "[" ^ (mtm_to_str n) ^ (List.fold_right (fun n r -> "," ^ (mtm_to_str n) ^ r) sigma "]")
  | MDB(i) -> "_" ^ string_of_int i
  | MTmH(h) -> "#" ^ h
  | MPrim(i) -> "\"" ^ string_of_int i ^ "\""
  | MTpAp(m1,m2) -> "(" ^ mtm_to_str m1 ^ " " ^ tp_to_str m2 ^ ")"
  | MAp(m1,m2) -> "(" ^ mtm_to_str m1 ^ " " ^ mtm_to_str m2 ^ ")"
  | MLam(m1,m2) -> "(fun _:" ^ tp_to_str m1 ^ " => " ^ mtm_to_str m2 ^ ")"
  | MImp(m1,m2) -> "(" ^ mtm_to_str m1 ^ " -> " ^ mtm_to_str m2 ^ ")"
  | MAll(m1,m2) -> "(forall _:" ^ tp_to_str m1 ^ ", " ^ mtm_to_str m2 ^ ")"

let rec tm_to_mtm q =
  match q with
  | DB i -> MDB i
  | TmH h -> MTmH h
  | Prim i -> MPrim i
  | TpAp(q1,a) -> MTpAp(tm_to_mtm q1,a)
  | Ap(q1,q2) -> MAp(tm_to_mtm q1,tm_to_mtm q2)
  | Imp(q1,q2) -> MImp(tm_to_mtm q1,tm_to_mtm q2)
  | Lam(a,q1) -> MLam(a,tm_to_mtm q1)
  | All(a,q1) -> MAll(a,tm_to_mtm q1)

let rec mtm_to_tm q =
  match q with
  | MVar(_,_) -> raise Not_found
  | MDB i -> DB i
  | MTmH h -> TmH h
  | MPrim i -> Prim i
  | MTpAp(q1,a) -> TpAp(mtm_to_tm q1,a)
  | MAp(q1,q2) -> Ap(mtm_to_tm q1,mtm_to_tm q2)
  | MImp(q1,q2) -> Imp(mtm_to_tm q1,mtm_to_tm q2)
  | MLam(a,q1) -> Lam(a,mtm_to_tm q1)
  | MAll(a,q1) -> All(a,mtm_to_tm q1)

let rec mtm_shift i j m =
  match m with
  | MVar(x,sigma) -> MVar(x,List.map (mtm_shift i j) sigma)
  | MDB(k) when k < i -> MDB(k)
  | MDB(k) ->
      let l = k + j in
      if l >= i then MDB(l) else raise NegDB
  | MTpAp(m1,a) -> MTpAp(mtm_shift i j m1,a)
  | MAp(m1,m2) -> MAp(mtm_shift i j m1,mtm_shift i j m2)
  | MLam(a1,m1) -> MLam(a1,mtm_shift (i+1) j m1)
  | MImp(m1,m2) -> MImp(mtm_shift i j m1,mtm_shift i j m2)
  | MAll(a1,m1) -> MAll(a1,mtm_shift (i+1) j m1)
  | _ -> m

let rec mtm_subst m j n =
  match m with
  | MVar(x,sigma) -> MVar(x,List.map (fun m -> mtm_subst m j n) sigma)
  | MDB(i) when i = j && j = 0 -> n
  | MDB(i) when i = j -> mtm_shift 0 j n
  | MDB(i) when i > j -> MDB(i-1)
  | MTpAp(m1,a) -> MTpAp(mtm_subst m1 j n,a) (*** This could be omitted since it should always be TmH applied to <= 3 type variables, and so will contain no de Bruijns. ***)
  | MAp(m1,m2) -> MAp(mtm_subst m1 j n,mtm_subst m2 j n)
  | MLam(a1,m1) -> MLam(a1,mtm_subst m1 (j+1) n)
  | MImp(m1,m2) -> MImp(mtm_subst m1 j n,mtm_subst m2 j n)
  | MAll(a1,m1) -> MAll(a1,mtm_subst m1 (j+1) n)
  | _ -> m

let rec mtm_ssub tau q =
  match q with
  | MVar(x,sigma) -> MVar(x,List.map (mtm_ssub tau) sigma)
  | MDB i -> List.nth tau i
  | MTmH h -> MTmH h
  | MPrim i -> MPrim i
  | MTpAp(q1,a) -> MTpAp(mtm_ssub tau q1,a)
  | MAp(q1,q2) -> MAp(mtm_ssub tau q1,mtm_ssub tau q2)
  | MImp(q1,q2) -> MImp(mtm_ssub tau q1,mtm_ssub tau q2)
  | MLam(a,q1) -> MLam(a,mtm_ssub (MDB 0::List.map (mtm_shift 0 1) tau) q1)
  | MAll(a,q1) -> MAll(a,mtm_ssub (MDB 0::List.map (mtm_shift 0 1) tau) q1)

let rec mtm_msub theta q =
  match q with
  | MVar(x,sigma) ->
      begin
	let thetasigma = List.map (mtm_msub theta) sigma in
	try
	  let m = theta x in
	  mtm_ssub thetasigma m
	with Not_found -> MVar(x,thetasigma)
      end
  | MTpAp(q1,a) -> MTpAp(mtm_msub theta q1,a)
  | MAp(q1,q2) -> MAp(mtm_msub theta q1,mtm_msub theta q2)
  | MImp(q1,q2) -> MImp(mtm_msub theta q1,mtm_msub theta q2)
  | MLam(a,q1) -> MLam(a,mtm_msub theta q1)
  | MAll(a,q1) -> MAll(a,mtm_msub theta q1)
  | _ -> q

let op_min r z =
  match r with
  | Some(y) -> min y z
  | None -> z

let rec mtm_minap_db_r q j z r =
  match q with
  | MVar(x,sigma) ->
      mtms_minap_db_r sigma j r
  | MDB i when i = j -> Some(op_min r z)
  | MTpAp(q1,a) -> r (*** assume no DBs in q1 ***)
  | MAp(q1,q2) -> mtm_minap_db_r q1 j (z+1) (mtm_minap_db_r q2 j 0 r)
  | MImp(q1,q2) -> mtm_minap_db_r q1 j 0 (mtm_minap_db_r q2 j 0 r)
  | MLam(a,q1) -> mtm_minap_db_r q1 (j+1) 0 r
  | MAll(a,q1) -> mtm_minap_db_r q1 (j+1) 0 r
  | _ -> r
and mtms_minap_db_r sigma j r =
  match sigma with
  | [] -> r
  | (q::sigmar) -> mtms_minap_db_r sigmar j (mtm_minap_db_r q j 0 r)

let mtm_minap_db q j = mtm_minap_db_r q j 0 None

let rec mtm_lammvar_p q =
  match q with
  | MVar(_,_) -> true
  | MLam(_,q1) -> mtm_lammvar_p q1
  | _ -> false

let rec mtm_betared_if_1 q p =
  match q with
  | MVar(x,sigma) ->
      let (sigmar,sigmab) = mtms_betared_if_1 sigma p in
      (MVar(x,sigmar),sigmab)
  | MAp(q1,q2) ->
      let (q1r,q1b) = mtm_betared_if_1 q1 p in
      let (q2r,q2b) = mtm_betared_if_1 q2 p in
      begin
	match q1r with
	| MLam(a,qb) ->
	    if p qb q2r then
	      begin
		beta_count_check ();
		(mtm_subst qb 0 q2r,false) (*** beta, satisfying p ***)
	      end
	    else
	      (MAp(q1r,q2r),q1b && q2b)
	| _ -> (MAp(q1r,q2r),q1b && q2b)
      end
  | MLam(a,q1) ->
      let (q1r,q1b) = mtm_betared_if_1 q1 p in
      (MLam(a,q1r),q1b)
  | MImp(q1,q2) ->
      let (q1r,q1b) = mtm_betared_if_1 q1 p in
      let (q2r,q2b) = mtm_betared_if_1 q2 p in
      (MImp(q1r,q2r),q1b && q2b)
  | MAll(a,q1) ->
      let (q1r,q1b) = mtm_betared_if_1 q1 p in
      (MAll(a,q1r),q1b)
  | MTpAp(_,_) -> (q,true) (*** invariant should imply no betas are in here ***)
  | _ -> (q,true)
and mtms_betared_if_1 sigma p =
  match sigma with
  | [] -> ([],true)
  | (q::sigmar) ->
      let (qr,qb) = mtm_betared_if_1 q p in
      let (sigmarr,sigmarb) = mtms_betared_if_1 sigmar p in
      (qr::sigmarr,qb && sigmarb)

let rec mtm_betared_if q p =
  let (qr,qb) = mtm_betared_if_1 q p in
  if qb then
    qr
  else
    mtm_betared_if qr p

let rec pattern_invert k sigma q =
  match q with
  | DB i when i < k -> MDB i
  | DB i ->
      let j = position sigma (MDB (i-k)) in
      MDB (j+k)
  | TmH h -> MTmH h
  | Prim i -> MPrim i
  | TpAp(q1,a) -> MTpAp(pattern_invert k sigma q1,a)
  | Ap(q1,q2) -> MAp(pattern_invert k sigma q1,pattern_invert k sigma q2)
  | Imp(q1,q2) -> MImp(pattern_invert k sigma q1,pattern_invert k sigma q2)
  | Lam(a,q1) -> MLam(a,pattern_invert (k+1) sigma q1)
  | All(a,q1) -> MAll(a,pattern_invert (k+1) sigma q1)

let rec pattern_match sdel p q theta =
  match (p,q) with
  | (MVar(x,sigma),_) ->
      begin
	try
	  let m = mtm_ssub sigma (theta x) in
	  pattern_match sdel m q theta
	with Not_found ->
	  try
	    let m = pattern_invert 0 sigma q in
	    (fun y -> if x = y then m else theta y)
	  with Not_found -> raise MatchFail
      end
  | (MDB i,DB j) when i = j -> theta
  | (MPrim i,Prim j) when i = j -> theta
  | (MTmH h,TmH k) when h = k -> theta
  | (MTpAp(MTmH h,a1),TpAp(TmH k,b1)) when h = k && a1 = b1 -> theta
  | (MTpAp(MTpAp(MTmH h,a1),a2),TpAp(TpAp(TmH k,b1),b2)) when h = k && a1 = b1 && a2 = b2 -> theta
  | (MTpAp(MTpAp(MTpAp(MTmH h,a1),a2),a3),TpAp(TpAp(TpAp(TmH k,b1),b2),b3)) when h = k && a1 = b1 && a2 = b2 && a3 = b3 -> theta
  | (MAp(p1,p2),Ap(q1,q2)) ->
      let theta = pattern_match sdel p1 q1 theta in
      pattern_match sdel p2 q2 theta
  | (MImp(p1,p2),Imp(q1,q2)) ->
      let theta = pattern_match sdel p1 q1 theta in
      pattern_match sdel p2 q2 theta
  | (MLam(a1,p1),Lam(b1,q1)) when a1 = b1 ->
      pattern_match sdel p1 q1 theta
  | (MAll(a1,p1),All(b1,q1)) when a1 = b1 ->
      pattern_match sdel p1 q1 theta
  | (_,_) ->
      begin
	try
	  let p1 = mtm_to_tm p in
	  match conv p1 q sdel [] with
	  | Some(_) -> theta
	  | None -> raise MatchFail
	with Not_found -> raise MatchFail
      end

let rec mtm_app_red2 m args =
  match args with
  | (n::argr) -> mtm_app_red2 (MAp(m,n)) argr
  | _ -> m

let rec mtm_app_red m args =
  match (m,args) with
  | (MLam(_,m1),n::argr) ->
      mtm_app_red (mtm_subst m1 0 n) argr
  | _ ->
      mtm_app_red2 m args

let mdefp sdel h =
  match h with
  | MTmH(c) -> Hashtbl.mem sdel c
  | MTpAp(MTmH(c),_) -> Hashtbl.mem sdel c
  | MTpAp(MTpAp(MTmH(c),_),_) -> Hashtbl.mem sdel c
  | MTpAp(MTpAp(MTpAp(MTmH(c),_),_),_) -> Hashtbl.mem sdel c
  | _ -> false

(*** assume all defs are beta eta normal ***)
let mdelta_exp sdel h args =
  try
    match h with
    | MTmH(c) ->
	begin
	  let (i,m) = Hashtbl.find sdel c in
	  if i = 0 then
	    mtm_app_red (tm_to_mtm m) args
	  else if i = 1 then
	    raise (Failure(c ^ " should be applied to 1 type, but is applied to none."))
	  else
	    raise (Failure(c ^ " should be applied to " ^ (string_of_int i) ^ " types, but is applied to none."))
	end
    | MTpAp(MTmH(c),a1) ->
	begin
	  let (i,m) = Hashtbl.find sdel c in
	  if i = 1 then
	    mtm_app_red (tm_to_mtm (tmtpsubst m [a1])) args
	  else
	    raise (Failure(c ^ " should be applied to " ^ (string_of_int i) ^ " types, but is applied to 1."))
	end
    | MTpAp(MTpAp(MTmH(c),a1),a2) ->
	begin
	  let (i,m) = Hashtbl.find sdel c in
	  if i = 2 then
	    mtm_app_red (tm_to_mtm (tmtpsubst m [a1;a2])) args
	  else if i = 1 then
	    raise (Failure(c ^ " should be applied to 1 type, but is applied to 2."))
	  else
	    raise (Failure(c ^ " should be applied to " ^ (string_of_int i) ^ " types, but is applied to 2."))
	end
    | MTpAp(MTpAp(MTpAp(MTmH(c),a1),a2),a3) ->
	begin
	  let (i,m) = Hashtbl.find sdel c in
	  if i = 3 then
	    mtm_app_red (tm_to_mtm (tmtpsubst m [a1;a2;a3])) args
	  else if i = 1 then
	    raise (Failure(c ^ " should be applied to 1 type, but is applied to 3."))
	  else
	    raise (Failure(c ^ " should be applied to " ^ (string_of_int i) ^ " types, but is applied to 3."))
	end
    | _ -> raise Not_found
  with Not_found ->
    raise (Failure("mdelta_exp called with an inappropriate head. Bug"))

let rec mtm_head_args_r m args =
  match m with
  | MAp(m1,m2) -> mtm_head_args_r m1 (m2::args)
  | _ -> (m,args)

let mtm_head_args m =
  mtm_head_args_r m []

let mdelta_cons h dl =
  match h with
  | MTmH(c) -> (c::dl)
  | _ -> dl

let rec mheadnorm1 m sdel dl =
  match m with
  | MLam(_,_) -> (m,dl)
  | MImp(_,_) -> (m,dl)
  | MAll(_,_) -> (m,dl)
  | _ ->
      let (mh,margs) = mtm_head_args m in
      if mdefp sdel mh then
	mheadnorm1 (mdelta_exp sdel mh margs) sdel (mdelta_cons mh dl)
      else
	(m,dl)

let mheadnorm m sdel dl = mheadnorm1 m sdel dl

let valid_id_p h = String.length h = 64

let rec to_mathdata_tp l a =
  match a with
  | TpVar(i) -> Mathdata.TpVar(l-i-1)
  | Prop -> Mathdata.Prop
  | Set -> Mathdata.Base(0)
  | Ar(a1,a2) -> Mathdata.Ar(to_mathdata_tp l a1,to_mathdata_tp l a2)

let rec to_mathdatapfghf_tp a =
  match a with
  | TpVar(i) -> raise (Failure "no poly in pfg")
  | Prop -> Mathdatapfg.Prop
  | Set -> Mathdatapfg.Base(0)
  | Ar(a1,a2) -> Mathdatapfg.TpArr(to_mathdatapfghf_tp a1,to_mathdatapfghf_tp a2)

let rec to_mathdatapfgegal_tp a =
  match a with
  | TpVar(i) -> raise (Failure "no poly in pfg")
  | Prop -> Mathdatapfg.Prop
  | Set -> Mathdatapfg.Base(0)
  | Ar(a1,a2) -> Mathdatapfg.TpArr(to_mathdatapfgegal_tp a1,to_mathdatapfgegal_tp a2)

let rec to_mathdatapfgmiz_tp a =
  match a with
  | TpVar(i) -> raise (Failure "no poly in pfg")
  | Prop -> Mathdatapfg.Prop
  | Set -> Mathdatapfg.Base(0)
  | Ar(a1,a2) -> Mathdatapfg.TpArr(to_mathdatapfgmiz_tp a1,to_mathdatapfgmiz_tp a2)

let rec to_mathdatapfghoas_tp a =
  match a with
  | TpVar(i) -> raise (Failure "no poly in pfg")
  | Prop -> Mathdatapfg.Prop
  | Set -> Mathdatapfg.Base(0)
  | Ar(a1,a2) -> Mathdatapfg.TpArr(to_mathdatapfghoas_tp a1,to_mathdatapfghoas_tp a2)

let to_mathdatapfg_tp a =
  match !pfgtheory with
  | HF -> to_mathdatapfghf_tp a
  | Egal -> to_mathdatapfgegal_tp a
  | Mizar -> to_mathdatapfgmiz_tp a
  | HOAS -> to_mathdatapfghoas_tp a

let rec to_mathdata_ptp i l a =
  if i > 0 then
     Mathdata.TpAll(to_mathdata_ptp (i-1) (l+1) a)
  else
     to_mathdata_tp l a

let rec to_mathdata_tm l m =
  match m with
  | DB(i) -> Mathdata.DB(i)
  | TmH(h) -> Mathdata.TmH(Hash.hexstring_hashval h)
  | Prim(i) -> Mathdata.Prim(i)
  | TpAp(m,a) -> Mathdata.TTpAp(to_mathdata_tm l m,to_mathdata_tp l a)
  | Ap(m,n) -> Mathdata.Ap(to_mathdata_tm l m,to_mathdata_tm l n)
  | Lam(a,m) -> Mathdata.Lam(to_mathdata_tp l a,to_mathdata_tm l m)
  | Imp(m,n) -> Mathdata.Imp(to_mathdata_tm l m,to_mathdata_tm l n)
  | All(a,m) -> Mathdata.All(to_mathdata_tp l a,to_mathdata_tm l m)

let rec to_mathdata_ptm_lam i l m =
  if i > 0 then
     Mathdata.TTpLam(to_mathdata_ptm_lam (i-1) (l+1) m)
  else
     to_mathdata_tm l m

let rec to_mathdata_ptm_all i l m =
  if i > 0 then
     Mathdata.TTpAll(to_mathdata_ptm_all (i-1) (l+1) m)
  else
     to_mathdata_tm l m

let rec to_mathdata_pf l d =
  match d with
  | Hyp(i) -> Mathdata.Hyp(i)
  | Known(h) -> Mathdata.Known(Hash.hexstring_hashval h)
  | PTpAp(d,a) -> Mathdata.PTpAp(to_mathdata_pf l d,to_mathdata_tp l a)
  | PTmAp(d,m) -> Mathdata.PTmAp(to_mathdata_pf l d,to_mathdata_tm l m)
  | PPfAp(d,e) -> Mathdata.PPfAp(to_mathdata_pf l d,to_mathdata_pf l e)
  | PLam(m,d) -> Mathdata.PLam(to_mathdata_tm l m,to_mathdata_pf l d)
  | TLam(a,d) -> Mathdata.TLam(to_mathdata_tp l a,to_mathdata_pf l d)

let rec to_mathdata_ppf i l d =
  if i > 0 then
     Mathdata.PTpLam(to_mathdata_ppf (i-1) (l+1) d)
  else
     to_mathdata_pf l d

let tp_id a = Hash.hashval_hexstring (Mathdata.hashtp (to_mathdata_tp 0 a))

let ptp_id (i,a) = Hash.hashval_hexstring (Mathdata.hashtp (to_mathdata_ptp i 0 a))

let tm_id m sof sdel = Hash.hashval_hexstring (Mathdata.tm_hashroot (to_mathdata_tm 0 (tm_beta_eta_exeq_norm m)))

let ptm_lam_id (i,m) sof sdel = Hash.hashval_hexstring (Mathdata.tm_hashroot (to_mathdata_ptm_lam i 0 (tm_beta_eta_exeq_norm m)))
let ptm_all_id (i,m) sof sdel = Hash.hashval_hexstring (Mathdata.tm_hashroot (to_mathdata_ptm_all i 0 (tm_beta_eta_exeq_norm m)))

let hfthyid = Hash.hexstring_hashval "6ffc9680fbe00a58d70cdeb319f11205ed998131ce51bb96f16c7904faf74a3d"
let egalthyid = Hash.hexstring_hashval "29c988c5e6c620410ef4e61bcfcbe4213c77013974af40759d8b732c07d61967"
let mizarthyid = Hash.hexstring_hashval "5ab3df7b0b4ef20889de0517a318df8746940971ad9b2021e54c820eb9e74dce"
let hoasthyid = Hash.hexstring_hashval "513140056e2032628f48d11e221efe29892e9a03a661d3b691793524a5176ede"

let pf_id d sof sdel = Hash.hashval_hexstring (Mathdata.pf_hashroot (to_mathdata_pf 0 d))

let ppf_id (i,d) sof sdel = "0000000000000000000000000000000000000000000000000000000000000000" (** This is fake, bviously. ppf_id isn't really needed anymore and is expensive to compute. **)

let rec tp_args_rtp a =
  match a with
  | Ar(a1,a2) ->
      let (argtpl,rtp) = tp_args_rtp a2 in
      (a1::argtpl,rtp)
  | _ -> ([],a)

let rec mk_forall_tm argtpl f m n =
  match argtpl with
  | (a::argtpr) ->
      let mb = gen_lam_body m in
      let nb = gen_lam_body n in
      All(a,mk_forall_tm argtpr f mb nb)
  | [] -> f m n

let rec mk_gen_ap m nl =
  match nl with
  | (n::nr) -> mk_gen_ap (Ap(m,n)) nr
  | [] -> m

let unicode : (string,string list) Hashtbl.t = Hashtbl.create 100;;
let subscript : (string,unit) Hashtbl.t = Hashtbl.create 100;;
let superscript : (string,unit) Hashtbl.t = Hashtbl.create 100;;

begin
  Hashtbl.add unicode "->" ["2192"];
  Hashtbl.add unicode "fun" ["3bb"];
  Hashtbl.add unicode "forall" ["2200"];
end

let authors : string list ref = ref []
let title : string option ref = ref None
let signature : string option ref = ref None
let showproofterms : bool ref = ref false
let salt : string option ref = ref None
let treasure : string option ref = ref None

(*** code for measuring complexity of tms and pfs -- not necessary ***)
let rec rem_dups_r ml rl =
  match ml with
  | [] -> rl
  | (m::mr) ->
      if List.mem m rl then
	rem_dups_r mr rl
      else
	rem_dups_r mr (m::rl)

let rem_dups ml = rem_dups_r ml []

let rec tm_info m =
  match m with
  | Lam(a,m) ->
      let (hs,ltps,atps,aps,imps) = tm_info m in
      (hs,a::ltps,atps,aps,imps)
  | All(a,m) -> 
      let (hs,ltps,atps,aps,imps) = tm_info m in
      (hs,ltps,a::atps,aps,imps)
  | Ap(m1,m2) ->
      let (hs1,ltps1,atps1,aps1,imps1) = tm_info m1 in
      let (hs2,ltps2,atps2,aps2,imps2) = tm_info m2 in
      (hs1 @ hs2,ltps1 @ ltps2,atps1 @ atps2,1+aps1+aps2,imps1+imps2)
  | Imp(m1,m2) ->
      let (hs1,ltps1,atps1,aps1,imps1) = tm_info m1 in
      let (hs2,ltps2,atps2,aps2,imps2) = tm_info m2 in
      (hs1 @ hs2,ltps1 @ ltps2,atps1 @ atps2,aps1+aps2,1+imps1+imps2)
  | TmH(h) -> ([h],[],[],0,0)
  | TpAp(TmH(h),_) -> ([h],[],[],0,0)
  | TpAp(TpAp(TmH(h),_),_) -> ([h],[],[],0,0)
  | TpAp(TpAp(TpAp(TmH(h),_),_),_) -> ([h],[],[],0,0)
  | TpAp(TpAp(TpAp(TpAp(TmH(h),_),_),_),_) -> ([h],[],[],0,0)
  | TpAp(TpAp(TpAp(TpAp(TpAp(TmH(h),_),_),_),_),_) -> ([h],[],[],0,0)
  | TpAp(TpAp(TpAp(TpAp(TpAp(TpAp(TmH(h),_),_),_),_),_),_) -> ([h],[],[],0,0)
  | _ -> ([],[],[],0,0)

let rec pf_info d =
  match d with
  | Known(h) -> ([h],[],[],0,[],[])
  | PTpAp(Known(h),_) -> ([h],[],[],0,[],[])
  | PTpAp(PTpAp(Known(h),_),_) -> ([h],[],[],0,[],[])
  | PTpAp(PTpAp(PTpAp(Known(h),_),_),_) -> ([h],[],[],0,[],[])
  | PTpAp(PTpAp(PTpAp(PTpAp(Known(h),_),_),_),_) -> ([h],[],[],0,[],[])
  | PTpAp(PTpAp(PTpAp(PTpAp(PTpAp(Known(h),_),_),_),_),_) -> ([h],[],[],0,[],[])
  | PTpAp(PTpAp(PTpAp(PTpAp(PTpAp(PTpAp(Known(h),_),_),_),_),_),_) -> ([h],[],[],0,[],[])
  | TLam(a,d) ->
      let (kl,tlams,insts,mps,plams,pbetas) = pf_info d in
      (kl,a::tlams,insts,mps,plams,pbetas)
  | PTmAp(d,m) ->
      let (kl,tlams,insts,mps,plams,pbetas) = pf_info d in
      (kl,tlams,m::insts,mps,plams,pbetas)
  | PPfAp(d1,d2) ->
      let (kl1,tlams1,insts1,mps1,plams1,pbetas1) = pf_info d1 in
      let (kl2,tlams2,insts2,mps2,plams2,pbetas2) = pf_info d2 in
      begin
	match d1 with
	| PLam(m,d) ->
	    (kl1 @ kl2,tlams1 @ tlams2,insts1 @ insts2,1+mps1+mps2,plams1 @ plams2,m::(pbetas1 @ pbetas2))
	| _ ->
	    (kl1 @ kl2,tlams1 @ tlams2,insts1 @ insts2,1+mps1+mps2,plams1 @ plams2,pbetas1 @ pbetas2)
      end
  | PLam(m,d) ->
      let (kl,tlams,insts,mps,plams,pbetas) = pf_info d in
      (kl,tlams,insts,mps,m::plams,pbetas)
  | _ -> ([],[],[],0,[],[])

let pf_complexity d =
  let (kl,tlams,insts,mps,plams,pbetas) = pf_info d in
  let kl2 = rem_dups kl in
  let tlams2 = rem_dups tlams in
  let insts2 = rem_dups insts in
  let plams2 = rem_dups plams in
  let pbetas2 = rem_dups pbetas in
  let complexity = ref (5 * mps) in
  complexity := !complexity + 10 * (List.length kl2) + List.length kl;
  complexity := !complexity + 10 * (List.length tlams2) + List.length tlams;
  List.iter
    (fun m ->
      let (hs,ltps,atps,aps,imps) = tm_info m in
      complexity := !complexity + List.length hs + List.length ltps + List.length atps + aps + imps
      )
    plams2;
  complexity := !complexity + List.length plams;
  List.iter
    (fun m ->
      let (hs,ltps,atps,aps,imps) = tm_info m in
      let hs2 = rem_dups hs in
      let ltps2 = rem_dups ltps in
      let atps2 = rem_dups atps in
      complexity := !complexity + 100 * (List.length ltps2); (** number of lambdas in the instantiations **)
      complexity := !complexity + 5 * (List.length hs2 + List.length atps2) + 10 * (List.length ltps) + List.length hs + List.length atps)
    insts2;
  complexity := !complexity + 10 * List.length insts;
  List.iter
    (fun m ->
      let (hs,ltps,atps,aps,imps) = tm_info m in
      let hs2 = rem_dups hs in
      let ltps2 = rem_dups ltps in
      let atps2 = rem_dups atps in
      complexity := !complexity + 70 * (List.length ltps2);
      complexity := !complexity + 3 * (List.length hs2 + List.length atps2) + 7 * (List.length ltps) + List.length hs + List.length atps)
    pbetas2;
  !complexity

let globalhrefs = ref false
let localhrefh : (string,unit) Hashtbl.t = Hashtbl.create 100

let output_unicode_html ch u =
  output_string ch "&#x";
  output_string ch u;
  output_char ch ';'

let output_name_html ch x =
  try
    let ul = Hashtbl.find unicode x in
    List.iter (fun u -> output_unicode_html ch u) ul
  with Not_found ->
    output_string ch x

let output_asckind_html ch k =
  match k with
  | AscTp -> output_string ch " : "
  | AscSet -> output_string ch " &#x2208; "
  | AscSubeq -> output_string ch " &#x2286; "

let output_setinfixop_html ch k =
  match k with
  | InfMem -> output_string ch " &#x2208; "
  | InfSubq -> output_string ch " &#x2286; "

let output_infixop_html ch i =
  match i with
  | InfNam(x) -> output_name_html ch x
  | InfSet(k) -> output_setinfixop_html ch k

let output_midtok_html ch m =
  if m = "," then
    output_string ch ", "
  else if m = "=>" then
    output_string ch " &#x21d2; "
  else
    output_string ch m

let output_names_html ch xl =
  match xl with
  | [] -> ()
  | (x::yl) ->
      output_name_html ch x;
      List.iter
	(fun y ->
	  output_char ch ' ';
	  output_string ch y;
	)
	yl

let rec output_comma_names_html ch xl =
  match xl with
  | [] -> ()
  | [x] ->
      output_name_html ch x;
  | [x;y] ->
      output_name_html ch x;
      output_string ch " and ";
      output_name_html ch y;
  | (x::yl) ->
      output_name_html ch x;
      output_string ch ", ";
      output_comma_names_html ch yl

let url_friendly_name x =
  let y = Buffer.create 100 in
  for i = 0 to (String.length x) - 1 do
    let c = x.[i] in
    let co = Char.code c in
    if (co >= 48 && co <= 57 || co >= 65 && co <= 90 || co >= 97 && co <= 122) then
      Buffer.add_char y c
    else
      begin
	Buffer.add_char y '_';
	Buffer.add_char y (hex_char ((co lsr 4) mod 16));
	Buffer.add_char y (hex_char (co mod 16));
      end
  done;
  Buffer.contents y

(*** <a> causes css problems in combination with <span> for some reason, so only call this if it's declaring the name (not inside an lterm).
    Eh, it also insists on screwing up the font. I've just changed all anchors to have the math friendly font. How annoying. ***)
let output_name_whrefa_html ch x stmh sknh =
  begin
    try
      if not !globalhrefs then raise Not_found;
      let hid = Hashtbl.find stmh x in
      output_string ch "<a classname='anamelink' href='term.php?h=";
      output_string ch hid;
      output_string ch "'>";
      output_name_html ch x;
      output_string ch "</a>";
    with Not_found ->
      try
        if not !globalhrefs then raise Not_found;
	let hid = Hashtbl.find sknh x in
	output_string ch "<a classname='anamelink' href='term.php?h="; 
	output_string ch hid;
	output_name_html ch x;
	output_string ch "</a>";
      with Not_found ->
            if Hashtbl.mem localhrefh x then
              begin
	        output_string ch "<a classname='anamelink' href='#"; 
	        output_string ch (url_friendly_name x);
	        output_string ch "'>";
	        output_name_html ch x;
	        output_string ch "</a>";
              end
            else
	      output_name_html ch x;
  end

(*** <a> causes css problems in combination with <span> for some reason, so I usually call this and use a span for links ***)
let output_name_whref_html ch x stmh sknh =
  begin
    try
      if not !globalhrefs then raise Not_found;
      let hid = Hashtbl.find stmh x in
      output_string ch "<span class='namelink' onclick=\"location.href='term.php?h="; 
      output_string ch hid;
      output_string ch "';\">";
      output_name_html ch x;
      output_string ch "</span>";
    with Not_found ->
      try
        if not !globalhrefs then raise Not_found;
	let hid = Hashtbl.find sknh x in
	output_string ch "<span class='namelink' onclick=\"location.href='term.php?h=";
        output_string ch hid;
	output_string ch "';\">";
	output_name_html ch x;
	output_string ch "</span>";
      with Not_found ->
        if Hashtbl.mem localhrefh x then
          begin
	    output_string ch "<span class='namelink' onclick=\"location.href='#";
	    output_string ch (url_friendly_name x);
	    output_string ch "'\">";
	    output_name_html ch x;
	    output_string ch "</span>";
          end
        else
	  output_name_html ch x;
  end

let rec output_ltree_html ch a stmh sknh =
  output_string ch "<span class='ltree'>";
  output_ltree_html_c ch a stmh sknh;
  output_string ch "</span>"
and output_ltree_html_c ch a stmh sknh =
  match a with
  | ByteL(x) -> Printf.fprintf ch "\\x%02x" x
  | StringL(x) -> output_char ch '"'; output_string ch x; output_char ch '"'
  | QStringL(x) -> output_char ch '?'; output_string ch x; output_char ch '?'
  | NaL(x) ->
      output_name_whrefa_html ch x stmh sknh
  | NuL(b,x,None,None) ->
      begin
	if b then output_char ch '-';
	output_string ch x;
      end
  | NuL(b,x,Some y,None) ->
      begin
	if b then output_char ch '-';
	output_string ch x;
	output_char ch '.';
	output_string ch y;
      end
  | NuL(b,x,None,Some z) ->
      begin
	if b then output_char ch '-';
	output_string ch x;
	output_char ch 'E';
	output_string ch z;
      end
  | NuL(b,x,Some y,Some z) ->
      begin
	if b then output_char ch '-';
	output_string ch x;
	output_char ch '.';
	output_string ch y;
	output_char ch 'E';
	output_string ch z;
      end
  | LeL(x,None,a,c) ->
      begin
	output_string ch "<span class='keyword'>let</span> ";
	output_string ch x;
	output_string ch  " &#x2254; ";
	output_ltree_html ch a stmh sknh;
	output_string ch " <span class='keyword'>in</span> ";
	output_ltree_html ch c stmh sknh;
      end
  | LeL(x,Some(i,b),a,c) ->
      begin
	output_string ch "<span class='keyword'>let</span> ";
	output_string ch x;
	output_asckind_html ch i;
	output_ltree_html ch b stmh sknh;
	output_string ch  " &#x2254; ";
	output_ltree_html ch a stmh sknh;
	output_string ch " <span class='keyword'>in</span> ";
	output_ltree_html ch c stmh sknh;
      end
  | LeML(x,yl,a,c) ->
      begin
	output_string ch "<span class='keyword'>let</span> [";
	output_string ch x;
	List.iter
	  (fun y ->
	    output_char ch ',';
	    output_string ch y;
	    )
	  yl;
	output_string ch  "] := ";
	output_ltree_html ch a stmh sknh;
	output_string ch  " in ";
	output_ltree_html ch c stmh sknh;
      end
  | BiL(x,m,[(xl,o)],c) ->
      let subp = Hashtbl.mem subscript x in
      let supp = Hashtbl.mem superscript x in
      output_name_html ch x;
      if subp then output_string ch "<sub>" else if supp then output_string ch "<sup>" else if not (Hashtbl.mem unicode x) then output_string ch " ";
      output_names_html ch xl;
      begin
	match o with
	| None -> ()
	| Some(i,b) ->
	    output_asckind_html ch i;
	    output_ltree_html ch b stmh sknh
      end;
      if subp then
	output_string ch "</sub>"
      else if supp then
	output_string ch "</sup>"
      else
	begin
	  output_midtok_html ch m;
	  output_string ch " "
	end;
      output_ltree_html ch c stmh sknh
  | BiL(x,m,vll,c) ->
      let subp = Hashtbl.mem subscript x in
      let supp = Hashtbl.mem superscript x in
      output_name_html ch x;
      if subp then output_string ch "<sub>" else if supp then output_string ch "<sup>";
      List.iter
	(fun (xl,o) ->
	  output_char ch '(';
	  output_names_html ch xl;
	  begin
	    match o with
	    | None -> ()
	    | Some(i,b) ->
		output_asckind_html ch i;
		output_ltree_html ch b stmh sknh
	  end;
	  output_char ch ')';
	)
	vll;
      if subp then
	output_string ch "</sub>"
      else if supp then
	output_string ch "</sup>"
      else
	output_midtok_html ch m;
      output_ltree_html ch c stmh sknh
  | PreoL(x,a) ->
      output_name_html ch x;
      output_char ch ' ';
      output_ltree_html ch a stmh sknh
  | PostoL(x,a) ->
      output_ltree_html ch a stmh sknh;
      output_char ch ' ';
      output_name_html ch x
  | InfoL(x,a,b) ->
      begin
	if match x with InfNam(y) -> Hashtbl.mem subscript y | _ -> false then
	  begin
	    output_ltree_html ch a stmh sknh;
	    output_string ch "<sub>";
	    output_ltree_html ch b stmh sknh;
	    output_string ch "</sub>";
	  end
	else if match x with InfNam(y) -> Hashtbl.mem superscript y | _ -> false then
	  begin
	    output_ltree_html ch a stmh sknh;
	    output_string ch "<sup>";
	    output_ltree_html ch b stmh sknh;
	    output_string ch "</sup>";
	  end
	else
	  begin
	    output_ltree_html ch a stmh sknh;
	    output_char ch ' ';
	    output_infixop_html ch x;
	    output_char ch ' ';
	    output_ltree_html ch b stmh sknh
	  end
      end
  | ImplopL(a,b) ->
      output_ltree_html ch a stmh sknh;
      output_char ch ' ';
      output_ltree_html ch b stmh sknh
  | SepL(x,i,a,b) ->
      output_char ch '{';
      output_name_html ch x;
      output_setinfixop_html ch i;
      output_ltree_html ch a stmh sknh;
      output_char ch '|';
      output_ltree_html ch b stmh sknh;
      output_char ch '}';
  | RepL(x,i,a,b) ->
      output_char ch '{';
      output_ltree_html ch a stmh sknh;
      output_char ch '|';
      output_name_html ch x;
      output_setinfixop_html ch i;
      output_ltree_html ch b stmh sknh;
      output_char ch '}';
  | SepRepL(x,i,a,b,c) ->
      output_char ch '{';
      output_ltree_html ch a stmh sknh;
      output_char ch '|';
      output_name_html ch x;
      output_setinfixop_html ch i;
      output_ltree_html ch b stmh sknh;
      output_string ch ", ";
      output_ltree_html ch c stmh sknh;
      output_char ch '}';
  | SetEnumL([]) ->
      output_char ch '{';
      output_char ch '}';
  | SetEnumL(a::bl) ->
      output_char ch '{';
      output_ltree_html ch a stmh sknh;
	List.iter
	  (fun b ->
	    output_char ch ',';
	    output_ltree_html ch b stmh sknh;
	    )
	  bl;
      output_char ch '}';
  | MTupleL(a,bl) ->
      output_char ch '[';
      output_ltree_html ch a stmh sknh;
      List.iter
	(fun b ->
	  output_char ch ',';
	  output_ltree_html ch b stmh sknh;
	)
	bl;
      output_char ch ']';
  | ParenL(a,[]) ->
      output_char ch '(';
      output_ltree_html ch a stmh sknh;
      output_char ch ')';
  | ParenL(a,b::cl) ->
      output_char ch '(';
      output_ltree_html ch a stmh sknh;
      List.iter
	(fun c ->
	  output_char ch ',';
	  output_ltree_html ch c stmh sknh;
	)
	(b::cl);
      output_char ch ')';
  | IfThenElseL(a,b,c) ->
      output_string ch "<span class='keyword'>if</span> ";
      output_ltree_html ch a stmh sknh;
      output_string ch " <span class='keyword'>then</span> ";
      output_ltree_html ch b stmh sknh;
      output_string ch " <span class='keyword'>else</span> ";
      output_ltree_html ch c stmh sknh

let output_docitem_html ch ditem stmh sknh =
  match ditem with
  | Author(x,yl) -> ()
  | Title(x) -> ()
  | Salt(x) -> ()
  | Treasure(x) ->
      Printf.fprintf ch "\n$%s\n" x;
  | ShowProofTerms(_) -> ()
  | Section(x) ->
     Printf.fprintf ch "<div class='section'>\n";
     Printf.fprintf ch "<div class='sectionbegin'>Beginning of Section <b>%s</b></div>\n" x 
  | End(x) ->
     Printf.fprintf ch "<div class='sectionend'>End of Section <b>%s</b></div>\n" x;
     Printf.fprintf ch "</div>\n"
  | VarDecl(xl,i,a) ->
      output_string ch "<div class='vardecl'><span class='docitemkeyword'>Variable</span> <span class='ltree'>";
      List.iter
	(fun x ->
	  output_char ch ' ';
	  output_string ch x;
	)
	xl;
      output_asckind_html ch i;
      output_ltree_html ch a stmh sknh;
      output_string ch "</span></div>\n";
  | LetDecl(x,None,b) ->
      output_string ch "<div class='letdecl'><span class='docitemkeyword'>Let</span> <span class='ltree'>";
      output_string ch x;
      output_string ch " &#x225d; ";
      output_ltree_html ch b stmh sknh;
      output_string ch "</span></div>\n";
  | LetDecl(x,Some(i,a),b) ->
      output_string ch "<div class='letdecl'><span class='docitemkeyword'>Let</span> <span class='ltree'>";
      output_string ch x;
      output_string ch " ";
      output_asckind_html ch i;
      output_ltree_html ch a stmh sknh;
      output_string ch " &#x225d; ";
      output_ltree_html ch b stmh sknh;
      output_string ch "</span></div>\n";
  | HypDecl(x,b) ->
      output_string ch "<div class='hypdecl'><span class='docitemkeyword'>Hypothesis</span> <span class='ltree'>";
      output_string ch x;
      output_string ch " : ";
      output_ltree_html ch b stmh sknh;
      output_string ch "</span></div>\n";
  | PostInfixDecl(x,b,p,InfixNone) ->
      output_string ch "<div class='infixdecl'><b>Notation</b>. We use <span class='ltree'>";
      output_name_html ch x;
      output_string ch "</span> as an infix operator with priority ";
      output_string ch (string_of_int p);
      output_string ch " and no associativity";
      output_string ch " corresponding to applying term <span class='ltree'>";
      output_ltree_html ch b stmh sknh;
      output_string ch "</span>.</div>\n";
  | PostInfixDecl(x,b,p,InfixLeft) ->
      output_string ch "<div class='infixdecl'><b>Notation</b>. We use <span class='ltree'>";
      output_name_html ch x;
      output_string ch "</span> as an infix operator with priority ";
      output_string ch (string_of_int p);
      output_string ch " and which associates to the left";
      output_string ch " corresponding to applying term <span class='ltree'>";
      output_ltree_html ch b stmh sknh;
      output_string ch "</span>.</div>\n";
  | PostInfixDecl(x,b,p,InfixRight) ->
      output_string ch "<div class='infixdecl'><b>Notation</b>. We use <span class='ltree'>";
      output_name_html ch x;
      output_string ch "</span> as an infix operator with priority ";
      output_string ch (string_of_int p);
      output_string ch " and which associates to the right";
      output_string ch " corresponding to applying term <span class='ltree'>";
      output_ltree_html ch b stmh sknh;
      output_string ch "</span>.</div>\n";
  | PostInfixDecl(x,b,p,Postfix) ->
      output_string ch "<div class='postfixdecl'><b>Notation</b>. We use <span class='ltree'>";
      output_name_html ch x;
      output_string ch "</span> as a postfix operator with priority ";
      output_string ch (string_of_int p);
      output_string ch " corresponding to applying term <span class='ltree'>";
      output_ltree_html ch b stmh sknh;
      output_string ch "</span>.";
      output_string ch "</div>\n";
  | PrefixDecl(x,b,p) ->
      output_string ch "<div class='prefixdecl'><b>Notation</b>. We use <span class='ltree'>";
      output_name_html ch x;
      output_string ch "</span> as a prefix operator with priority ";
      output_string ch (string_of_int p);
      output_string ch " corresponding to applying term <span class='ltree'>";
      output_ltree_html ch b stmh sknh;
      output_string ch "</span>.";
      output_string ch "</div>\n";
  | BinderDecl(plus,comma,x,a,None) ->
      output_string ch "<div class='binderdecl'><b>Notation</b>. We use <span class='ltree'>";
      output_name_html ch x;
      if plus then
	output_string ch " <i>x</i>...<i>y</i> [possibly with ascriptions] "
      else
	output_string ch " <i>x</i> [possibly with ascriptions] ";
      if comma then
	output_string ch " , <i>B</i> "
      else
	output_string ch " &#x21d2; <i>B</i>";
      output_string ch "</span> as a binder notation corresponding to a term constructed using <span class='ltree'>";
      output_ltree_html ch a stmh sknh;
      output_string ch "</span>.</div>\n";
  | BinderDecl(plus,comma,x,a,Some(b)) ->
      output_string ch "<div class='binderdecl'><b>Notation</b>. We use <span class='ltree'>";
      output_name_html ch x;
      if plus then
	output_string ch " <i>x</i>...<i>y</i> [possibly with ascriptions] "
      else
	output_string ch " <i>x</i> [possibly with ascriptions] ";
      if comma then
	output_string ch " , <i>B</i> "
      else
	output_string ch " &#x21d2; <i>B</i> ";
      output_string ch "</span> as a binder notation corresponding to a term constructed using <span class='ltree'>";
      output_ltree_html ch a stmh sknh;
      output_string ch "</span> and handling  &#x2208; or &#x2286; ascriptions using <span class='ltree'>";
      output_ltree_html ch b stmh sknh;
      output_string ch "</span>.</div>\n";
  | NotationDecl(x,yl) ->
      output_string ch "<div class='notationdecl'><b>Notation</b>. ";
      begin
	match x with
	| "IfThenElse" ->
	    begin
	      match yl with
	      | [y] ->
		  output_string ch "<span class='ltree'><span class='keyword'>if</span> <i>cond</i> <span class='keyword'>then</span> <i>T</i> <span class='keyword'>else</span> <i>E</i></span> is notation corresponding to <span class='ltree'>";
		  output_string ch y;
		  output_string ch " <i>type</i> <i>cond</i> <i>T</i> <i>E</i></span> where <span class='ltree'><i>type</i></span> is the inferred type of <span class='ltree'><i>T</i></span>."
	      | _ ->
		  raise (Failure("Bad IfThenElse notation"))
	    end
	| "Repl" ->
	    begin
	      match yl with
	      | [y] ->
		  output_string ch "<span class='ltree'>{<i>B</i>| <i>x</i> &#x2208; <i>A</i>}</span> is notation for <span class='ltree'>";
		  output_name_whrefa_html ch y stmh sknh;
		  output_string ch " <i>A</i> (&#x03bb; <i>x</i> . <i>B</i>)</span>."
	      | _ ->
		  raise (Failure("Bad Repl notation"))
	    end
	| "Sep" ->
	    begin
	      match yl with
	      | [y] ->
		  output_string ch "<span class='ltree'>{<i>x</i> &#x2208; <i>A</i> | <i>B</i>}</span> is notation for <span class='ltree'>";
		  output_name_whrefa_html ch y stmh sknh;
		  output_string ch " <i>A</i> (&#x03bb; <i>x</i> . <i>B</i>)</span>."
	      | _ ->
		  raise (Failure("Bad Sep notation"))
	    end
	| "ReplSep" ->
	    begin
	      match yl with
	      | [y] ->
		  output_string ch "<span class='ltree'>{<i>B</i>| <i>x</i> &#x2208; <i>A</i>, <i>C</i>}</span> is notation for <span class='ltree'>";
		  output_name_whrefa_html ch y stmh sknh;
		  output_string ch " <i>A</i> (&#x03bb; <i>x</i> . <i>C</i>) (&#x03bb; <i>x</i> . <i>B</i>)</span>."
	      | _ ->
		  raise (Failure("Bad ReplSep notation"))
	    end
	| "SetEnum" ->
	    begin
	      output_string ch "We now use the set enumeration notation <span class='ltree'>{...,...,...}</span> in general. ";
	      let rec setenum_notation_expl_r i z yl =
		match yl with
		| [] ->
		    output_string ch "  If more than ";
		    if i = 1 then
		      output_string ch " element is "
		    else
		      output_string ch " elements are ";
		    output_string ch " given, then <span class='ltree'>";
		    output_name_whrefa_html ch z stmh sknh;
		    output_string ch "</span> is used to reduce to the case with one fewer elements."
		| (y::yr) ->
		    output_string ch "  If ";
		    output_string ch (string_of_int i);
		    if i = 1 then
		      output_string ch " element is "
		    else
		      output_string ch " elements are ";
		    output_string ch " given, then <span class='ltree'>";
		    output_name_whrefa_html ch z stmh sknh;
		    output_string ch "</span> is used to form the corresponding term.";
		    setenum_notation_expl_r (i+1) y yr
	      in
	      match yl with
	      | (y::yr) ->
		  setenum_notation_expl_r 0 y yr
	      | _ ->
		  raise (Failure("Bad SetEnum notation"))
	    end
	| "SetEnum0" ->
	    begin
	      match yl with
	      | [y] ->
		  output_string ch "<span class='ltree'>{}</span> is notation for <span class='ltree'>";
		  output_name_whrefa_html ch y stmh sknh;
		  output_string ch "</span>.";
	      | _ ->
		  raise (Failure("Bad SetEnum0 notation"))
	    end
	| "SetEnum1" ->
	    begin
	      match yl with
	      | [y] ->
		  output_string ch "<span class='ltree'>{<i>x</i>}</span> is notation for <span class='ltree'>";
		  output_name_whrefa_html ch y stmh sknh;
		  output_string ch " <i>x</i></span>.";
	      | _ ->
		  raise (Failure("Bad SetEnum1 notation"))
	    end
	| "SetEnum2" ->
	    begin
	      match yl with
	      | [y] ->
		  output_string ch "<span class='ltree'>{<i>x</i>,<i>y</i>}</span> is notation for <span class='ltree'>";
		  output_name_whrefa_html ch y stmh sknh;
		  output_string ch " <i>x</i> <i>y</i></span>.";
	      | _ ->
		  raise (Failure("Bad SetEnum2 notation"))
	    end
	| "Nat" ->
	    begin
	      match yl with
	      | [y0;yS] ->
		  output_string ch "Natural numbers 0,1,2,... are notation for the terms formed using <span class='ltree'>";
		  output_name_whrefa_html ch y0 stmh sknh;
		  output_string ch "</span> as 0 and forming successors with <span class='ltree'>";
		  output_name_whrefa_html ch yS stmh sknh;
		  output_string ch "</span>."
	      | _ ->
		  raise (Failure("Bad Nat notation"))
	    end
	| "SetLam" ->
	    begin
	      match yl with
	      | [y] ->
		  output_string ch "<span class='ltree'>&#x03bb; <i>x</i> &#x2208; <i>A</i> &#x21d2; <i>B</i></span> is notation for the set <span class='ltree'>";
		  output_name_whrefa_html ch y stmh sknh;
		  output_string ch " <i>A</i> (&#x03bb; <i>x</i> : set &#x21d2; <i>B</i>)</span>.";
	      | _ ->
		  raise (Failure("Bad SetLam notation"))
	    end
	| "SetImplicitOp" ->
	    begin
	      match yl with
	      | [y] ->
		  output_string ch "When <span class='ltree'><i>x</i></span> is a set, a term <span class='ltree'><i>x</i> <i>y</i></span> is notation for <span class='ltree'>";
		  output_name_whrefa_html ch y stmh sknh;
		  output_string ch " <i>x</i> <i>y</i></span>.";
	      | _ ->
		  raise (Failure("Bad SetImplicitOp notation"))
	    end
	| _ -> raise (Failure("Unknown notation " ^ x))
      end;
      output_string ch "</div>\n";
  | UnicodeDecl(x,ul) -> ()
  | SuperscriptDecl(x) -> (*** I should say something about notation here, but at the moment it would need to be "If x is a binder, then we write its bound variables as a superscript. If x is an infix operator, then we omit the operator and write the second argument as a superscript." ***)
      ()
  | SubscriptDecl(x) -> (*** I should say something about notation here, but at the moment it would need to be "If x is a binder, then we write its bound variables as a subscript. If x is an infix operator, then we omit the operator and write the second argument as a subscript." ***)
      ()
  | ParamDecl(x,a) ->
      Hashtbl.add localhrefh x ();
      output_string ch "<a name='";
      output_string ch (url_friendly_name x);
      output_string ch "'/>";
      output_string ch "<div class='paramdecl'><b>Primitive</b>. The name <span class='ltree'>";
      output_name_whrefa_html ch x stmh sknh;
      output_string ch "</span> is a term of type <span class='ltree'>";
      output_ltree_html ch a stmh sknh;
      output_string ch "</span>.</div>\n";
      begin
	if x = "In" then
	  begin
	    output_string ch "<div class='infixdecl'><b>Notation</b>. We use <span class='ltree'>&#x2208;</span>";
	    output_string ch "</span> as an infix operator with priority 500";
	    output_string ch " and no associativity";
	    output_string ch " corresponding to applying term <span class='ltree'>";
	    output_name_whrefa_html ch x stmh sknh;
	    output_string ch "</span>. Furthermore, we may write <span class='ltree'>&#x2200; <I>x</I> &#x2208; <I>A</I>, <I>B</I></span> to mean <span class='ltree'>&#x2200; <I>x</I> : ";
	    output_name_whrefa_html ch "set" stmh sknh;
	    output_string ch ", <I>x</I> &#x2208; <I>A</I> &#x2192; <I>B</I></span>.</div>\n";
	  end
      end;
      begin
	if x = "Subq" then
	  begin
	    output_string ch "<div class='infixdecl'><b>Notation</b>. We use <span class='ltree'>&#x2286;</span>";
	    output_string ch "</span> as an infix operator with priority 500";
	    output_string ch " and no associativity";
	    output_string ch " corresponding to applying term <span class='ltree'>";
	    output_name_whrefa_html ch x stmh sknh;
	    output_string ch "</span>. Furthermore, we may write <span class='ltree'>&#x2200; <I>x</I> &#x2286; <I>A</I>, <I>B</I></span> to mean <span class='ltree'>&#x2200; <I>x</I> : ";
	    output_name_whrefa_html ch "set" stmh sknh;
	    output_string ch ", <I>x</I> &#x2286; <I>A</I> &#x2192; <I>B</I></span>.</div>\n";
	  end
      end
  | ParamHash(x,h,_) -> ()
  | DefDecl(x,None,a) ->
      Hashtbl.add localhrefh x ();
      output_string ch "<a name='";
      output_string ch (url_friendly_name x);
      output_string ch "'/>";
      output_string ch "<div class='defdecl'><b>Definition.</b> We define <span class='ltree'>";
      output_name_whrefa_html ch x stmh sknh;
      output_string ch "</span> to be <span class='ltree'>";
      output_ltree_html ch a stmh sknh;
      output_string ch "</span>.</div>\n";
      begin
	if x = "Subq" then
	  begin
	    output_string ch "<div class='infixdecl'><b>Notation</b>. We use <span class='ltree'>&#x2286;</span>";
	    output_string ch "</span> as an infix operator with priority 500";
	    output_string ch " and no associativity";
	    output_string ch " corresponding to applying term <span class='ltree'>";
	    output_name_whrefa_html ch x stmh sknh;
	    output_string ch "</span>. Furthermore, we may write <span class='ltree'>&#x2200; <I>x</I> &#x2286; <I>A</I>, <I>B</I></span> to mean <span class='ltree'>&#x2200; <I>x</I> : ";
	    output_name_whrefa_html ch "set" stmh sknh;
	    output_string ch ", <I>x</I> &#x2286; <I>A</I> &#x2192; <I>B</I></span>.</div>\n";
	  end
      end
  | DefDecl(x,Some b,a) ->
      Hashtbl.add localhrefh x ();
      output_string ch "<a name='";
      output_string ch (url_friendly_name x);
      output_string ch "'/>";
      output_string ch "<div class='defdecl'><b>Definition.</b> We define <span class='ltree'>";
      output_name_whrefa_html ch x stmh sknh;
      output_string ch "</span> to be <span class='ltree'>";
      output_ltree_html ch a stmh sknh;
      output_string ch "</span> of type <span class='ltree'>";
      output_ltree_html ch b stmh sknh;
      output_string ch "</span>.</div>\n";
      begin
	if x = "Subq" then
	  begin
	    output_string ch "<div class='infixdecl'><b>Notation</b>. We use <span class='ltree'>&#x2286;</span>";
	    output_string ch "</span> as an infix operator with priority 500";
	    output_string ch " and no associativity";
	    output_string ch " corresponding to applying term <span class='ltree'>";
	    output_name_whrefa_html ch x stmh sknh;
	    output_string ch "</span>. Furthermore, we may write <span class='ltree'>&#x2200; <I>x</I> &#x2286; <I>A</I>, <I>B</I></span> to mean <span class='ltree'>&#x2200; <I>x</I> : ";
	    output_name_whrefa_html ch "set" stmh sknh;
	    output_string ch ", <I>x</I> &#x2286; <I>A</I> &#x2192; <I>B</I></span>.</div>\n";
	  end
      end
  | AxDecl(x,a) ->
      Hashtbl.add localhrefh x ();
      output_string ch "<a name='";
      output_string ch (url_friendly_name x);
      output_string ch "'/>";
      output_string ch "<div class='axdecl'><b>Axiom.</b> (<span class='ltree'>";
      output_name_whrefa_html ch x stmh sknh;
      output_string ch "</span>) We take the following as an axiom:\n<div class='axiomprop'><span class='ltree'>";
      output_ltree_html ch a stmh sknh;
      output_string ch "</span></div></div>\n";
  | ThmDecl(c,x,a) ->
      Hashtbl.add localhrefh x ();
      output_string ch "<a name='";
      output_string ch (url_friendly_name x);
      output_string ch "'/>";
      output_string ch "<div class='thmandproof'><div class='thmdecl'><b>";
      output_string ch c;
      output_string ch ".</b> (<span class='ltree'>";
      output_name_whrefa_html ch x stmh sknh;
      output_string ch "</span>) The following is provable: <div class='thmprop'><span class='ltree'>";
      output_ltree_html ch a stmh sknh;
      output_string ch "</span></div></div>\n";
      incr thmcount;
      Buffer.reset pftext;
      Printf.fprintf ch "<div id='pf%d' class='proof'><div class='proofpres' onclick='g(this)'><b>Proof:</b><br/>" !thmcount

let text_row_col txt =
  let nli = ref 1 in
  let nch = ref 0 in
  let maxch = ref 0 in
  for i = 0 to String.length txt - 1 do
    let c = txt.[i] in
    if c = '\n' then
      (incr nli; nch := 0)
    else
      (incr nch; maxch := max !maxch !nch)
  done;
  (!nli,!maxch)

let rec output_comma_list_str ch f y yl =
  match yl with
  | [] -> Printf.fprintf ch " and "; f y
  | z::yr -> f y; Printf.fprintf ch ", "; output_comma_list_str ch f z yr

let output_pftacitem_html ch pftac stmh sknh laststructact =
  match pftac with
  | PfStruct i when i < 4 ->
      if laststructact = 1 then
	output_string ch "<div class='subproof'>"
      else if laststructact = 2 then
	output_string ch "</div>\n<div class='subproof'>"
      else if laststructact = 3 then
	output_string ch "</div>\n";
  | PfStruct 4 -> output_string ch "<div class='subproof'>";
  | PfStruct 5 -> output_string ch "</div>";
  | PfStruct _ -> ()
  | Exact(a) ->
      output_string ch "<div class='exact'>An <span class='pftackeyword'>exact</span> proof term for the current goal is <span class='ltree'>";
      output_ltree_html ch a stmh sknh;
      output_string ch "</span>.</div>\n"
  | LetTac(xl,None) ->
      output_string ch "<div class='lettac'><span class='pftackeyword'>Let</span> <span class='ltree'>";
      output_comma_names_html ch xl;
      output_string ch "</span> be given.</div>\n"
  | LetTac(xl,Some a) ->
      output_string ch "<div class='lettac'><span class='pftackeyword'>Let</span> <span class='ltree'>";
      output_comma_names_html ch xl;
      output_string ch "</span> of type <span class='ltree'>";
      output_ltree_html ch a stmh sknh;
      output_string ch "</span> be given.</div>\n"
  | SetTac(x,None,a) ->
      output_string ch "<div class='settac'><span class='pftackeyword'>Set</span> <span class='ltree'>";
      output_string ch x;
      output_string ch "</span> to be the term <span class='ltree'>";
      output_ltree_html ch a stmh sknh;
      output_string ch "</span>.</div>\n"
  | SetTac(x,Some(b),a) ->
      output_string ch "<div class='settac'><span class='pftackeyword'>Set</span> <span class='ltree'>";
      output_string ch x;
      output_string ch "</span> to be the term <span class='ltree'>";
      output_ltree_html ch a stmh sknh;
      output_string ch "</span> of type <span class='ltree'>";
      output_ltree_html ch b stmh sknh;
      output_string ch "</span>.</div>\n"
  | AssumeTac(xl,None) ->
      output_string ch "<div class='assumetac'><span class='pftackeyword'>Assume</span> <span class='ltree'>";
      output_names_html ch xl;
      output_string ch "</span>.</div>\n"
  | AssumeTac(xl,Some a) ->
      output_string ch "<div class='assumetac'><span class='pftackeyword'>Assume</span> <span class='ltree'>";
      output_names_html ch xl;
      output_string ch "</span>: <span class='ltree'>";
      output_ltree_html ch a stmh sknh;
      output_string ch "</span>.</div>\n"
  | ApplyTac(a) ->
      output_string ch "<div class='applytac'><span class='pftackeyword'>Apply</span> <span class='ltree'>";
      output_ltree_html ch a stmh sknh;
      output_string ch "</span> to the current goal.</div>\n"
  | ClaimTac(x,a) ->
      output_string ch "<div class='claimtac'>We prove the intermediate <span class='pftackeyword'>claim</span> <span class='ltree'>";
      output_name_html ch x;
      output_string ch "</span>: <span class='ltree'>";
      output_ltree_html ch a stmh sknh;
      output_string ch "</span>.</div>\n"
  | ProveTac(a,bl) ->
      output_string ch "<div class='provetac'>We will <span class='pftackeyword'>prove</span> ";
      output_ltree_html ch a stmh sknh;
      List.iter (fun b ->
	output_string ch ", <span class='ltree'>";
	output_ltree_html ch b stmh sknh;
	output_string ch "</span>")
	bl;
      output_string ch ".</div>\n"
  | CasesTac(a,cl) ->
      raise (Failure("Cases tactic not yet implemented"))
  | WitnessTac(a) ->
      output_string ch "<div class='witnesstac'>We use <span class='ltree'>";
      output_ltree_html ch a stmh sknh;
      output_string ch "</span> to <span class='pftackeyword'>witness</span> the existential quantifier.</div>\n";
  | RewriteTac(s,a,il) ->
      output_string ch "<div class='rewritetac'><span class='pftackeyword'>rewrite</span> the current goal using <span class='ltree'>";
      output_ltree_html ch a stmh sknh;
      output_string ch "</span>";
      if s then
	output_string ch " (from right to left)"
      else
	output_string ch " (from left to right)";
      begin
	match il with
	| [] -> ()
	| [i] ->
	    output_string ch " at position ";
	    output_string ch (string_of_int i);
	| (i::j::kl) ->
	    output_string ch " at positions ";
	    let rec posl i j kl =
	      match kl with
	      | k::kr ->
		  output_string ch (string_of_int i);
		  output_string ch ", ";
		  posl j k kr
	      | [] ->
		  output_string ch (string_of_int i);
		  output_string ch " and ";
		  output_string ch (string_of_int j)
	    in
	    posl i j kl
      end;
      output_string ch ".</div>\n"
  | SpecialTac(x,[]) -> Printf.fprintf ch "<div>Use %s.</div>\n" x
  | SpecialTac(x,y::yl) ->
     Printf.fprintf ch "<div>Use %s with " x;
     output_comma_list_str ch (fun a -> output_ltree_html ch a stmh sknh) y yl;
     Printf.fprintf ch ".</div>\n";
  | Qed ->
      output_string ch "&#x220e;\n";
      Printf.fprintf ch "</div><div id='pf%dcode' class='proofcodehidden'>\n" !thmcount;
      Printf.fprintf ch "<input type='hidden' id='pf%dcodeline' value='%d'/><input type='hidden' id='pf%dcodechar' value='%d'/>\n" !thmcount !pflinestart !thmcount !pfcharstart;
      if (String.length !currtmid > 0) then (Printf.fprintf ch "<input type='hidden' id='pf%dcodetmid' value='%s'/>\n" !thmcount !currtmid; currtmid := "");
      (*      
      let pftxt = Buffer.contents pftext in
      let (rowcount,colcount) = text_row_col pftxt in
Printf.fprintf ch "<textarea id='pf%dcodetext' rows=%d cols=%d>%s</textarea><br/><input type='button' value='Recheck' onclick='h(this)'/>\n" !thmcount rowcount colcount pftxt;
      Printf.fprintf ch "<div id='pf%dcoderesp' class='proofcoderesp'/></div>" !thmcount; *)
      output_string ch "</div></div></div>\n"
  | Admitted ->
      if laststructact < 0 then
	begin
	  output_string ch "<div class='admitted'>The proof is left to the reader.</div>\n";
	  Printf.fprintf ch "</div><div id='pf%dcode' class='proofcodehidden'>\n" !thmcount;
	  Printf.fprintf ch "<input type='hidden' id='pf%dcodeline' value='%d'/><input type='hidden' id='pf%dcodechar' value='%d'/>\n" !thmcount !pflinestart !thmcount !pfcharstart;
	  if (String.length !currtmid > 0) then (Printf.fprintf ch "<input type='hidden' id='pf%dcodetmid' value='%s'/>\n" !thmcount !currtmid; currtmid := "");
	  Printf.fprintf ch "<textarea id='pf%dcodetext' rows=5 cols=80></textarea><br/><input type='button' value='Check' onclick='h(this)'/>\n" !thmcount; (*** just leave this one blank instead of just putting 'Admitted' ***)
	  Printf.fprintf ch "<div id='pf%dcoderesp' class='proofcoderesp'/></div>" !thmcount;
	  output_string ch "</div></div></div>\n"
	end
      else
	begin
	  output_string ch "<div class='admitted'>The rest of the proof is left to the reader.</div>\n";
	  Printf.fprintf ch "</div><div id='pf%dcode' class='proofcodehidden'>\n" !thmcount;
	  Printf.fprintf ch "<input type='hidden' id='pf%dcodeline' value='%d'/><input type='hidden' id='pf%dcodechar' value='%d'/>\n" !thmcount !pflinestart !thmcount !pfcharstart;
	  if (String.length !currtmid > 0) then (Printf.fprintf ch "<input type='hidden' id='pf%dcodetmid' value='%s'/>\n" !thmcount !currtmid; currtmid := "");
	  let pftxt = Buffer.contents pftext in
	  let (rowcount,colcount) = text_row_col pftxt in
	  Printf.fprintf ch "<textarea id='pf%dcodetext' rows=%d cols=%d>%s</textarea><br/><input type='button' value='Check' onclick='h(this)'/>\n" !thmcount rowcount colcount pftxt;
	  Printf.fprintf ch "<div id='pf%dcoderesp' class='proofcoderesp'/></div>" !thmcount;
	  output_string ch "</div></div></div>\n"
	end
  | Admit ->
      output_string ch "<div class='admit'>The rest of this subproof is left to the reader.</div>"

let rec stp_html_string_1 a p =
  match a with
  | TpVar 0 -> "&#x3b1;"
  | TpVar 1 -> "&#x3b2;"
  | TpVar 2 -> "&#x3b3;"
  | TpVar i -> raise (Failure("bad type var"))
  | Set -> "set"
  | Prop -> "prop"
  | Ar(b,c) when p -> "(" ^ stp_html_string_1 b true ^ " &#x2192; " ^ stp_html_string_1 c false ^ ")"
  | Ar(b,c) -> stp_html_string_1 b true ^ " &#x2192; " ^ stp_html_string_1 c false
      
let stp_html_string a = stp_html_string_1 a false

                                          (** latex **)
let latex_code x =
  let b = Buffer.create 10 in
  for i = 0 to String.length x - 1 do
    let cc = Char.code (x.[i]) in
    Buffer.add_char b (Char.chr (97 + (cc land 15)));
    Buffer.add_char b (Char.chr (97 + ((cc lsr 4) land 15)))
  done;
  Buffer.contents b
  
let output_name_latex_code ch x =
  for i = 0 to String.length x - 1 do
    let cc = Char.code (x.[i]) in
    Printf.fprintf ch "%c%c" (Char.chr (97 + (cc land 15))) (Char.chr (97 + ((cc lsr 4) land 15)))
  done
  
let output_unicode_latex ch u =
  output_string ch "\\uni";
  output_name_latex_code ch u

let esc_latex x =
  let b = Buffer.create 10 in
  for i = 0 to (String.length x) - 1 do
    let c = x.[i] in
    if c = '_' then Buffer.add_char b '\\';
    Buffer.add_char b c
  done;
  Buffer.contents b

let output_name_latex ch x =
  try
    let ul = Hashtbl.find unicode x in
    List.iter (fun u -> output_unicode_latex ch u) ul
  with Not_found -> output_string ch (esc_latex x)

let output_asckind_latex ch k =
  match k with
  | AscTp -> output_string ch " : "
  | AscSet -> output_string ch " \\in "
  | AscSubeq -> output_string ch " \\subseteq "

let output_setinfixop_latex ch k =
  match k with
  | InfMem -> output_string ch " \\in "
  | InfSubq -> output_string ch " \\subseteq "

let output_infixop_latex ch i =
  match i with
  | InfNam(x) -> output_name_latex ch x
  | InfSet(k) -> output_setinfixop_latex ch k

let output_midtok_latex ch m =
  if m = "," then
    output_string ch " . "
(*    output_string ch " , " *)
  else if m = "=>" then
    output_string ch " . "
(*    output_string ch " \\Rightarrow " *)
  else
    output_string ch m

let output_names_latex ch xl =
  match xl with
  | [] -> ()
  | (x::yl) ->
      output_name_latex ch x;
      List.iter
	(fun y ->
	  output_char ch ' ';
	  output_name_latex ch y)
	yl

let rec output_comma_names_latex ch xl =
  match xl with
  | [] -> ()
  | [x] ->
      output_name_latex ch x;
  | [x;y] ->
      output_name_latex ch x;
      output_string ch " and ";
      output_name_latex ch y;
  | (x::yl) ->
      output_name_latex ch x;
      output_string ch ", ";
      output_comma_names_latex ch yl

let globallatexname : (string,unit) Hashtbl.t = Hashtbl.create 100
let latexref : (string,string * string) Hashtbl.t = Hashtbl.create 100
                                                   
(*** <a> causes css problems in combination with <span> for some reason, so only call this if it's declaring the name (not inside an lterm).
    Eh, it also insists on screwing up the font. I've just changed all anchors to have the math friendly font. How annoying. ***)
let output_name_whref_latex ch x stmh sknh : unit =
  if x = "prop" then
    output_string ch "o"
  else if x = "set" then
    output_string ch "\\iota"
  else if x = "SType" then
    output_string ch "{\\mathsf{Type}}"
  else if List.mem x ["alpha";"beta";"gamma";"delta";"eta";"lambda"] then
    Printf.fprintf ch "\\%s" x
  else if Hashtbl.mem globallatexname x then
    begin
      Printf.fprintf ch "\\mname{%s}" (esc_latex x);
    end
  else
    try
      let (k,r) = Hashtbl.find latexref x in
      if k = "Hyp" then
        Printf.fprintf ch "(%s)" r
      else if k = "Axiom" then
        Printf.fprintf ch "{\\mbox{Axiom~%s}}" r
      else if k = "Theorem" then
        Printf.fprintf ch "{\\mbox{Theorem~%s}}" r
      else
        output_string ch (esc_latex x)
    with Not_found ->
      output_string ch (esc_latex x)

let output_name_whrefa_latex ch x stmh sknh =
  output_name_whref_latex ch x stmh sknh

let rec output_ltree_latex ch a stmh sknh : unit =
  output_string ch "{";
  output_ltree_latex_c ch a stmh sknh;
  output_string ch "}"
and output_ltree_latex_c ch a stmh sknh : unit =
  match a with
  | ByteL(x) -> Printf.fprintf ch "\\x%02x" x
  | StringL(x) -> output_char ch '"'; output_string ch x; output_char ch '"'
  | QStringL(x) -> output_char ch '?'; output_string ch x; output_char ch '?'
  | NaL(x) ->
      output_name_whref_latex ch x stmh sknh
  | NuL(b,x,None,None) ->
      begin
	if b then output_char ch '-';
	output_string ch x;
      end
  | NuL(b,x,Some y,None) ->
      begin
	if b then output_char ch '-';
	output_string ch x;
	output_char ch '.';
	output_string ch y;
      end
  | NuL(b,x,None,Some z) ->
      begin
	if b then output_char ch '-';
	output_string ch x;
	output_char ch 'E';
	output_string ch z;
      end
  | NuL(b,x,Some y,Some z) ->
      begin
	if b then output_char ch '-';
	output_string ch x;
	output_char ch '.';
	output_string ch y;
	output_char ch 'E';
	output_string ch z;
      end
  | LeL(x,None,a,c) ->
      begin
	output_string ch "\\mlet{";
	output_string ch x;
	output_string ch "}{";
	output_ltree_latex ch a stmh sknh;
	output_string ch "}{";
	output_ltree_latex ch c stmh sknh;
	output_string ch "}";
      end
  | LeL(x,Some(i,b),a,c) ->
      begin
	output_string ch "\\mleta{";
	output_string ch x;
	output_string ch "}{";
	output_asckind_latex ch i;
	output_string ch "}{";
	output_ltree_latex ch b stmh sknh;
	output_string ch "}{";
	output_ltree_latex ch a stmh sknh;
	output_string ch "}{";
	output_ltree_latex ch c stmh sknh;
	output_string ch "}";
      end
  | LeML(x,yl,a,c) ->
      begin
	output_string ch "\\mletm{";
	output_string ch x;
	List.iter
	  (fun y ->
	    output_char ch ',';
	    output_string ch y)
	  yl;
	output_string ch "}{";
	output_ltree_latex ch a stmh sknh;
	output_string ch "}{";
	output_ltree_latex ch c stmh sknh;
	output_string ch "}";
      end
  | BiL(x,m,[(xl,o)],c) ->
      let subp = Hashtbl.mem subscript x in
      let supp = Hashtbl.mem superscript x in
      output_name_latex ch x;
      output_char ch ' ';
      if subp then output_string ch "_{" else if supp then output_string ch "^{" else if not (Hashtbl.mem unicode x) then output_string ch " ";
      output_names_latex ch xl;
      begin
	match o with
	| None -> ()
	| Some(i,b) ->
	    output_asckind_latex ch i;
	    output_ltree_latex ch b stmh sknh
      end;
      if subp then
	output_string ch "}"
      else if supp then
	output_string ch "}"
      else
	begin
	  output_midtok_latex ch m;
	  output_string ch " "
	end;
      output_ltree_latex ch c stmh sknh;
  | BiL(x,m,vll,c) ->
      let subp = Hashtbl.mem subscript x in
      let supp = Hashtbl.mem superscript x in
      output_name_latex ch x;
      output_char ch ' ';
      if subp then output_string ch "_{" else if supp then output_string ch "^{";
      List.iter
	(fun (xl,o) ->
	  output_char ch '(';
	  output_names_latex ch xl;
	  begin
	    match o with
	    | None -> ()
	    | Some(i,b) ->
		output_asckind_latex ch i;
		output_ltree_latex ch b stmh sknh
	  end;
	  output_char ch ')')
	vll;
      if subp then
	output_string ch "}"
      else if supp then
	output_string ch "}"
      else
	output_midtok_latex ch m;
      output_ltree_latex ch c stmh sknh;
  | PreoL(x,a) ->
      output_string ch "\\pre";
      output_name_latex_code ch x;
      output_char ch '{';
      output_ltree_latex ch a stmh sknh;
      output_char ch '}';
  | PostoL(x,a) ->
      output_string ch "\\post";
      output_name_latex_code ch x;
      output_char ch '{';
      output_ltree_latex ch a stmh sknh;
      output_char ch '}';
  | InfoL(x,a,b) ->
      begin
	if match x with InfNam(y) -> Hashtbl.mem subscript y | _ -> false then
	  begin
	    output_ltree_latex ch a stmh sknh;
	    output_string ch "_{";
	    output_ltree_latex ch b stmh sknh;
	    output_string ch "}";
	  end
	else if match x with InfNam(y) -> Hashtbl.mem superscript y | _ -> false then
	  begin
	    output_ltree_latex ch a stmh sknh;
	    output_string ch "^{";
	    output_ltree_latex ch b stmh sknh;
	    output_string ch "}";
	  end
	else
	  begin
	    output_ltree_latex ch a stmh sknh;
            output_infixop_latex ch x;
	    output_ltree_latex ch b stmh sknh;
	  end
      end
  | ImplopL(a,b) ->
      output_ltree_latex ch a stmh sknh;
      output_char ch '~';
      output_ltree_latex ch b stmh sknh
  | SepL(x,i,a,b) ->
      output_string ch "\\{";
      output_name_latex ch x;
      output_setinfixop_latex ch i;
      output_ltree_latex ch a stmh sknh;
      output_char ch '|';
      output_ltree_latex ch b stmh sknh;
      output_string ch "\\}";
  | RepL(x,i,a,b) ->
      output_string ch "\\{";
      output_ltree_latex ch a stmh sknh;
      output_char ch '|';
      output_name_latex ch x;
      output_setinfixop_latex ch i;
      output_ltree_latex ch b stmh sknh;
      output_string ch "\\}";
  | SepRepL(x,i,a,b,c) ->
      output_string ch "\\{";
      output_ltree_latex ch a stmh sknh;
      output_char ch '|';
      output_name_latex ch x;
      output_setinfixop_latex ch i;
      output_ltree_latex ch b stmh sknh;
      output_string ch ", ";
      output_ltree_latex ch c stmh sknh;
      output_string ch "\\}";
  | SetEnumL([]) ->
      output_string ch "\\{\\}";
  | SetEnumL(a::bl) ->
     output_string ch "\\{";
     output_ltree_latex ch a stmh sknh;
     List.iter
       (fun b ->
	 output_char ch ',';
	 output_ltree_latex ch b stmh sknh;
       )
       bl;
     output_string ch "\\}";
  | MTupleL(a,bl) ->
      output_char ch '[';
      output_ltree_latex ch a stmh sknh;
      List.iter
	(fun b ->
	  output_char ch ',';
	  output_ltree_latex ch b stmh sknh;
	)
	bl;
      output_char ch ']';
  | ParenL(a,[]) ->
      output_char ch '(';
      output_ltree_latex ch a stmh sknh;
      output_char ch ')';
  | ParenL(a,b::cl) ->
      output_char ch '(';
      output_ltree_latex ch a stmh sknh;
      List.iter
	(fun c ->
	  output_char ch ',';
	  output_ltree_latex ch c stmh sknh;
	)
	(b::cl);
      output_char ch ')';
  | IfThenElseL(a,b,c) ->
      output_string ch "\\mif{";
      output_ltree_latex ch a stmh sknh;
      output_string ch "}{";
      output_ltree_latex ch b stmh sknh;
      output_string ch "}{";
      output_ltree_latex ch c stmh sknh;
      output_string ch "}"

let output_docitem_latex ch ditem stmh sknh =
  match ditem with
  | Author(x,yl) -> ()
  | Title(x) ->
     Printf.fprintf ch "\\chapter{%s}\n\n" x
  | Salt(x) -> ()
  | Treasure(x) -> ()
  | ShowProofTerms(_) -> ()
  | Section(_) -> ()
  | End(_) -> ()
  | VarDecl(xl,i,a) ->
     output_string ch "Let $";
     List.iter
       (fun x ->
	 output_char ch ' ';
	 output_string ch x;
       )
       xl;
     output_asckind_latex ch i;
     output_ltree_latex ch a stmh sknh;
     output_string ch "$ be given.\n";
  | LetDecl(x,None,b) ->
     output_string ch "Let $";
     output_string ch x;
     output_string ch "$ be $";
     output_ltree_latex ch b stmh sknh;
     output_string ch "$.\n";
  | LetDecl(x,Some(i,a),b) ->
     output_string ch "Let $";
     output_string ch x;
     output_asckind_latex ch i;
     output_ltree_latex ch a stmh sknh;
     output_string ch "$ be $";
     output_ltree_latex ch b stmh sknh;
     output_string ch "$.\n";
  | HypDecl(x,b) ->
     Hashtbl.add latexref x ("Hyp",Printf.sprintf "\\ref{hyp:%s}" (latex_code x));
     output_string ch "Assume the following.\n";
     output_string ch "\\begin{equation}\n";
     output_ltree_latex ch b stmh sknh;
     output_string ch "\\label{hyp:";
     output_name_latex_code ch x;
     output_string ch "}\n";
     output_string ch "\\end{equation}\n";
  | PostInfixDecl(x,b,p,InfixNone) ->
      output_string ch "{\\bf{Notation.}} We use $\\inf";
      output_name_latex_code ch x;
      output_string ch "$ as an infix operator ";
      output_string ch " corresponding to applying term $";
      output_ltree_latex ch b stmh sknh;
      output_string ch "$.\n";
  | PostInfixDecl(x,b,p,InfixLeft) ->
      output_string ch "{\\bf{Notation.}} We use $\\inf";
      output_name_latex_code ch x;
      output_string ch "$ as a left associative infix operator ";
      output_string ch " corresponding to applying term $";
      output_ltree_latex ch b stmh sknh;
      output_string ch "$.\n";
  | PostInfixDecl(x,b,p,InfixRight) ->
      output_string ch "{\\bf{Notation.}} We use $\\inf";
      output_name_latex_code ch x;
      output_string ch "$ as a right associative infix operator ";
      output_string ch " corresponding to applying term $";
      output_ltree_latex ch b stmh sknh;
      output_string ch "$.\n";
  | PostInfixDecl(x,b,p,Postfix) ->
      output_string ch "{\\bf{Notation.}} We use $\\post";
      output_name_latex_code ch x;
      output_string ch "{-}$ as a postfix operator ";
      output_string ch " corresponding to applying term $";
      output_ltree_latex ch b stmh sknh;
      output_string ch "$.\n";
  | PrefixDecl(x,b,p) ->
      output_string ch "{\\bf{Notation.}} We use $\\pre";
      output_name_latex_code ch x;
      output_string ch "{-}$ as a prefix operator ";
      output_string ch " corresponding to applying term $";
      output_ltree_latex ch b stmh sknh;
      output_string ch "$.\n";
  | BinderDecl(plus,comma,x,a,None) ->
     output_string ch "{\\bf{Notation.}} We use $\\bind";
     output_name_latex_code ch x;
     if plus then
       output_string ch " x,\\ldots,y "
     else
       output_string ch " x ";
     output_string ch " . ";
     output_string ch "$ as a binder notation corresponding to a term constructed using $";
     output_ltree_latex ch a stmh sknh;
     output_string ch "$.\n";
  | BinderDecl(plus,comma,x,a,Some(b)) ->
     output_string ch "{\\bf{Notation.}} We use $\\bind";
     output_name_latex_code ch x;
     if plus then
       output_string ch " x,\\ldots,y "
     else
       output_string ch " x ";
     output_string ch " . ";
     output_string ch "$ as a binder notation corresponding to a term constructed using $";
     output_ltree_latex ch a stmh sknh;
     output_string ch "$ and handling $\\in$ or $\\subseteq$ ascriptions using $\n";
     output_ltree_latex ch b stmh sknh;
     output_string ch "$.\n";
  | NotationDecl(x,yl) ->
      output_string ch "{\\bf{Notation.}} ";
      begin
	match x with
	| "IfThenElse" ->
	    begin
	      match yl with
	      | [y] ->
		  output_string ch "% <span class='ltree'><span class='keyword'>if</span> <i>cond</i> <span class='keyword'>then</span> <i>T</i> <span class='keyword'>else</span> <i>E</i></span> is notation corresponding to <span class='ltree'>";
		  output_string ch y;
		  output_string ch " <i>type</i> <i>cond</i> <i>T</i> <i>E</i></span> where <span class='ltree'><i>type</i></span> is the inferred type of <span class='ltree'><i>T</i></span>.\n"
	      | _ ->
		  raise (Failure("Bad IfThenElse notation"))
	    end
	| "Repl" ->
	    begin
	      match yl with
	      | [y] ->
		  output_string ch "% <span class='ltree'>{<i>B</i>| <i>x</i> &#x2208; <i>A</i>}</span> is notation for <span class='ltree'>";
		  output_name_whref_latex ch y stmh sknh;
		  output_string ch " <i>A</i> (&#x03bb; <i>x</i> . <i>B</i>)</span>.\n"
	      | _ ->
		  raise (Failure("Bad Repl notation"))
	    end
	| "Sep" ->
	    begin
	      match yl with
	      | [y] ->
		  output_string ch "% <span class='ltree'>{<i>x</i> &#x2208; <i>A</i> | <i>B</i>}</span> is notation for <span class='ltree'>";
		  output_name_whref_latex ch y stmh sknh;
		  output_string ch " <i>A</i> (&#x03bb; <i>x</i> . <i>B</i>)</span>.\n"
	      | _ ->
		  raise (Failure("Bad Sep notation"))
	    end
	| "ReplSep" ->
	    begin
	      match yl with
	      | [y] ->
		  output_string ch "% <span class='ltree'>{<i>B</i>| <i>x</i> &#x2208; <i>A</i>, <i>C</i>}</span> is notation for <span class='ltree'>";
		  output_name_whref_latex ch y stmh sknh;
		  output_string ch " <i>A</i> (&#x03bb; <i>x</i> . <i>C</i>) (&#x03bb; <i>x</i> . <i>B</i>)</span>.\n"
	      | _ ->
		  raise (Failure("Bad ReplSep notation"))
	    end
	| "SetEnum" ->
	    begin
	      output_string ch "% We now use the set enumeration notation <span class='ltree'>{...,...,...}</span> in general. ";
	      let rec setenum_notation_expl_r i z yl =
		match yl with
		| [] ->
		    output_string ch "  If more than ";
		    if i = 1 then
		      output_string ch " element is "
		    else
		      output_string ch " elements are ";
		    output_string ch " given, then <span class='ltree'>";
		    output_name_whref_latex ch z stmh sknh;
		    output_string ch "</span> is used to reduce to the case with one fewer elements.\n"
		| (y::yr) ->
		    output_string ch "  If ";
		    output_string ch (string_of_int i);
		    if i = 1 then
		      output_string ch " element is "
		    else
		      output_string ch " elements are ";
		    output_string ch " given, then <span class='ltree'>";
		    output_name_whref_latex ch z stmh sknh;
		    output_string ch "</span> is used to form the corresponding term.";
		    setenum_notation_expl_r (i+1) y yr
	      in
	      match yl with
	      | (y::yr) ->
		  setenum_notation_expl_r 0 y yr
	      | _ ->
		  raise (Failure("Bad SetEnum notation"))
	    end
	| "SetEnum0" ->
	    begin
	      match yl with
	      | [y] ->
		  output_string ch "% <span class='ltree'>{}</span> is notation for <span class='ltree'>";
		  output_name_whref_latex ch y stmh sknh;
		  output_string ch "</span>.\n";
	      | _ ->
		  raise (Failure("Bad SetEnum0 notation"))
	    end
	| "SetEnum1" ->
	    begin
	      match yl with
	      | [y] ->
		  output_string ch "% <span class='ltree'>{<i>x</i>}</span> is notation for <span class='ltree'>";
		  output_name_whref_latex ch y stmh sknh;
		  output_string ch " <i>x</i></span>.\n";
	      | _ ->
		  raise (Failure("Bad SetEnum1 notation"))
	    end
	| "SetEnum2" ->
	    begin
	      match yl with
	      | [y] ->
		  output_string ch "% <span class='ltree'>{<i>x</i>,<i>y</i>}</span> is notation for <span class='ltree'>";
		  output_name_whref_latex ch y stmh sknh;
		  output_string ch " <i>x</i> <i>y</i></span>.\n";
	      | _ ->
		  raise (Failure("Bad SetEnum2 notation"))
	    end
	| "Nat" ->
	    begin
	      match yl with
	      | [y0;yS] ->
		  output_string ch "% Natural numbers 0,1,2,... are notation for the terms formed using <span class='ltree'>";
		  output_name_whref_latex ch y0 stmh sknh;
		  output_string ch "</span> as 0 and forming successors with <span class='ltree'>";
		  output_name_whref_latex ch yS stmh sknh;
		  output_string ch "</span>.\n"
	      | _ ->
		  raise (Failure("Bad Nat notation"))
	    end
	| "SetLam" ->
	    begin
	      match yl with
	      | [y] ->
		  output_string ch "% <span class='ltree'>&#x03bb; <i>x</i> &#x2208; <i>A</i> &#x21d2; <i>B</i></span> is notation for the set <span class='ltree'>";
		  output_name_whref_latex ch y stmh sknh;
		  output_string ch " <i>A</i> (&#x03bb; <i>x</i> : set &#x21d2; <i>B</i>)</span>.\n";
	      | _ ->
		  raise (Failure("Bad SetLam notation"))
	    end
	| "SetImplicitOp" ->
	    begin
	      match yl with
	      | [y] ->
		  output_string ch "% When <span class='ltree'><i>x</i></span> is a set, a term <span class='ltree'><i>x</i> <i>y</i></span> is notation for <span class='ltree'>";
		  output_name_whref_latex ch y stmh sknh;
		  output_string ch " <i>x</i> <i>y</i></span>.\n";
	      | _ ->
		  raise (Failure("Bad SetImplicitOp notation"))
	    end
	| _ -> raise (Failure("Unknown notation " ^ x))
      end
  | UnicodeDecl(x,ul) -> ()
  | SuperscriptDecl(x) -> (*** I should say something about notation here, but at the moment it would need to be "If x is a binder, then we write its bound variables as a superscript. If x is an infix operator, then we omit the operator and write the second argument as a superscript." ***) (** If this is wrong, fix it by hand. **)
     Printf.fprintf ch "{\\bf{Notation.}} We use superscripts as notation for the infix operator $\\inf";
     output_name_latex_code ch x;
     Printf.fprintf ch "$.\n";
  | SubscriptDecl(x) -> (*** I should say something about notation here, but at the moment it would need to be "If x is a binder, then we write its bound variables as a subscript. If x is an infix operator, then we omit the operator and write the second argument as a subscript." ***) (** If this is wrong, fix it by hand. **)
     Printf.fprintf ch "{\\bf{Notation.}} We use subscripts as notation for the infix operator $\\inf";
     output_name_latex_code ch x;
     Printf.fprintf ch "$.\n";
  | ParamDecl(x,a) ->
     Hashtbl.add globallatexname x ();
      output_string ch "{\\bf{Primitive.}} The name $";
      output_name_whrefa_latex ch x stmh sknh;
      output_string ch "$ is a term of type $";
      output_ltree_latex ch a stmh sknh;
      output_string ch "$.\n";
      (**
      begin
	if x = "In" then
	  begin
	    output_string ch "{\\bf{Notation.}} We use <span class='ltree'>&#x2208;</span>";
	    output_string ch "</span> as an infix operator with priority 500";
	    output_string ch " and no associativity";
	    output_string ch " corresponding to applying term <span class='ltree'>";
	    output_name_whrefa_latex ch x stmh sknh;
	    output_string ch "</span>. Furthermore, we may write <span class='ltree'>&#x2200; <I>x</I> &#x2208; <I>A</I>, <I>B</I></span> to mean <span class='ltree'>&#x2200; <I>x</I> : ";
	    output_name_whrefa_latex ch "set" stmh sknh;
	    output_string ch ", <I>x</I> &#x2208; <I>A</I> &#x2192; <I>B</I></span>.</div>\n";
	  end
      end;
      begin
	if x = "Subq" then
	  begin
	    output_string ch "<div class='infixdecl'><b>Notation</b>. We use <span class='ltree'>&#x2286;</span>";
	    output_string ch "</span> as an infix operator with priority 500";
	    output_string ch " and no associativity";
	    output_string ch " corresponding to applying term <span class='ltree'>";
	    output_name_whrefa_latex ch x stmh sknh;
	    output_string ch "</span>. Furthermore, we may write <span class='ltree'>&#x2200; <I>x</I> &#x2286; <I>A</I>, <I>B</I></span> to mean <span class='ltree'>&#x2200; <I>x</I> : ";
	    output_name_whrefa_latex ch "set" stmh sknh;
	    output_string ch ", <I>x</I> &#x2286; <I>A</I> &#x2192; <I>B</I></span>.</div>\n";
	  end
      end
       **)
  | ParamHash(x,h,_) -> ()
  | DefDecl(x,None,a) ->
     Hashtbl.add globallatexname x ();
     Printf.fprintf ch "\\begin{definition}\\label{def:";
     output_name_latex_code ch x;
     Printf.fprintf ch "}\nWe define $";
     output_name_whrefa_latex ch x stmh sknh;
     output_string ch "$ to be $";
     output_ltree_latex ch a stmh sknh;
     output_string ch "$.\n\\end{definition}\n";
     (**
     begin
	if x = "Subq" then
	  begin
	    output_string ch "<div class='infixdecl'><b>Notation</b>. We use <span class='ltree'>&#x2286;</span>";
	    output_string ch "</span> as an infix operator with priority 500";
	    output_string ch " and no associativity";
	    output_string ch " corresponding to applying term <span class='ltree'>";
	    output_name_whrefa_latex ch x stmh sknh;
	    output_string ch "</span>. Furthermore, we may write <span class='ltree'>&#x2200; <I>x</I> &#x2286; <I>A</I>, <I>B</I></span> to mean <span class='ltree'>&#x2200; <I>x</I> : ";
	    output_name_whrefa_latex ch "set" stmh sknh;
	    output_string ch ", <I>x</I> &#x2286; <I>A</I> &#x2192; <I>B</I></span>.</div>\n";
	  end
      end
      **)
  | DefDecl(x,Some b,a) ->
     Hashtbl.add globallatexname x ();
     Printf.fprintf ch "\\begin{definition}\\label{def:";
     output_name_latex_code ch x;
     Printf.fprintf ch "}\nWe define $";
     output_name_whrefa_latex ch x stmh sknh;
     output_string ch "$ to be $";
     output_ltree_latex ch a stmh sknh;
     output_string ch "$ of type $";
     output_ltree_latex ch b stmh sknh;
     output_string ch "$.\n\\end{definition}\n";
  | AxDecl(x,a) ->
     Hashtbl.add latexref x ("Axiom",Printf.sprintf "\\ref{ax:%s}" (latex_code x));
     Printf.fprintf ch "\\begin{axiom}\\label{ax:";
     output_name_latex_code ch x;
     Printf.fprintf ch "} $";
     output_ltree_latex ch a stmh sknh;
     output_string ch "$.\n\\end{axiom}\n";
  | ThmDecl(c,x,a) ->
     Hashtbl.add latexref x ("Theorem",Printf.sprintf "\\ref{thm:%s}" (latex_code x));
     Printf.fprintf ch "\\begin{theorem}\\label{thm:";
     output_name_latex_code ch x;
     Printf.fprintf ch "} $";
     output_ltree_latex ch a stmh sknh;
     output_string ch "$.\n\\end{theorem}\n";
     incr thmcount;
     Printf.fprintf ch "\\begin{proof}\n"

let output_pftacitem_latex ch pftac stmh sknh laststructact =
  match pftac with
  | PfStruct i when i < 4 ->
      if laststructact = 1 then
	output_string ch "{"
      else if laststructact = 2 then
	output_string ch "}\n{"
      else if laststructact = 3 then
	output_string ch "}\n";
  | PfStruct 4 -> output_string ch "{";
  | PfStruct 5 -> output_string ch "}";
  | PfStruct _ -> ()
  | Exact(a) ->
      output_string ch "Exact $";
      output_ltree_latex ch a stmh sknh;
      output_string ch "$.\n"
  | LetTac(xl,None) ->
      output_string ch "Let $";
      output_comma_names_latex ch xl;
      output_string ch "$ be given.\n"
  | LetTac(xl,Some a) ->
      output_string ch "Let $";
      output_comma_names_latex ch xl;
      output_string ch "$ of type $";
      output_ltree_latex ch a stmh sknh;
      output_string ch "$ be given.\n"
  | SetTac(x,None,a) ->
      output_string ch "Set $";
      output_string ch x;
      output_string ch "$ to be the term $";
      output_ltree_latex ch a stmh sknh;
      output_string ch "$.\n"
  | SetTac(x,Some(b),a) ->
      output_string ch "Set $";
      output_string ch x;
      output_string ch "$ to be the term $";
      output_ltree_latex ch a stmh sknh;
      output_string ch "$ of type $";
      output_ltree_latex ch b stmh sknh;
      output_string ch "$.\n"
  | AssumeTac(xl,None) ->
      output_string ch "Assume $";
      output_names_latex ch xl;
      output_string ch "$.\n"
  | AssumeTac(xl,Some a) ->
      output_string ch "Assume $";
      output_names_latex ch xl;
      output_string ch "$: $";
      output_ltree_latex ch a stmh sknh;
      output_string ch "$.\n"
  | ApplyTac(a) ->
      output_string ch "Apply $";
      output_ltree_latex ch a stmh sknh;
      output_string ch "$ to the current goal.\n"
  | ClaimTac(x,a) ->
      output_string ch "We prove the intermediate claim $";
      output_name_latex ch x;
      output_string ch "$: $";
      output_ltree_latex ch a stmh sknh;
      output_string ch "$.\n"
  | ProveTac(a,bl) ->
      output_string ch "We will prove $";
      output_ltree_latex ch a stmh sknh;
      List.iter (fun b ->
	output_string ch ", ";
	output_ltree_latex ch b stmh sknh)
	bl;
      output_string ch "$.\n"
  | CasesTac(a,cl) ->
      raise (Failure("Cases tactic not yet implemented"))
  | WitnessTac(a) ->
      output_string ch "We use $";
      output_ltree_latex ch a stmh sknh;
      output_string ch "$ to witness the existential quantifier.\n";
  | RewriteTac(s,a,il) ->
      output_string ch "Rewrite the current goal using $";
      output_ltree_latex ch a stmh sknh;
      output_string ch "$";
      if s then
	output_string ch " (from right to left)"
      else
	output_string ch " (from left to right)";
      begin
	match il with
	| [] -> ()
	| [i] ->
	    output_string ch " at position ";
	    output_string ch (string_of_int i);
	| (i::j::kl) ->
	    output_string ch " at positions ";
	    let rec posl i j kl =
	      match kl with
	      | k::kr ->
		  output_string ch (string_of_int i);
		  output_string ch ", ";
		  posl j k kr
	      | [] ->
		  output_string ch (string_of_int i);
		  output_string ch " and ";
		  output_string ch (string_of_int j)
	    in
	    posl i j kl
      end;
      output_string ch ".\n"
  | SpecialTac(x,[]) -> Printf.fprintf ch "Use %s.\n" x
  | SpecialTac(x,y::yl) ->
     Printf.fprintf ch "Use %s with " x;
     output_comma_list_str ch (fun a -> output_ltree_latex ch a stmh sknh) y yl;
     Printf.fprintf ch ".\n";
  | Qed ->
     Printf.fprintf ch "\\end{proof}\n\n"
  | Admitted ->
     Printf.fprintf ch "{\\it{Proof unfinished.}}\n\\end{proof}\n\n"
  | Admit ->
     Printf.fprintf ch "{\\it{Subproof unfinished.}}\n"

let rec tp_pfgset_str a =
  match a with
  | TpVar(j) -> raise (Failure (Printf.sprintf "no polymorphism allowed in pfg: tp %d" j))
  | Prop -> "Prop"
  | Set -> "set"
  | Ar(a,b) -> Printf.sprintf "TpArr %s %s" (tp_pfgset_str a) (tp_pfgset_str b)

let rec tp_pfgsyn_str a =
  match a with
  | TpVar(j) -> raise (Failure (Printf.sprintf "no polymorphism allowed in pfg: tp %d" j))
  | Prop -> "Prop"
  | Set -> "syn"
  | Ar(a,b) -> Printf.sprintf "TpArr %s %s" (tp_pfgsyn_str a) (tp_pfgsyn_str b)

let tp_pfg_str a =
  match !pfgtheory with
  | HF -> tp_pfgset_str a
  | Egal -> tp_pfgset_str a
  | Mizar -> tp_pfgset_str a
  | HOAS -> tp_pfgsyn_str a

let pfgvarcount = ref 0
let pfghypcount = ref 0
let pfgtmh : (string,string) Hashtbl.t = Hashtbl.create 100
let pfgtmhh : (string,Hash.hashval) Hashtbl.t = Hashtbl.create 100
let pfgknh : (string,string) Hashtbl.t = Hashtbl.create 100
let pfgknhh : (string,Hash.hashval) Hashtbl.t = Hashtbl.create 100
let pfgbvarh : (tm,string) Hashtbl.t = Hashtbl.create 100
let pfgpfbvarh : (pf,string) Hashtbl.t = Hashtbl.create 100
let pfghyph : (pf,string) Hashtbl.t = Hashtbl.create 100

let pfgex (a,m) = Mathdatapfg.Ex(a,Mathdatapfg.Ap(Mathdatapfg.uptrm m 0 1,Mathdatapfg.DB(0)))
let pfgeq (a,m,n) = Mathdatapfg.Eq(a,m,n)
  
let rec to_mathdatapfghf_tm m =
  match m with
  | DB(i) -> Mathdatapfg.DB(i)
  | TmH(h) ->
     begin
       try
         Mathdatapfg.Prim(Hashtbl.find pfghfprim h)
       with Not_found ->
         (try Mathdatapfg.TmH(Hashtbl.find pfgtmhh h) with Not_found -> raise (Failure (Printf.sprintf "Could not find corresponding obj id for TmH(%s)\n" h)))
     end
  | Prim(j) ->
     begin
       try
         let s = List.nth ["Eps";"In";"Empty";"Union";"Power";"Repl";"UnivOf"] j in
         if (s = "Eps" || s = "UnivOf") then raise (Failure "disallowed prims for pfg hf");
         if s = "In" then
           Mathdatapfg.Prim(7)
         else if s = "Empty" then
           Mathdatapfg.Prim(9)
         else if s = "Union" then
           Mathdatapfg.Prim(10)
         else if s = "Power" then
           Mathdatapfg.Prim(11)
         else if s = "Repl" then
           Mathdatapfg.Prim(12)
         else
           raise (Failure "disallowed prims for pfg hf")
       with _ -> raise (Failure (Printf.sprintf "bad prim %d case for pfg hf" j))
     end
  | Ap(TpAp(TmH(h),a1),m1) when h = "912ad2cdc2d23bb8aa0a5070945f2a90976a948b0e8308917244591f3747f099" ->
     pfgex(to_mathdatapfghf_tp a1,to_mathdatapfghf_tm m1)
  | TpAp(TmH(h),a) when h = "5a6af35fb6d6bea477dd0f822b8e01ca0d57cc50dfd41744307bc94597fdaa4a" ->
     let a1 = to_mathdatapfghf_tp a in
     Mathdatapfg.Lam(a1,Mathdatapfg.Lam(a1,pfgeq(a1,Mathdatapfg.DB 1,Mathdatapfg.DB 0)))
  | Ap(TpAp(TmH(h),a),m1) when h = "5a6af35fb6d6bea477dd0f822b8e01ca0d57cc50dfd41744307bc94597fdaa4a" ->
     let a1 = to_mathdatapfghf_tp a in
     Mathdatapfg.Lam(a1,pfgeq(a1,to_mathdatapfghf_tm (tmshift 0 1 m1),Mathdatapfg.DB 0))
  | Ap(Ap(TpAp(TmH(h),a),m1),m2) when h = "5a6af35fb6d6bea477dd0f822b8e01ca0d57cc50dfd41744307bc94597fdaa4a" ->
     pfgeq(to_mathdatapfghf_tp a,to_mathdatapfghf_tm m1,to_mathdatapfghf_tm m2)
  | TpAp(TmH(h),a) when h = "7966a66a9bb198103c2a540ccd5ebebdff33c10843cc10eebfc98715e142989c" ->
     let a1 = to_mathdatapfghf_tp a in
     Mathdatapfg.Lam(a1,Mathdatapfg.Lam(a1,Mathdatapfg.Ap(Mathdatapfg.Prim(3),pfgeq(a1,Mathdatapfg.DB 1,Mathdatapfg.DB 0))))
  | Ap(TpAp(TmH(h),a),m1) when h = "7966a66a9bb198103c2a540ccd5ebebdff33c10843cc10eebfc98715e142989c" ->
     let a1 = to_mathdatapfghf_tp a in
     Mathdatapfg.Lam(a1,Mathdatapfg.Ap(Mathdatapfg.Prim(3),pfgeq(a1,to_mathdatapfghf_tm (tmshift 0 1 m1),Mathdatapfg.DB 0)))
  | Ap(Ap(TpAp(TmH(h),a),m1),m2) when h = "7966a66a9bb198103c2a540ccd5ebebdff33c10843cc10eebfc98715e142989c" ->
     Mathdatapfg.Ap(Mathdatapfg.Prim(3),pfgeq(to_mathdatapfghf_tp a,to_mathdatapfghf_tm m1,to_mathdatapfghf_tm m2))
  | TpAp(_,_) -> raise (Failure (Printf.sprintf "no polymorphism allowed in pfg: tm_pfghf %s" (tm_to_str m)))
  | Ap(m,n) -> Mathdatapfg.Ap(to_mathdatapfghf_tm m,to_mathdatapfghf_tm n)
  | Lam(a,m) -> Mathdatapfg.Lam(to_mathdatapfghf_tp a,to_mathdatapfghf_tm m)
  | Imp(m,n) -> Mathdatapfg.Imp(to_mathdatapfghf_tm m,to_mathdatapfghf_tm n)
  | All(a,m) -> Mathdatapfg.All(to_mathdatapfghf_tp a,to_mathdatapfghf_tm m)

let rec to_mathdatapfgegal_tm m =
  match m with
  | DB(i) -> Mathdatapfg.DB(i)
  | TmH(h) ->
     begin
       try
         Mathdatapfg.Prim(Hashtbl.find pfgegalprim h)
       with Not_found ->
         (try Mathdatapfg.TmH(Hashtbl.find pfgtmhh h) with Not_found -> raise (Failure (Printf.sprintf "Could not find corresponding obj id for TmH(%s)\n" h)))
     end
  | Prim(j) when j > 0 -> Mathdatapfg.Prim(j)
  | Prim(j) -> raise (Failure (Printf.sprintf "bad prim %d case for pfg egal" j))
  | Ap(TpAp(TmH(h),a1),m1) when h = "912ad2cdc2d23bb8aa0a5070945f2a90976a948b0e8308917244591f3747f099" ->
     pfgex(to_mathdatapfgegal_tp a1,to_mathdatapfgegal_tm m1)
  | TpAp(TmH(h),a) when h = "5a6af35fb6d6bea477dd0f822b8e01ca0d57cc50dfd41744307bc94597fdaa4a" ->
     let a1 = to_mathdatapfgegal_tp a in
     Mathdatapfg.Lam(a1,Mathdatapfg.Lam(a1,pfgeq(a1,Mathdatapfg.DB 1,Mathdatapfg.DB 0)))
  | Ap(TpAp(TmH(h),a),m1) when h = "5a6af35fb6d6bea477dd0f822b8e01ca0d57cc50dfd41744307bc94597fdaa4a" ->
     let a1 = to_mathdatapfgegal_tp a in
     Mathdatapfg.Lam(a1,pfgeq(a1,to_mathdatapfgegal_tm (tmshift 0 1 m1),Mathdatapfg.DB 0))
  | Ap(Ap(TpAp(TmH(h),a),m1),m2) when h = "5a6af35fb6d6bea477dd0f822b8e01ca0d57cc50dfd41744307bc94597fdaa4a" ->
     pfgeq(to_mathdatapfgegal_tp a,to_mathdatapfgegal_tm m1,to_mathdatapfgegal_tm m2)
  | TpAp(TmH(h),a) when h = "7966a66a9bb198103c2a540ccd5ebebdff33c10843cc10eebfc98715e142989c" ->
     let a1 = to_mathdatapfgegal_tp a in
     Mathdatapfg.Lam(a1,Mathdatapfg.Lam(a1,Mathdatapfg.Imp(pfgeq(a1,Mathdatapfg.DB 1,Mathdatapfg.DB 0),Mathdatapfg.All(Mathdatapfg.Prop,Mathdatapfg.DB(0)))))
  | Ap(TpAp(TmH(h),a),m1) when h = "7966a66a9bb198103c2a540ccd5ebebdff33c10843cc10eebfc98715e142989c" ->
     let a1 = to_mathdatapfgegal_tp a in
     Mathdatapfg.Lam(a1,Mathdatapfg.Imp(pfgeq(a1,to_mathdatapfgegal_tm (tmshift 0 1 m1),Mathdatapfg.DB 0),Mathdatapfg.All(Mathdatapfg.Prop,Mathdatapfg.DB(0))))
  | Ap(Ap(TpAp(TmH(h),a),m1),m2) when h = "7966a66a9bb198103c2a540ccd5ebebdff33c10843cc10eebfc98715e142989c" ->
     Mathdatapfg.Imp(pfgeq(to_mathdatapfgegal_tp a,to_mathdatapfgegal_tm m1,to_mathdatapfgegal_tm m2),Mathdatapfg.All(Mathdatapfg.Prop,Mathdatapfg.DB(0)))
  | TpAp(_,_) -> raise (Failure (Printf.sprintf "no polymorphism allowed in pfg: tm_pfgegal %s" (tm_to_str m)))
  | Ap(m,n) -> Mathdatapfg.Ap(to_mathdatapfgegal_tm m,to_mathdatapfgegal_tm n)
  | Lam(a,m) -> Mathdatapfg.Lam(to_mathdatapfgegal_tp a,to_mathdatapfgegal_tm m)
  | Imp(m,n) -> Mathdatapfg.Imp(to_mathdatapfgegal_tm m,to_mathdatapfgegal_tm n)
  | All(a,m) -> Mathdatapfg.All(to_mathdatapfgegal_tp a,to_mathdatapfgegal_tm m)

let rec to_mathdatapfgmiz_tm m =
  match m with
  | DB(i) -> Mathdatapfg.DB(i)
  | TmH(h) ->
     begin
       try
         Mathdatapfg.Prim(Hashtbl.find pfgmizprim h)
       with Not_found ->
         (try Mathdatapfg.TmH(Hashtbl.find pfgtmhh h) with Not_found -> raise (Failure (Printf.sprintf "Could not find corresponding obj id for TmH(%s)\n" h)))
     end
  | Prim(j) when j = 1 || j = 3 -> Mathdatapfg.Prim(j)
  | Prim(j) -> raise (Failure (Printf.sprintf "bad prim %d case for pfg miz" j))
  | Ap(TpAp(TmH(h),a1),m1) when h = "912ad2cdc2d23bb8aa0a5070945f2a90976a948b0e8308917244591f3747f099" ->
     pfgex(to_mathdatapfgmiz_tp a1,to_mathdatapfgmiz_tm m1)
  | TpAp(TmH(h),a) when h = "5a6af35fb6d6bea477dd0f822b8e01ca0d57cc50dfd41744307bc94597fdaa4a" ->
     let a1 = to_mathdatapfgmiz_tp a in
     Mathdatapfg.Lam(a1,Mathdatapfg.Lam(a1,pfgeq(a1,Mathdatapfg.DB 1,Mathdatapfg.DB 0)))
  | Ap(TpAp(TmH(h),a),m1) when h = "5a6af35fb6d6bea477dd0f822b8e01ca0d57cc50dfd41744307bc94597fdaa4a" ->
     let a1 = to_mathdatapfgmiz_tp a in
     Mathdatapfg.Lam(a1,pfgeq(a1,to_mathdatapfgmiz_tm (tmshift 0 1 m1),Mathdatapfg.DB 0))
  | Ap(Ap(TpAp(TmH(h),a),m1),m2) when h = "5a6af35fb6d6bea477dd0f822b8e01ca0d57cc50dfd41744307bc94597fdaa4a" ->
     pfgeq(to_mathdatapfgmiz_tp a,to_mathdatapfgmiz_tm m1,to_mathdatapfgmiz_tm m2)
  | TpAp(TmH(h),a) when h = "7966a66a9bb198103c2a540ccd5ebebdff33c10843cc10eebfc98715e142989c" ->
     let a1 = to_mathdatapfgmiz_tp a in
     Mathdatapfg.Lam(a1,Mathdatapfg.Lam(a1,Mathdatapfg.Imp(pfgeq(a1,Mathdatapfg.DB 1,Mathdatapfg.DB 0),Mathdatapfg.All(Mathdatapfg.Prop,Mathdatapfg.DB(0)))))
  | Ap(TpAp(TmH(h),a),m1) when h = "7966a66a9bb198103c2a540ccd5ebebdff33c10843cc10eebfc98715e142989c" ->
     let a1 = to_mathdatapfgmiz_tp a in
     Mathdatapfg.Lam(a1,Mathdatapfg.Imp(pfgeq(a1,to_mathdatapfgmiz_tm (tmshift 0 1 m1),Mathdatapfg.DB 0),Mathdatapfg.All(Mathdatapfg.Prop,Mathdatapfg.DB(0))))
  | Ap(Ap(TpAp(TmH(h),a),m1),m2) when h = "7966a66a9bb198103c2a540ccd5ebebdff33c10843cc10eebfc98715e142989c" ->
     Mathdatapfg.Imp(pfgeq(to_mathdatapfgmiz_tp a,to_mathdatapfgmiz_tm m1,to_mathdatapfgmiz_tm m2),Mathdatapfg.All(Mathdatapfg.Prop,Mathdatapfg.DB(0)))
  | TpAp(_,_) -> raise (Failure (Printf.sprintf "no polymorphism allowed in pfg: tm_pfgmiz %s" (tm_to_str m)))
  | Ap(m,n) -> Mathdatapfg.Ap(to_mathdatapfgmiz_tm m,to_mathdatapfgmiz_tm n)
  | Lam(a,m) -> Mathdatapfg.Lam(to_mathdatapfgmiz_tp a,to_mathdatapfgmiz_tm m)
  | Imp(m,n) -> Mathdatapfg.Imp(to_mathdatapfgmiz_tm m,to_mathdatapfgmiz_tm n)
  | All(a,m) -> Mathdatapfg.All(to_mathdatapfgmiz_tp a,to_mathdatapfgmiz_tm m)

let rec to_mathdatapfghoas_tm m =
  match m with
  | DB(i) -> Mathdatapfg.DB(i)
  | TmH(h) ->
     begin
       try
         Mathdatapfg.Prim(Hashtbl.find pfghoasprim h)
       with Not_found ->
         (try Mathdatapfg.TmH(Hashtbl.find pfgtmhh h) with Not_found -> raise (Failure (Printf.sprintf "Could not find corresponding obj id for TmH(%s)\n" h)))
     end
  | Prim(j) -> raise (Failure (Printf.sprintf "bad prim %d case for pfg hoas" j))
  | Ap(TpAp(TmH(h),a1),m1) when h = "912ad2cdc2d23bb8aa0a5070945f2a90976a948b0e8308917244591f3747f099" ->
     pfgex(to_mathdatapfghoas_tp a1,to_mathdatapfghoas_tm m1)
  | TpAp(TmH(h),a) when h = "5a6af35fb6d6bea477dd0f822b8e01ca0d57cc50dfd41744307bc94597fdaa4a" ->
     let a1 = to_mathdatapfghoas_tp a in
     Mathdatapfg.Lam(a1,Mathdatapfg.Lam(a1,pfgeq(a1,Mathdatapfg.DB 1,Mathdatapfg.DB 0)))
  | Ap(TpAp(TmH(h),a),m1) when h = "5a6af35fb6d6bea477dd0f822b8e01ca0d57cc50dfd41744307bc94597fdaa4a" ->
     let a1 = to_mathdatapfghoas_tp a in
     Mathdatapfg.Lam(a1,pfgeq(a1,to_mathdatapfghoas_tm (tmshift 0 1 m1),Mathdatapfg.DB 0))
  | Ap(Ap(TpAp(TmH(h),a),m1),m2) when h = "5a6af35fb6d6bea477dd0f822b8e01ca0d57cc50dfd41744307bc94597fdaa4a" ->
     pfgeq(to_mathdatapfghoas_tp a,to_mathdatapfghoas_tm m1,to_mathdatapfghoas_tm m2)
  | TpAp(TmH(h),a) when h = "7966a66a9bb198103c2a540ccd5ebebdff33c10843cc10eebfc98715e142989c" ->
     let a1 = to_mathdatapfghoas_tp a in
     Mathdatapfg.Lam(a1,Mathdatapfg.Lam(a1,Mathdatapfg.Imp(pfgeq(a1,Mathdatapfg.DB 1,Mathdatapfg.DB 0),Mathdatapfg.All(Mathdatapfg.Prop,Mathdatapfg.DB(0)))))
  | Ap(TpAp(TmH(h),a),m1) when h = "7966a66a9bb198103c2a540ccd5ebebdff33c10843cc10eebfc98715e142989c" ->
     let a1 = to_mathdatapfghoas_tp a in
     Mathdatapfg.Lam(a1,Mathdatapfg.Imp(pfgeq(a1,to_mathdatapfgmiz_tm (tmshift 0 1 m1),Mathdatapfg.DB 0),Mathdatapfg.All(Mathdatapfg.Prop,Mathdatapfg.DB(0))))
  | Ap(Ap(TpAp(TmH(h),a),m1),m2) when h = "7966a66a9bb198103c2a540ccd5ebebdff33c10843cc10eebfc98715e142989c" ->
     Mathdatapfg.Imp(pfgeq(to_mathdatapfgmiz_tp a,to_mathdatapfgmiz_tm m1,to_mathdatapfgmiz_tm m2),Mathdatapfg.All(Mathdatapfg.Prop,Mathdatapfg.DB(0)))
  | TpAp(_,_) -> raise (Failure (Printf.sprintf "no polymorphism allowed in pfg: tm_pfghf %s" (tm_to_str m)))
  | Ap(m,n) -> Mathdatapfg.Ap(to_mathdatapfghoas_tm m,to_mathdatapfghoas_tm n)
  | Lam(a,m) -> Mathdatapfg.Lam(to_mathdatapfghoas_tp a,to_mathdatapfghoas_tm m)
  | Imp(m,n) -> Mathdatapfg.Imp(to_mathdatapfghoas_tm m,to_mathdatapfghoas_tm n)
  | All(a,m) -> Mathdatapfg.All(to_mathdatapfghoas_tp a,to_mathdatapfghoas_tm m)
                               
let to_mathdatapfg_tm m =
  match !pfgtheory with
  | HF -> to_mathdatapfghf_tm m
  | Egal -> to_mathdatapfgegal_tm m
  | Mizar -> to_mathdatapfgmiz_tm m
  | HOAS -> to_mathdatapfghoas_tm m

let rec to_mathdatapfg_ptm_all i m =
  if i > 0 then
    raise (Failure "no poly in pfg")
  else
    to_mathdatapfg_tm m

let pfgthyid () =
  match !pfgtheory with
  | HF -> Some(hfthyid)
  | Egal -> Some(egalthyid)
  | Mizar -> Some(mizarthyid)
  | HOAS -> Some(hoasthyid)

let pfg_propid m =
  let m2 = to_mathdatapfg_ptm_all 0 (tm_beta_eta_norm m) in
  let (m3,b) = Mathdatapfg.beta_eta_norm m2 20 in
  if b then
    let h = Mathdatapfg.tm_hashroot m3 in
    Hash.hashtag (Hash.hashopair2 (pfgthyid()) h) 33l
  else
    raise (Failure "norm problem in pfg_propid")

let pfg_objid_pure_to_thy h a =
  let ah = Mathdatapfg.hashtp (to_mathdatapfg_tp a) in
  Hash.hashtag (Hash.hashopair2 (pfgthyid()) (Hash.hashpair h ah)) 32l

let pfg_objid m a =
  let m2 = to_mathdatapfg_ptm_all 0 (tm_beta_eta_norm m) in
  let (m3,b) = Mathdatapfg.beta_eta_norm m2 20 in
  if b then
    let mh = Mathdatapfg.tm_hashroot m3 in
    (mh,pfg_objid_pure_to_thy mh a)
  else
    raise (Failure "norm problem in pfg_objid")

let rec tm_pfghf_str_r m phi =
  match m with
  | DB(j) -> List.nth phi j
  | TmH(h) ->
     begin
       try
         Printf.sprintf "Prim %d" (Hashtbl.find pfghfprim h)
       with Not_found ->
         (try Hashtbl.find pfgtmh h with Not_found -> Printf.sprintf "#%s" h)
     end
  | Prim(j) ->
     begin
       try
         let s = List.nth ["Eps";"In";"Empty";"Union";"Power";"Repl";"UnivOf"] j in
         if (s = "Eps" || s = "UnivOf") then raise (Failure "disallowed prims for pfg hf");
         if s = "In" then
           "Prim 7"
         else if s = "Empty" then
           "Prim 9"
         else if s = "Union" then
           "Prim 10"
         else if s = "Power" then
           "Prim 11"
         else if s = "Repl" then
           "Prim 12"
         else
           raise (Failure "disallowed prims for pfg hf")
       with _ -> raise (Failure (Printf.sprintf "bad prim %d case for pfg hf" j))
     end
  | Ap(TpAp(TmH(h),a1),Lam(_,m1)) when h = "912ad2cdc2d23bb8aa0a5070945f2a90976a948b0e8308917244591f3747f099" ->
     let x =
       if free_in_tm_p m1 0 then
	 begin
	   try
	     Hashtbl.find pfgbvarh m
	   with Not_found ->
	     incr pfgvarcount;
	     Printf.sprintf "x%d" !pfgvarcount
	 end
       else
	 "_"
     in
     Printf.sprintf "Ex %s %s %s" x (tp_pfgset_str a1) (tm_pfghf_str_r m1 (x::phi))
  | Ap(TpAp(TmH(h),a1),m1) when h = "912ad2cdc2d23bb8aa0a5070945f2a90976a948b0e8308917244591f3747f099" ->
     let x =
       begin
	 try
	   let z = Hashtbl.find pfgbvarh m in
           if Hashtbl.mem pfgreserved z then raise Not_found;
           if List.mem z phi then raise Not_found;
           z
	 with Not_found ->
	   incr pfgvarcount;
	   Printf.sprintf "x%d" !pfgvarcount
       end
     in
     Printf.sprintf "Ex %s %s Ap %s %s" x (tp_pfgset_str a1) (tm_pfghf_str_r m1 phi) x
  | Ap(Ap(TpAp(TmH(h),a),m1),m2) when h = "5a6af35fb6d6bea477dd0f822b8e01ca0d57cc50dfd41744307bc94597fdaa4a" ->
     Printf.sprintf "Eq %s %s %s" (tp_pfgset_str a) (tm_pfghf_str_r m1 phi) (tm_pfghf_str_r m2 phi)
  | Ap(Ap(TpAp(TmH(h),a),m1),m2) when h = "7966a66a9bb198103c2a540ccd5ebebdff33c10843cc10eebfc98715e142989c" ->
     Printf.sprintf "Ap Prim 3 Eq %s %s %s" (tp_pfgset_str a) (tm_pfghf_str_r m1 phi) (tm_pfghf_str_r m2 phi)
  | TpAp(_,a) -> raise (Failure (Printf.sprintf "no polymorphism allowed in pfg: tm_pfghf %s" (tm_to_str m)))
  | Ap(m1,m2) -> Printf.sprintf "Ap %s %s" (tm_pfghf_str_r m1 phi) (tm_pfghf_str_r m2 phi)
  | Imp(m1,m2) -> Printf.sprintf "Imp %s %s" (tm_pfghf_str_r m1 phi) (tm_pfghf_str_r m2 phi)
  | All(a1,m1) ->
      begin
	let x =
	  if free_in_tm_p m1 0 then
	    begin
	      try
	        let z = Hashtbl.find pfgbvarh m in
                if Hashtbl.mem pfgreserved z then raise Not_found;
                if List.mem z phi then raise Not_found;
                z
	      with Not_found ->
		incr pfgvarcount;
		Printf.sprintf "x%d" !pfgvarcount
	    end
	  else
	    "_"
	in
	Printf.sprintf "All %s %s %s" x (tp_pfgset_str a1) (tm_pfghf_str_r m1 (x::phi))
      end
  | Lam(a1,m1) ->
      begin
	let x =
	  if free_in_tm_p m1 0 then
	    begin
	      try
	        let z = Hashtbl.find pfgbvarh m in
                if Hashtbl.mem pfgreserved z then raise Not_found;
                if List.mem z phi then raise Not_found;
                z
	      with Not_found ->
		incr pfgvarcount;
		Printf.sprintf "x%d" !pfgvarcount
	    end
	  else
	    "_"
	in
	Printf.sprintf "Lam %s %s %s" x (tp_pfgset_str a1) (tm_pfghf_str_r m1 (x::phi))
      end

let rec tm_pfgegal_str_r m phi =
  match m with
  | DB(j) -> List.nth phi j
  | TmH(h) ->
     begin
       try
         Printf.sprintf "Prim %d" (Hashtbl.find pfgegalprim h)
       with Not_found ->
         (try Hashtbl.find pfgtmh h with Not_found -> Printf.sprintf "#%s" h)
     end
  | Prim(j) when j > 0 -> Printf.sprintf "Prim %d" j
  | Prim(j) -> raise (Failure (Printf.sprintf "bad prim %d case for pfg egal" j))
  | Ap(TpAp(TmH(h),a1),Lam(_,m1)) when h = "912ad2cdc2d23bb8aa0a5070945f2a90976a948b0e8308917244591f3747f099" ->
     let x =
       if free_in_tm_p m1 0 then
	 begin
	   try
	     let z = Hashtbl.find pfgbvarh m in
             if Hashtbl.mem pfgreserved z then raise Not_found;
             if List.mem z phi then raise Not_found;
             z
	   with Not_found ->
	     incr pfgvarcount;
	     Printf.sprintf "x%d" !pfgvarcount
	 end
       else
	 "_"
     in
     Printf.sprintf "Ex %s %s %s" x (tp_pfgset_str a1) (tm_pfgegal_str_r m1 (x::phi))
  | Ap(TpAp(TmH(h),a1),m1) when h = "912ad2cdc2d23bb8aa0a5070945f2a90976a948b0e8308917244591f3747f099" ->
     let x =
       begin
	 try
	   let z = Hashtbl.find pfgbvarh m in
           if Hashtbl.mem pfgreserved z then raise Not_found;
           if List.mem z phi then raise Not_found;
           z
	 with Not_found ->
	   incr pfgvarcount;
	   Printf.sprintf "x%d" !pfgvarcount
       end
     in
     Printf.sprintf "Ex %s %s Ap %s %s" x (tp_pfgset_str a1) (tm_pfgegal_str_r m1 phi) x
  | Ap(Ap(TpAp(TmH(h),a),m1),m2) when h = "5a6af35fb6d6bea477dd0f822b8e01ca0d57cc50dfd41744307bc94597fdaa4a" ->
     Printf.sprintf "Eq %s %s %s" (tp_pfgset_str a) (tm_pfgegal_str_r m1 phi) (tm_pfgegal_str_r m2 phi)
  | Ap(Ap(TpAp(TmH(h),a),m1),m2) when h = "7966a66a9bb198103c2a540ccd5ebebdff33c10843cc10eebfc98715e142989c" ->
     Printf.sprintf "Imp Eq %s %s %s All p Prop p" (tp_pfgset_str a) (tm_pfgegal_str_r m1 phi) (tm_pfgegal_str_r m2 phi)
  | TpAp(_,a) -> raise (Failure (Printf.sprintf "no polymorphism allowed in pfg: tm_pfgegal %s" (tm_to_str m)))
  | Ap(m1,m2) -> Printf.sprintf "Ap %s %s" (tm_pfgegal_str_r m1 phi) (tm_pfgegal_str_r m2 phi)
  | Imp(m1,m2) -> Printf.sprintf "Imp %s %s" (tm_pfgegal_str_r m1 phi) (tm_pfgegal_str_r m2 phi)
  | All(a1,m1) ->
      begin
	let x =
	  if free_in_tm_p m1 0 then
	    begin
	      try
	        let z = Hashtbl.find pfgbvarh m in
                if Hashtbl.mem pfgreserved z then raise Not_found;
                if List.mem z phi then raise Not_found;
                z
	      with Not_found ->
		incr pfgvarcount;
		Printf.sprintf "x%d" !pfgvarcount
	    end
	  else
	    "_"
	in
	Printf.sprintf "All %s %s %s" x (tp_pfgset_str a1) (tm_pfgegal_str_r m1 (x::phi))
      end
  | Lam(a1,m1) ->
      begin
	let x =
	  if free_in_tm_p m1 0 then
	    begin
	      try
	        let z = Hashtbl.find pfgbvarh m in
                if Hashtbl.mem pfgreserved z then raise Not_found;
                if List.mem z phi then raise Not_found;
                z
	      with Not_found ->
		incr pfgvarcount;
		Printf.sprintf "x%d" !pfgvarcount
	    end
	  else
	    "_"
	in
	Printf.sprintf "Lam %s %s %s" x (tp_pfgset_str a1) (tm_pfgegal_str_r m1 (x::phi))
      end


let rec tm_pfgmiz_str_r m phi =
  match m with
  | DB(j) -> List.nth phi j
  | TmH(h) ->
     begin
       try
         Printf.sprintf "Prim %d" (Hashtbl.find pfgmizprim h)
       with Not_found ->
         (try Hashtbl.find pfgtmh h with Not_found -> Printf.sprintf "#%s" h)
     end
  | Prim(j) when j = 1 || j = 3 -> Printf.sprintf "Prim %d" j
  | Prim(j) -> raise (Failure (Printf.sprintf "bad prim %d case for pfg miz" j))
  | Ap(TpAp(TmH(h),a1),Lam(_,m1)) when h = "912ad2cdc2d23bb8aa0a5070945f2a90976a948b0e8308917244591f3747f099" ->
     let x =
       if free_in_tm_p m1 0 then
	 begin
	   try
	     let z = Hashtbl.find pfgbvarh m in
             if Hashtbl.mem pfgreserved z then raise Not_found;
             if List.mem z phi then raise Not_found;
             z
	   with Not_found ->
	     incr pfgvarcount;
	     Printf.sprintf "x%d" !pfgvarcount
	 end
       else
	 "_"
     in
     Printf.sprintf "Ex %s %s %s" x (tp_pfgset_str a1) (tm_pfgmiz_str_r m1 (x::phi))
  | Ap(TpAp(TmH(h),a1),m1) when h = "912ad2cdc2d23bb8aa0a5070945f2a90976a948b0e8308917244591f3747f099" ->
     let x =
       begin
	 try
	   let z = Hashtbl.find pfgbvarh m in
           if Hashtbl.mem pfgreserved z then raise Not_found;
           if List.mem z phi then raise Not_found;
           z
	 with Not_found ->
	   incr pfgvarcount;
	   Printf.sprintf "x%d" !pfgvarcount
       end
     in
     Printf.sprintf "Ex %s %s Ap %s %s" x (tp_pfgset_str a1) (tm_pfgmiz_str_r m1 phi) x
  | Ap(Ap(TpAp(TmH(h),a),m1),m2) when h = "5a6af35fb6d6bea477dd0f822b8e01ca0d57cc50dfd41744307bc94597fdaa4a" ->
     Printf.sprintf "Eq %s %s %s" (tp_pfgset_str a) (tm_pfgmiz_str_r m1 phi) (tm_pfgmiz_str_r m2 phi)
  | Ap(Ap(TpAp(TmH(h),a),m1),m2) when h = "7966a66a9bb198103c2a540ccd5ebebdff33c10843cc10eebfc98715e142989c" ->
     Printf.sprintf "Imp Eq %s %s %s All p Prop p" (tp_pfgset_str a) (tm_pfgmiz_str_r m1 phi) (tm_pfgmiz_str_r m2 phi)
  | TpAp(_,a) -> raise (Failure (Printf.sprintf "no polymorphism allowed in pfg: tm_pfgmiz %s" (tm_to_str m)))
  | Ap(m1,m2) -> Printf.sprintf "Ap %s %s" (tm_pfgmiz_str_r m1 phi) (tm_pfgmiz_str_r m2 phi)
  | Imp(m1,m2) -> Printf.sprintf "Imp %s %s" (tm_pfgmiz_str_r m1 phi) (tm_pfgmiz_str_r m2 phi)
  | All(a1,m1) ->
      begin
	let x =
	  if free_in_tm_p m1 0 then
	    begin
	      try
	        let z = Hashtbl.find pfgbvarh m in
                if Hashtbl.mem pfgreserved z then raise Not_found;
                if List.mem z phi then raise Not_found;
                z
	      with Not_found ->
		incr pfgvarcount;
		Printf.sprintf "x%d" !pfgvarcount
	    end
	  else
	    "_"
	in
	Printf.sprintf "All %s %s %s" x (tp_pfgset_str a1) (tm_pfgmiz_str_r m1 (x::phi))
      end
  | Lam(a1,m1) ->
      begin
	let x =
	  if free_in_tm_p m1 0 then
	    begin
	      try
	        let z = Hashtbl.find pfgbvarh m in
                if Hashtbl.mem pfgreserved z then raise Not_found;
                if List.mem z phi then raise Not_found;
                z
	      with Not_found ->
		incr pfgvarcount;
		Printf.sprintf "x%d" !pfgvarcount
	    end
	  else
	    "_"
	in
	Printf.sprintf "Lam %s %s %s" x (tp_pfgset_str a1) (tm_pfgmiz_str_r m1 (x::phi))
      end

let rec tm_pfghoas_str_r m phi =
  match m with
  | DB(j) -> List.nth phi j
  | TmH(h) ->
     begin
       try
         Printf.sprintf "Prim %d" (Hashtbl.find pfghoasprim h)
       with Not_found ->
         (try Hashtbl.find pfgtmh h with Not_found -> Printf.sprintf "#%s" h)
     end
  | Prim(j) when j = 0 || j = 1 -> Printf.sprintf "Prim %d" j
  | Prim(j) -> raise (Failure (Printf.sprintf "bad prim %d case for pfg hoas" j))
  | Ap(TpAp(TmH(h),a1),Lam(_,m1)) when h = "912ad2cdc2d23bb8aa0a5070945f2a90976a948b0e8308917244591f3747f099" ->
     let x =
       if free_in_tm_p m1 0 then
	 begin
	   try
	     let z = Hashtbl.find pfgbvarh m in
             if Hashtbl.mem pfgreserved z then raise Not_found;
             if List.mem z phi then raise Not_found;
             z
	   with Not_found ->
	     incr pfgvarcount;
	     Printf.sprintf "x%d" !pfgvarcount
	 end
       else
	 "_"
     in
     Printf.sprintf "Ex %s %s %s" x (tp_pfgsyn_str a1) (tm_pfghoas_str_r m1 (x::phi))
  | Ap(TpAp(TmH(h),a1),m1) when h = "912ad2cdc2d23bb8aa0a5070945f2a90976a948b0e8308917244591f3747f099" ->
     let x =
       begin
	 try
	   let z = Hashtbl.find pfgbvarh m in
           if Hashtbl.mem pfgreserved z then raise Not_found;
           if List.mem z phi then raise Not_found;
           z
	 with Not_found ->
	   incr pfgvarcount;
	   Printf.sprintf "x%d" !pfgvarcount
       end
     in
     Printf.sprintf "Ex %s %s Ap %s %s" x (tp_pfgsyn_str a1) (tm_pfghoas_str_r m1 phi) x
  | Ap(Ap(TpAp(TmH(h),a),m1),m2) when h = "5a6af35fb6d6bea477dd0f822b8e01ca0d57cc50dfd41744307bc94597fdaa4a" ->
     Printf.sprintf "Eq %s %s %s" (tp_pfgsyn_str a) (tm_pfghoas_str_r m1 phi) (tm_pfghoas_str_r m2 phi)
  | Ap(Ap(TpAp(TmH(h),a),m1),m2) when h = "7966a66a9bb198103c2a540ccd5ebebdff33c10843cc10eebfc98715e142989c" ->
     Printf.sprintf "Imp Eq %s %s %s All p Prop p" (tp_pfgsyn_str a) (tm_pfghoas_str_r m1 phi) (tm_pfghoas_str_r m2 phi)
  | TpAp(_,a) -> raise (Failure (Printf.sprintf "no polymorphism allowed in pfg: tm_pfghoas %s" (tm_to_str m)))
  | Ap(m1,m2) -> Printf.sprintf "Ap %s %s" (tm_pfghoas_str_r m1 phi) (tm_pfghoas_str_r m2 phi)
  | Imp(m1,m2) -> Printf.sprintf "Imp %s %s" (tm_pfghoas_str_r m1 phi) (tm_pfghoas_str_r m2 phi)
  | All(a1,m1) ->
      begin
	let x =
	  if free_in_tm_p m1 0 then
	    begin
	      try
	        let z = Hashtbl.find pfgbvarh m in
                if Hashtbl.mem pfgreserved z then raise Not_found;
                if List.mem z phi then raise Not_found;
                z
	      with Not_found ->
		incr pfgvarcount;
		Printf.sprintf "x%d" !pfgvarcount
	    end
	  else
	    "_"
	in
	Printf.sprintf "All %s %s %s" x (tp_pfgsyn_str a1) (tm_pfghoas_str_r m1 (x::phi))
      end
  | Lam(a1,m1) ->
      begin
	let x =
	  if free_in_tm_p m1 0 then
	    begin
	      try
	        let z = Hashtbl.find pfgbvarh m in
                if Hashtbl.mem pfgreserved z then raise Not_found;
                if List.mem z phi then raise Not_found;
                z
	      with Not_found ->
		incr pfgvarcount;
		Printf.sprintf "x%d" !pfgvarcount
	    end
	  else
	    "_"
	in
	Printf.sprintf "Lam %s %s %s" x (tp_pfgsyn_str a1) (tm_pfghoas_str_r m1 (x::phi))
      end

let knowncnt = ref 0

let rec tm_pfghf_decl dh tmph m =
  match m with
  | TmH(h) when not (Hashtbl.mem pfgtmh h) && not (Hashtbl.mem pfghfprim h) ->
     begin
       try
         let (x,a,om) = Hashtbl.find tmph h in
         if Hashtbl.mem dh h then
           begin (** Include def for delta in some proof **)
             Hashtbl.add pfgtmh h x;
             match om with
             | Some(m) ->
                tm_pfghf_decl dh tmph m;
                Printf.printf "Def %s : %s\n := %s\n" x (tp_pfgset_str a) (tm_pfghf_str_r m [])
             | _ -> raise (Failure (Printf.sprintf "delta required for %s [%s] but do not have def" x h))
           end
         else
           begin (** No deltas needed, so just include as opaque param **)
             try
               let pfghv = Hashtbl.find pfgtmhh h in
               Hashtbl.add pfgtmh h x;
               Printf.printf "Param %s %s : %s\n" (Hash.hashval_hexstring pfghv) x (tp_pfgset_str a)
             with Not_found -> raise (Failure (Printf.sprintf "do not know pfg id corresponding to %s" h))
           end
       with Not_found -> raise (Failure (Printf.sprintf "cannot find info for %s to create pfg version" h))
     end
  | Ap(m1,m2) -> tm_pfghf_decl dh tmph m1; tm_pfghf_decl dh tmph m2
  | Lam(_,m2) -> tm_pfghf_decl dh tmph m2
  | Imp(m1,m2) -> tm_pfghf_decl dh tmph m1; tm_pfghf_decl dh tmph m2
  | All(_,m2) -> tm_pfghf_decl dh tmph m2
  | _ -> ()

let rec pf_pfghf_decl dh tmph knph d =
  match d with
  | Known(h) when not (Hashtbl.mem pfgknh h) && not (h = "5626ac8cb7c90418f6c980ffedd6f45097048659977d8690c44f9d34feb6b2d3") ->
     begin
       let p = Hashtbl.find knph h in
       tm_pfghf_decl dh tmph p;
       let nm =
         try
           Hashtbl.find pfghfknname h
         with _ -> incr knowncnt; Printf.sprintf "Known%d" !knowncnt
       in
       Printf.printf "Known %s : %s\n" nm (tm_pfghf_str_r p []);
       Hashtbl.add pfgknh h nm
     end
  | PTpAp(d1,_) -> pf_pfghf_decl dh tmph knph d1
  | PTmAp(d1,m2) -> tm_pfghf_decl dh tmph m2; pf_pfghf_decl dh tmph knph d1
  | PPfAp(d1,d2) -> pf_pfghf_decl dh tmph knph d1; pf_pfghf_decl dh tmph knph d2
  | PLam(p1,d2) -> tm_pfghf_decl dh tmph p1; pf_pfghf_decl dh tmph knph d2
  | TLam(_,d2) -> pf_pfghf_decl dh tmph knph d2
  | _ -> ()

let rec tm_pfgegal_decl dh tmph m =
  match m with
  | TmH(h) when not (Hashtbl.mem pfgtmh h) && not (Hashtbl.mem pfgegalprim h) ->
     begin
       try
         let (x,a,om) = Hashtbl.find tmph h in
         if Hashtbl.mem dh h || h = "5bf697cb0d1cdefbe881504469f6c48cc388994115b82514dfc4fb5e67ac1a87" then (** never make False opaque in Egal **)
           begin (** Include def for delta in some proof **)
             Hashtbl.add pfgtmh h x;
             match om with
             | Some(m) ->
                tm_pfgegal_decl dh tmph m;
                Printf.printf "Def %s : %s\n := %s\n" x (tp_pfgset_str a) (tm_pfgegal_str_r m [])
             | _ -> raise (Failure (Printf.sprintf "delta required for %s [%s] but do not have def" x h))
           end
         else
           begin (** No deltas needed, so just include as opaque param **)
             try
               let pfghv = Hashtbl.find pfgtmhh h in
               Hashtbl.add pfgtmh h x;
               Printf.printf "Param %s %s : %s\n" (Hash.hashval_hexstring pfghv) x (tp_pfgset_str a)
             with Not_found -> raise (Failure (Printf.sprintf "do not know pfg id corresponding to %s" h))
           end
       with Not_found -> raise (Failure (Printf.sprintf "cannot find info for %s to create pfg version" h))
     end
  | Ap(m1,m2) -> tm_pfgegal_decl dh tmph m1; tm_pfgegal_decl dh tmph m2
  | Lam(_,m2) -> tm_pfgegal_decl dh tmph m2
  | Imp(m1,m2) -> tm_pfgegal_decl dh tmph m1; tm_pfgegal_decl dh tmph m2
  | All(_,m2) -> tm_pfgegal_decl dh tmph m2
  | _ -> ()

let rec tm_pfgmiz_decl dh tmph m =
  match m with
  | TmH(h) when not (Hashtbl.mem pfgtmh h) && not (Hashtbl.mem pfgmizprim h) ->
     begin
       try
         let (x,a,om) = Hashtbl.find tmph h in
         if Hashtbl.mem dh h || h = "5bf697cb0d1cdefbe881504469f6c48cc388994115b82514dfc4fb5e67ac1a87" then (** never make False opaque in Mizar **)
           begin (** Include def for delta in some proof **)
             Hashtbl.add pfgtmh h x;
             match om with
             | Some(m) ->
                tm_pfgmiz_decl dh tmph m;
                Printf.printf "Def %s : %s\n := %s\n" x (tp_pfgset_str a) (tm_pfgmiz_str_r m [])
             | _ -> raise (Failure (Printf.sprintf "delta required for %s [%s] but do not have def" x h))
           end
         else
           begin (** No deltas needed, so just include as opaque param **)
             try
               let pfghv = Hashtbl.find pfgtmhh h in
               Hashtbl.add pfgtmh h x;
               Printf.printf "Param %s %s : %s\n" (Hash.hashval_hexstring pfghv) x (tp_pfgset_str a)
             with Not_found -> raise (Failure (Printf.sprintf "do not know pfg id corresponding to %s" h))
           end
       with Not_found -> raise (Failure (Printf.sprintf "cannot find info for %s to create pfg version" h))
     end
  | Ap(m1,m2) -> tm_pfgmiz_decl dh tmph m1; tm_pfgmiz_decl dh tmph m2
  | Lam(_,m2) -> tm_pfgmiz_decl dh tmph m2
  | Imp(m1,m2) -> tm_pfgmiz_decl dh tmph m1; tm_pfgmiz_decl dh tmph m2
  | All(_,m2) -> tm_pfgmiz_decl dh tmph m2
  | _ -> ()

let rec pf_pfgegal_decl dh tmph knph d =
  match d with
  | Known(h) when not (Hashtbl.mem pfgknh h) && not (h = "5626ac8cb7c90418f6c980ffedd6f45097048659977d8690c44f9d34feb6b2d3") ->
     begin
       let p = Hashtbl.find knph h in
       tm_pfgegal_decl dh tmph p;
       let nm =
         try
           Hashtbl.find pfgegalknname h
         with _ -> incr knowncnt; Printf.sprintf "Known%d" !knowncnt
       in
       Printf.printf "Known %s : %s\n" nm (tm_pfgegal_str_r p []);
       Hashtbl.add pfgknh h nm
     end
  | PTpAp(d1,_) -> pf_pfgegal_decl dh tmph knph d1
  | PTmAp(d1,m2) -> tm_pfgegal_decl dh tmph m2; pf_pfgegal_decl dh tmph knph d1
  | PPfAp(d1,d2) -> pf_pfgegal_decl dh tmph knph d1; pf_pfgegal_decl dh tmph knph d2
  | PLam(p1,d2) -> tm_pfgegal_decl dh tmph p1; pf_pfgegal_decl dh tmph knph d2
  | TLam(_,d2) -> pf_pfgegal_decl dh tmph knph d2
  | _ -> ()

let rec pf_pfgmiz_decl dh tmph knph d =
  match d with
  | Known(h) when not (Hashtbl.mem pfgknh h) && not (h = "5626ac8cb7c90418f6c980ffedd6f45097048659977d8690c44f9d34feb6b2d3") ->
     begin
       let p = Hashtbl.find knph h in
       tm_pfgmiz_decl dh tmph p;
       let nm =
         try
           Hashtbl.find pfgmizknname h
         with _ -> incr knowncnt; Printf.sprintf "Known%d" !knowncnt
       in
       Printf.printf "Known %s : %s\n" nm (tm_pfgmiz_str_r p []);
       Hashtbl.add pfgknh h nm
     end
  | PTpAp(d1,_) -> pf_pfgmiz_decl dh tmph knph d1
  | PTmAp(d1,m2) -> tm_pfgmiz_decl dh tmph m2; pf_pfgmiz_decl dh tmph knph d1
  | PPfAp(d1,d2) -> pf_pfgmiz_decl dh tmph knph d1; pf_pfgmiz_decl dh tmph knph d2
  | PLam(p1,d2) -> tm_pfgmiz_decl dh tmph p1; pf_pfgmiz_decl dh tmph knph d2
  | TLam(_,d2) -> pf_pfgmiz_decl dh tmph knph d2
  | _ -> ()

let rec tm_pfghoas_decl dh tmph m =
  match m with
  | TmH(h) when not (Hashtbl.mem pfgtmh h) && not (Hashtbl.mem pfghoasprim h) ->
     begin
       try
         let (x,a,om) = Hashtbl.find tmph h in
         if Hashtbl.mem dh h || h = "5bf697cb0d1cdefbe881504469f6c48cc388994115b82514dfc4fb5e67ac1a87" then (** never make False opaque in HOAS **)
           begin (** Include def for delta in some proof **)
             Hashtbl.add pfgtmh h x;
             match om with
             | Some(m) ->
                tm_pfghoas_decl dh tmph m;
                Printf.printf "Def %s : %s\n := %s\n" x (tp_pfgsyn_str a) (tm_pfghoas_str_r m [])
             | _ -> raise (Failure (Printf.sprintf "delta required for %s [%s] but do not have def" x h))
           end
         else
           begin (** No deltas needed, so just include as opaque param **)
             try
               let pfghv = Hashtbl.find pfgtmhh h in
               Hashtbl.add pfgtmh h x;
               Printf.printf "Param %s %s : %s\n" (Hash.hashval_hexstring pfghv) x (tp_pfgsyn_str a)
             with Not_found -> raise (Failure (Printf.sprintf "do not know pfg id corresponding to %s" h))
           end
       with Not_found -> raise (Failure (Printf.sprintf "cannot find info for %s to create pfg version" h))
     end
  | Ap(m1,m2) -> tm_pfghoas_decl dh tmph m1; tm_pfghoas_decl dh tmph m2
  | Lam(_,m2) -> tm_pfghoas_decl dh tmph m2
  | Imp(m1,m2) -> tm_pfghoas_decl dh tmph m1; tm_pfghoas_decl dh tmph m2
  | All(_,m2) -> tm_pfghoas_decl dh tmph m2
  | _ -> ()

let rec pf_pfghoas_decl dh tmph knph d =
  match d with
  | Known(h) when not (Hashtbl.mem pfgknh h) && not (h = "5626ac8cb7c90418f6c980ffedd6f45097048659977d8690c44f9d34feb6b2d3") ->
     begin
       let p = Hashtbl.find knph h in
       tm_pfghoas_decl dh tmph p;
       let nm =
         try
           Hashtbl.find pfghoasknname h
         with _ ->
           incr knowncnt;
           Printf.sprintf "Known%d" !knowncnt
       in
       Printf.printf "Known %s : %s\n" nm (tm_pfghoas_str_r p []);
       Hashtbl.add pfgknh h nm
     end
  | PTpAp(d1,_) -> pf_pfghoas_decl dh tmph knph d1
  | PTmAp(d1,m2) -> tm_pfghoas_decl dh tmph m2; pf_pfghoas_decl dh tmph knph d1
  | PPfAp(d1,d2) -> pf_pfghoas_decl dh tmph knph d1; pf_pfghoas_decl dh tmph knph d2
  | PLam(p1,d2) -> tm_pfghoas_decl dh tmph p1; pf_pfghoas_decl dh tmph knph d2
  | TLam(_,d2) -> pf_pfghoas_decl dh tmph knph d2
  | _ -> ()

let tm_pfg_decl dh tmph m =
  match !pfgtheory with
  | HF -> tm_pfghf_decl dh tmph m
  | Egal -> tm_pfgegal_decl dh tmph m
  | Mizar -> tm_pfgmiz_decl dh tmph m
  | HOAS -> tm_pfghoas_decl dh tmph m

let pf_pfg_decl dh tmph knph d =
  match !pfgtheory with
  | HF -> pf_pfghf_decl dh tmph knph d
  | Egal -> pf_pfgegal_decl dh tmph knph d
  | Mizar -> pf_pfgmiz_decl dh tmph knph d
  | HOAS -> pf_pfghoas_decl dh tmph knph d

let rec pf_pfghf_str_r d phi psi =
  match d with
  | Hyp(j) -> List.nth psi j
  | Known(h) -> (try Hashtbl.find pfgknh h with Not_found -> Printf.sprintf "#%s" h)
  | PTpAp(PTpAp(Known(h),a1),a2) when h = "5626ac8cb7c90418f6c980ffedd6f45097048659977d8690c44f9d34feb6b2d3" -> Printf.sprintf "Ext %s %s" (tp_pfgset_str a1) (tp_pfgset_str a2)
  | PTpAp(d1,a2) -> Printf.sprintf "TpAp %s %s" (pf_pfghf_str_r d1 phi psi) (tp_pfgset_str a2)
  | PTmAp(d1,m2) -> Printf.sprintf "TmAp %s %s" (pf_pfghf_str_r d1 phi psi) (tm_pfghf_str_r m2 phi)
  | PPfAp(d1,d2) -> Printf.sprintf "PrAp %s %s" (pf_pfghf_str_r d1 phi psi) (pf_pfghf_str_r d2 phi psi)
  | PLam(m1,d2) ->
      begin
	let x =
	  if hyp_in_pf_p d2 0 then
	    begin
	      try
	        let z = Hashtbl.find pfghyph d in
                if Hashtbl.mem pfgreserved z then raise Not_found;
                if List.mem z psi then raise Not_found;
                z
	      with Not_found ->
		incr pfghypcount;
		Printf.sprintf "A%d" !pfghypcount
	    end
	  else
	    "_"
	in
	Printf.sprintf "PrLa %s %s %s" x (tm_pfghf_str_r m1 phi) (pf_pfghf_str_r d2 phi (x::psi))
      end
  | TLam(a1,d2) ->
      begin
	let x =
	  if free_in_pf_p d2 0 then
	    begin
	      try
	        let z = Hashtbl.find pfgpfbvarh d in
                if Hashtbl.mem pfgreserved z then raise Not_found;
                if List.mem z phi then raise Not_found;
                z
	      with Not_found ->
		incr pfgvarcount;
		Printf.sprintf "x%d" !pfgvarcount
	    end
	  else
	    "_"
	in
	Printf.sprintf "TmLa %s %s %s" x (tp_pfgset_str a1) (pf_pfghf_str_r d2 (x::phi) psi)
      end

let rec pf_pfgegal_str_r d phi psi =
  match d with
  | Hyp(j) -> List.nth psi j
  | Known(h) -> (try Hashtbl.find pfgknh h with Not_found -> Printf.sprintf "#%s" h)
  | PTpAp(PTpAp(Known(h),a1),a2) when h = "5626ac8cb7c90418f6c980ffedd6f45097048659977d8690c44f9d34feb6b2d3" -> Printf.sprintf "Ext %s %s" (tp_pfgset_str a1) (tp_pfgset_str a2)
  | PTpAp(d1,a2) -> Printf.sprintf "TpAp %s %s" (pf_pfgegal_str_r d1 phi psi) (tp_pfgset_str a2)
  | PTmAp(d1,m2) -> Printf.sprintf "TmAp %s %s" (pf_pfgegal_str_r d1 phi psi) (tm_pfgegal_str_r m2 phi)
  | PPfAp(d1,d2) -> Printf.sprintf "PrAp %s %s" (pf_pfgegal_str_r d1 phi psi) (pf_pfgegal_str_r d2 phi psi)
  | PLam(m1,d2) ->
      begin
	let x =
	  if hyp_in_pf_p d2 0 then
	    begin
	      try
	        let z = Hashtbl.find pfghyph d in
                if Hashtbl.mem pfgreserved z then raise Not_found;
                if List.mem z psi then raise Not_found;
                z
	      with Not_found ->
		incr pfghypcount;
		Printf.sprintf "A%d" !pfghypcount
	    end
	  else
	    "_"
	in
	Printf.sprintf "PrLa %s %s %s" x (tm_pfgegal_str_r m1 phi) (pf_pfgegal_str_r d2 phi (x::psi))
      end
  | TLam(a1,d2) ->
      begin
	let x =
	  if free_in_pf_p d2 0 then
	    begin
	      try
	        let z = Hashtbl.find pfgpfbvarh d in
                if Hashtbl.mem pfgreserved z then raise Not_found;
                if List.mem z phi then raise Not_found;
                z
	      with Not_found ->
		incr pfgvarcount;
		Printf.sprintf "x%d" !pfgvarcount
	    end
	  else
	    "_"
	in
	Printf.sprintf "TmLa %s %s %s" x (tp_pfgset_str a1) (pf_pfgegal_str_r d2 (x::phi) psi)
      end

let rec pf_pfgmiz_str_r d phi psi =
  match d with
  | Hyp(j) -> List.nth psi j
  | Known(h) -> (try Hashtbl.find pfgknh h with Not_found -> Printf.sprintf "#%s" h)
  | PTpAp(PTpAp(Known(h),a1),a2) when h = "5626ac8cb7c90418f6c980ffedd6f45097048659977d8690c44f9d34feb6b2d3" -> Printf.sprintf "Ext %s %s" (tp_pfgset_str a1) (tp_pfgset_str a2)
  | PTpAp(d1,a2) -> Printf.sprintf "TpAp %s %s" (pf_pfgmiz_str_r d1 phi psi) (tp_pfgset_str a2)
  | PTmAp(d1,m2) -> Printf.sprintf "TmAp %s %s" (pf_pfgmiz_str_r d1 phi psi) (tm_pfgmiz_str_r m2 phi)
  | PPfAp(d1,d2) -> Printf.sprintf "PrAp %s %s" (pf_pfgmiz_str_r d1 phi psi) (pf_pfgmiz_str_r d2 phi psi)
  | PLam(m1,d2) ->
      begin
	let x =
	  if hyp_in_pf_p d2 0 then
	    begin
	      try
	        let z = Hashtbl.find pfghyph d in
                if Hashtbl.mem pfgreserved z then raise Not_found;
                if List.mem z psi then raise Not_found;
                z
	      with Not_found ->
		incr pfghypcount;
		Printf.sprintf "A%d" !pfghypcount
	    end
	  else
	    "_"
	in
	Printf.sprintf "PrLa %s %s %s" x (tm_pfgmiz_str_r m1 phi) (pf_pfgmiz_str_r d2 phi (x::psi))
      end
  | TLam(a1,d2) ->
      begin
	let x =
	  if free_in_pf_p d2 0 then
	    begin
	      try
	        let z = Hashtbl.find pfgpfbvarh d in
                if Hashtbl.mem pfgreserved z then raise Not_found;
                if List.mem z phi then raise Not_found;
                z
	      with Not_found ->
		incr pfgvarcount;
		Printf.sprintf "x%d" !pfgvarcount
	    end
	  else
	    "_"
	in
	Printf.sprintf "TmLa %s %s %s" x (tp_pfgset_str a1) (pf_pfgmiz_str_r d2 (x::phi) psi)
      end

let rec pf_pfghoas_str_r d phi psi =
  match d with
  | Hyp(j) -> List.nth psi j
  | Known(h) -> (try Hashtbl.find pfgknh h with Not_found -> Printf.sprintf "#%s" h)
  | PTpAp(PTpAp(Known(h),a1),a2) when h = "5626ac8cb7c90418f6c980ffedd6f45097048659977d8690c44f9d34feb6b2d3" -> Printf.sprintf "Ext %s %s" (tp_pfgsyn_str a1) (tp_pfgsyn_str a2)
  | PTpAp(d1,a2) -> Printf.sprintf "TpAp %s %s" (pf_pfghoas_str_r d1 phi psi) (tp_pfgsyn_str a2)
  | PTmAp(d1,m2) -> Printf.sprintf "TmAp %s %s" (pf_pfghoas_str_r d1 phi psi) (tm_pfghoas_str_r m2 phi)
  | PPfAp(d1,d2) -> Printf.sprintf "PrAp %s %s" (pf_pfghoas_str_r d1 phi psi) (pf_pfghoas_str_r d2 phi psi)
  | PLam(m1,d2) ->
      begin
	let x =
	  if hyp_in_pf_p d2 0 then
	    begin
	      try
	        let z = Hashtbl.find pfghyph d in
                if Hashtbl.mem pfgreserved z then raise Not_found;
                if List.mem z psi then raise Not_found;
                z
	      with Not_found ->
		incr pfghypcount;
		Printf.sprintf "A%d" !pfghypcount
	    end
	  else
	    "_"
	in
	Printf.sprintf "PrLa %s %s %s" x (tm_pfghoas_str_r m1 phi) (pf_pfghoas_str_r d2 phi (x::psi))
      end
  | TLam(a1,d2) ->
      begin
	let x =
	  if free_in_pf_p d2 0 then
	    begin
	      try
	        let z = Hashtbl.find pfgpfbvarh d in
                if Hashtbl.mem pfgreserved z then raise Not_found;
                if List.mem z phi then raise Not_found;
                z
	      with Not_found ->
		incr pfgvarcount;
		Printf.sprintf "x%d" !pfgvarcount
	    end
	  else
	    "_"
	in
	Printf.sprintf "TmLa %s %s %s" x (tp_pfgsyn_str a1) (pf_pfghoas_str_r d2 (x::phi) psi)
      end

let tm_pfg_str m =
  pfgvarcount := 0;
  match !pfgtheory with
  | HF -> tm_pfghf_str_r m []
  | Egal -> tm_pfgegal_str_r m []
  | Mizar -> tm_pfgmiz_str_r m []
  | HOAS -> tm_pfghoas_str_r m []

let pf_pfg_str d =
  pfgvarcount := 0;
  pfghypcount := 0;
  match !pfgtheory with
  | HF -> pf_pfghf_str_r d [] []
  | Egal -> pf_pfgegal_str_r d [] []
  | Mizar -> pf_pfgmiz_str_r d [] []
  | HOAS -> pf_pfghoas_str_r d [] []

let pfg_prim_id_p h =
  match !pfgtheory with
  | HF -> Hashtbl.mem pfghfprim h
  | Egal -> Hashtbl.mem pfgegalprim h
  | Mizar -> Hashtbl.mem pfgmizprim h
  | HOAS -> Hashtbl.mem pfghoasprim h

let rec tp_ocaml a =
  match a with
  | Prop -> "Prop"
  | Set -> "Set"
  | Ar(a1,a2) -> Printf.sprintf "Ar(%s,%s)" (tp_ocaml a1) (tp_ocaml a2)
  | TpVar(i) -> Printf.sprintf "TpVar(%d)" i

let hoas_bind w = Ap(TmH("73c9efe869770ab42f7cde0b33fe26bbc3e2bd157dad141c0c27d1e7348d60f5"),Lam(Set,w))

(** nil := bind (fun x => x) **)
let hoas_nil () = hoas_bind (DB(0))

(** pair is Prim(0) **)
let hoas_pair m n = Ap(Ap(TmH("d58762d200971dcc7f1850726d9f2328403127deeba124fc3ba2d2d9f7c3cb8c"),m),n)

(** hex is a balanced binary tree of depth 2 with leaves from DB(0) and DB(1) **)
let hoas_hex_a h =
  hoas_pair
    (hoas_pair (DB((h lsr 3) land 1)) (DB((h lsr 2) land 1)))
    (hoas_pair (DB((h lsr 1) land 1)) (DB(h land 1)))

let hoas_hex h =
  hoas_bind (hoas_bind (hoas_hex_a h))

(** byte is a balanced binary tree of depth 3 with leaves from bit0 and bit1 **)
let hoas_byte_a by =
  hoas_pair (hoas_hex_a ((by lsr 4) land 15)) (hoas_hex_a (by land 15))

let hoas_byte by =
  hoas_bind (hoas_bind (hoas_byte_a by))

let rec var_free_in_pf_p d i =
  match d with
  | PTpAp(d1,a) -> var_free_in_pf_p d1 i
  | PTmAp(d1,m1) -> var_free_in_pf_p d1 i || free_in_tm_p m1 i
  | PPfAp(d1,d2) -> var_free_in_pf_p d1 i || var_free_in_pf_p d2 i
  | TLam(a1,d1) -> var_free_in_pf_p d1 (i+1)
  | PLam(p1,d1) -> free_in_tm_p p1 i || var_free_in_pf_p d1 i
  | _ -> false

let rec hyp_free_in_pf_p d i =
  match d with
  | Hyp(j) -> j = i
  | PTpAp(d1,a) -> hyp_free_in_pf_p d1 i
  | PTmAp(d1,m1) -> hyp_free_in_pf_p d1 i
  | PPfAp(d1,d2) -> hyp_free_in_pf_p d1 i || hyp_free_in_pf_p d2 i
  | TLam(a1,d1) -> hyp_free_in_pf_p d1 i
  | PLam(p1,d1) -> hyp_free_in_pf_p d1 (i+1)
  | _ -> false
  
let rec pftmsubst d i m  =
  match d with
  | PTpAp(d1,a) -> PTpAp(pftmsubst d1 i m,a)
  | PTmAp(d1,m1) -> PTmAp(pftmsubst d1 i m,tmsubst m1 i m)
  | PPfAp(d1,d2) -> PPfAp(pftmsubst d1 i m,pftmsubst d2 i m)
  | TLam(a1,d1) -> TLam(a1,pftmsubst d1 (i+1) m)
  | PLam(p1,d1) -> PLam(tmsubst p1 i m,pftmsubst d1 i m)
  | _ -> d

let rec pfsubst d l i e =
  match d with
  | Hyp(k) when k < i -> Hyp(k)
  | Hyp(k) when k = i -> pftmshift 0 l (pfshift 0 i e)
  | Hyp(k) when k > i -> Hyp(k-1)
  | PTpAp(d1,a) -> PTpAp(pfsubst d1 l i e,a)
  | PTmAp(d1,m1) -> PTmAp(pfsubst d1 l i e,m1)
  | PPfAp(d1,d2) -> PPfAp(pfsubst d1 l i e,pfsubst d2 l i e)
  | TLam(a1,d1) -> TLam(a1,pfsubst d1 (l+1) i e)
  | PLam(p1,d1) -> PLam(p1,pfsubst d1 l (i+1) e)
  | _ -> d

let varintb_pfg_size x =
  if x < 4 then
    4
  else if x < 20 then
    6
  else if x < 276 then
    10
  else
    18

let rec tp_pfg_size a =
  match a with
  | Ar(a,b) -> 2 + tp_pfg_size a + tp_pfg_size b
  | Prop -> 2
  | Set -> 5
  | _ -> 1

let rec tm_pfg_size m =
  match m with
  | Ap(TpAp(TmH(h),a1),Lam(_,m1)) when h = "912ad2cdc2d23bb8aa0a5070945f2a90976a948b0e8308917244591f3747f099" -> (* Ex *)
      4 + tp_pfg_size a1 + tm_pfg_size m1
  | Ap(Ap(TpAp(TmH(h),a),m1),m2) when h = "5a6af35fb6d6bea477dd0f822b8e01ca0d57cc50dfd41744307bc94597fdaa4a" -> (* Eq *)
      4 + tp_pfg_size a + tm_pfg_size m1 + tm_pfg_size m2
  | TmH(h) ->
     begin
       try
         let x =
           Hashtbl.find
             begin
               match !pfgtheory with
               | HF -> pfghfprim
               | Egal -> pfgegalprim
               | Mizar -> pfgmizprim
               | HOAS -> pfghoasprim
             end
             h
         in
         3 + varintb_pfg_size x
       with Not_found ->
         259
     end
  | DB(x) -> 3 + varintb_pfg_size x
  | Prim(x) -> 3 + varintb_pfg_size x
  | Ap(m1,m2) -> 3 + tm_pfg_size m1 + tm_pfg_size m2
  | Lam(a,m) -> 3 + tp_pfg_size a + tm_pfg_size m
  | Imp(m1,m2) -> 3 + tm_pfg_size m1 + tm_pfg_size m2
  | All(a,m) -> 3 + tp_pfg_size a + tm_pfg_size m
  | _ -> 16

let rec pf_pfg_size d =
  match d with
  | Hyp(i) -> 3 + varintb_pfg_size i
  | Known(_) -> 259
  | PTpAp(PTpAp(Known(h),a1),a2) when h = "5626ac8cb7c90418f6c980ffedd6f45097048659977d8690c44f9d34feb6b2d3" -> 3 + tp_pfg_size a1 + tp_pfg_size a2
  | PTmAp(d1,m2) -> 3 + pf_pfg_size d1 + tm_pfg_size m2
  | PPfAp(d1,d2) -> 3 + pf_pfg_size d1 + pf_pfg_size d2
  | PLam(m1,d2) -> 3 + tm_pfg_size m1 + pf_pfg_size d2
  | TLam(a1,d2) -> 3 + tp_pfg_size a1 + pf_pfg_size d2
  | _ -> 16

let rec reduce_pf d =
  match d with
  | PTpAp(d1,a) ->
     let (d1,b1) = reduce_pf d1 in
     (PTpAp(d1,a),b1)
  | PTmAp(TLam(_,d1),m) ->
     let d1a = normalize_pf d1 in
     (pftmsubst d1a 0 m,false)
  | PPfAp(PLam(_,d1),d2) ->
     let d1a = normalize_pf d1 in
     let d2a = normalize_pf d2 in
     (pfsubst d1a 0 0 d2a,false)
  | PTmAp(d1,m) ->
     let (d1,b1) = reduce_pf d1 in
     (PTmAp(d1,m),b1)
  | PPfAp(d1,d2) ->
     let (d1,b1) = reduce_pf d1 in
     let (d2,b2) = reduce_pf d2 in
     (PPfAp(d1,d2),b1 && b2)
  | PLam(p,d1) ->
     let (d1,b1) = reduce_pf d1 in
     (PLam(p,d1),b1)
  | TLam(a,d1) ->
     let (d1,b1) = reduce_pf d1 in
     (TLam(a,d1),b1)
  | _ -> (d,true)
and normalize_pf d =
  let (d,b) = reduce_pf d in
  if b then d else normalize_pf d

let rec optimize_pf_1 d =
  match d with
  | TLam(Ar(a1,Ar(a2,Prop)),PLam(Ap(Ap(DB(0),m1),m2),Hyp(0))) when a1 = a2 && m1 = m2 && not (free_in_tm_p m1 0) && tm_pfg_size m1 > 255 -> (** reflexivity of eq **)
      PTmAp(TLam(a1,TLam(Ar(a1,Ar(a2,Prop)),PLam(Ap(Ap(DB(0),DB(1)),DB(1)),Hyp(0)))),tmshift 0 (-1) m1)
  | PTmAp(d1,m1) ->
      begin
	let d1a = optimize_pf_1 d1 in
	let drb = PTmAp(d1a,m1) in
	match d1a with
	| TLam(a1,d1b) ->
	    let drc = pftmsubst d1b 0 m1 in
	    if pf_pfg_size drc < pf_pfg_size drb then
	      drc
	    else
	      drb
	| _ -> drb
      end
  | PPfAp(d1,d2) ->
      begin
	let d1a = optimize_pf_1 d1 in
	let d2a = optimize_pf_1 d2 in
	let drb = PPfAp(d1a,d2a) in
	match d1a with
	| PLam(p1,d1b) ->
	    let drc = pfsubst d1b 0 0 d2a in
	    if pf_pfg_size drc < pf_pfg_size drb then
	      drc
	    else
	      drb
	| _ -> drb
      end
  | TLam(a,d1) -> 
      begin
	let d1a = optimize_pf_1 d1 in
	let drb = TLam(a,d1a) in
	match d1a with
	| PTmAp(d1b,DB(0)) when not (var_free_in_pf_p d1b 0) ->
	    let drc = optimize_pf_1 (pftmshift 0 (-1) d1b) in
	    if pf_pfg_size drc < pf_pfg_size drb then
	      drc
	    else
	      drb
	| _ -> drb
      end
  | PLam(p1,d1) ->
      begin
	let d1a = optimize_pf_1 d1 in
	let drb = PLam(p1,d1a) in
	match d1a with 
	| PPfAp(d1b,Hyp(0)) when not (hyp_free_in_pf_p d1b 0) ->
	    let drc = optimize_pf_1 (pfshift 0 (-1) d1b) in
	    if pf_pfg_size drc < pf_pfg_size drb then
	      drc
	    else
	      drb
	| _ -> drb
      end
  | _ -> d
      
let optimize_pf_2 sgdelta sgtmof d tmcutoff pfcutoff =
  let htc : (tp list * tm,int) Hashtbl.t = Hashtbl.create 100 in
  let hc : (tp list * tm list * tm,int) Hashtbl.t = Hashtbl.create 100 in
  let hp : (tp list * tm list * tm,pf) Hashtbl.t = Hashtbl.create 100 in
  let rec g i cxtm cxpf cxpfa d p =
    match cxpf with
    | (q::cxpfr) ->
       if hyp_free_in_pf_p d i then
         g (i+1) cxtm cxpfr (q::cxpfa) d p
       else
         g i cxtm cxpfr cxpfa (pfshift i (-1) d) p
    | [] ->
       let cxpf = List.rev cxpfa in
       begin
         try
           let n = Hashtbl.find hc (cxtm,cxpf,p) in
           Hashtbl.replace hc (cxtm,cxpf,p) (n+1)
         with Not_found ->
           Hashtbl.add hc (cxtm,cxpf,p) 1
       end;
       begin
         try
           let e = Hashtbl.find hp (cxtm,cxpf,p) in
           if pf_pfg_size e < pf_pfg_size d then
             Hashtbl.replace hp (cxtm,cxpf,p) e
         with Not_found ->
           Hashtbl.add hp (cxtm,cxpf,p) d
       end
  in
  let rec f i cxtm cxpf cxtma d p =
    match cxtm with
    | (a::cxtmr) ->
       begin
         if var_free_in_pf_p d i || free_in_tm_p p i || List.exists (fun q -> free_in_tm_p q i) cxpf then
           f (i+1) cxtmr cxpf (a::cxtma) d p
         else
           let d1 = pftmshift i (-1) d in
           let p1 = tmshift i (-1) p in
           let cxpf1 = List.map (fun q -> tmshift i (-1) q) cxpf in
           f i cxtmr cxpf1 cxtma d1 p1
       end
    | [] -> g 0 (List.rev cxtma) cxpf [] d p
  in
  let rec h i cxtm cxtma m =
    match cxtm with
    | (a::cxtmr) ->
       begin
         if free_in_tm_p m i then
           h (i+1) cxtmr (a::cxtma) m
         else
           let m1 = tmshift i (-1) m in
           h i cxtmr cxtma m1
       end
    | [] ->
       let cxtm = List.rev cxtma in
       begin
         try
           let n = Hashtbl.find htc (cxtm,m) in
           Hashtbl.replace htc (cxtm,m) (n+1)
         with Not_found ->
           Hashtbl.add htc (cxtm,m) 1
       end
  in
  let rec process_tm cxtm m =
    if tm_pfg_size m > 32 then
      begin
        h 0 cxtm [] m;
        match m with
        | Ap(m1,m2) -> process_tm cxtm m1; process_tm cxtm m2
        | Lam(a1,m1) -> process_tm (a1::cxtm) m1
        | Imp(m1,m2) -> process_tm cxtm m1; process_tm cxtm m2
        | All(a1,m1) -> process_tm (a1::cxtm) m1
        | _ -> ()
      end
  in
  let rec optimize_pf_2_a cxtm cxpf d =
    if pf_pfg_size d > 32 then
      let (p,_) = extr_propofpf sgdelta sgtmof cxtm cxpf d [] in
      f 0 cxtm cxpf [] d p;
      match d with
      | PTmAp(d1,m1) -> process_tm cxtm m1; PTmAp(optimize_pf_2_a cxtm cxpf d1,m1)
      | PPfAp(d1,d2) -> PPfAp(optimize_pf_2_a cxtm cxpf d1,optimize_pf_2_a cxtm cxpf d2)
      | TLam(a1,d1) -> TLam(a1,optimize_pf_2_a (a1::cxtm) (List.map (fun q -> tmshift 0 1 q) cxpf) d1)
      | PLam(p1,d1) -> process_tm cxtm p1; PLam(p1,optimize_pf_2_a cxtm (p1::cxpf) d1)
      | _ -> d
    else
      d
  in
  let d = optimize_pf_2_a [] [] d in
  Hashtbl.iter
    (fun (cxtm,cxpf,p) n ->
      if n >= pfcutoff then
        Printf.printf "%% subpf %d %s\n" n (tm_to_str p))
    hc;
  Hashtbl.iter
    (fun (cxtm,m) n ->
      if n >= tmcutoff then
        Printf.printf "%% subtm %d %s\n" n (tm_to_str m))
    htc;
  d

exception NotFO

let tptp_id_name : (string,string * tp) Hashtbl.t = Hashtbl.create 100

let tptpize_name x =
  let l = String.length x in
  if l = 0 then
    "emptyname"
  else
    let y = Buffer.create 100 in
    let co = Char.code x.[0] in
    if not (co >= 97 && co <= 122) then Buffer.add_string y "c_";
    for i = 0 to (String.length x) - 1 do
      let c = x.[i] in
      let co = Char.code c in
      if (co >= 48 && co <= 57 || co >= 65 && co <= 90 || co >= 97 && co <= 122) then
        Buffer.add_char y c
      else
        begin
	  Buffer.add_char y '_';
	  Buffer.add_char y (hex_char ((co lsr 4) mod 16));
	  Buffer.add_char y (hex_char (co mod 16));
        end
    done;
    Buffer.contents y

let rec head_spine m sp =
  match m with
  | Ap(m1,m2) -> head_spine m1 (m2::sp)
  | _ -> (m,sp)

let rec fo_funtp_arity a =
  match a with
  | Set -> 0
  | Ar(Set,a) -> 1 + fo_funtp_arity a
  | _ -> raise NotFO

let rec fo_predtp_arity a =
  match a with
  | Prop -> 0
  | Ar(Set,a) -> 1 + fo_predtp_arity a
  | _ -> raise NotFO

let rec fo_gentp_arity a =
  match a with
  | Set -> (Set,0)
  | Prop -> (Prop,0)
  | Ar(Set,a) -> let (b,n) = fo_gentp_arity a in (b,1 + n)
  | _ -> raise NotFO

let rec fof_trm_str m cxtm =
  let (h,sp) = head_spine m [] in
  match h with
  | DB(i) ->
     begin
       if sp = [] && i < List.length cxtm then
         begin
           let (x,a) = List.nth cxtm i in
           if a = Set then
             x
           else
             raise NotFO
         end
       else
         raise NotFO
     end
  | TmH(h) ->
     begin
       try
         let (x,a) = Hashtbl.find tptp_id_name h in
         if fo_funtp_arity a = List.length sp then
           if a = Set then
             x
           else
             Printf.sprintf "%s(%s)" x (fof_spine_str sp cxtm "")
         else
           raise NotFO
       with Not_found -> raise NotFO
     end
  | _ -> raise NotFO
and fof_spine_str sp cxtm sep =
  match sp with
  | [] -> ""
  | m::spr -> Printf.sprintf "%s%s%s" sep (fof_trm_str m cxtm) (fof_spine_str spr cxtm ",")

let rec fof_prop_str m cxtm =
  match m with
  | Imp(m1,m2) ->
     Printf.sprintf "(%s => %s)" (fof_prop_str m1 cxtm) (fof_prop_str m2 cxtm)
  | All(Set,m1) ->
     let x = Printf.sprintf "X%d" (List.length cxtm) in
     Printf.sprintf "(! [%s] : %s)" x (fof_prop_str m1 ((x,Set)::cxtm))
  | TmH(h) when h = "5867641425602c707eaecd5be95229f6fd709c9b58d50af108dfe27cb49ac069" ->
     "$true"
  | TmH(h) when h = "5bf697cb0d1cdefbe881504469f6c48cc388994115b82514dfc4fb5e67ac1a87" ->
     "$false"
  | Ap(TmH(h),m1) when h = "058f630dd89cad5a22daa56e097e3bdf85ce16ebd3dbf7994e404e2a98800f7f" ->
     Printf.sprintf "~ %s" (fof_prop_str m1 cxtm)
  | Ap(Ap(TmH(h),m1),m2) when h = "87fba1d2da67f06ec37e7ab47c3ef935ef8137209b42e40205afb5afd835b738" ->
     Printf.sprintf "(%s & %s)" (fof_prop_str m1 cxtm) (fof_prop_str m2 cxtm)
  | Ap(Ap(TmH(h),m1),m2) when h = "cfe97741543f37f0262568fe55abbab5772999079ff734a49f37ed123e4363d7" ->
     Printf.sprintf "(%s | %s)" (fof_prop_str m1 cxtm) (fof_prop_str m2 cxtm)
  | Ap(Ap(TmH(h),m1),m2) when h = "9c60bab687728bc4482e12da2b08b8dbc10f5d71f5cab91acec3c00a79b335a3" ->
     Printf.sprintf "(%s <=> %s)" (fof_prop_str m1 cxtm) (fof_prop_str m2 cxtm)
  | Ap(TpAp(TmH(h),a),Lam(_,m1)) when h = "912ad2cdc2d23bb8aa0a5070945f2a90976a948b0e8308917244591f3747f099" ->
     let x = Printf.sprintf "X%d" (List.length cxtm) in
     Printf.sprintf "(? [%s] : %s)" x (fof_prop_str m1 ((x,a)::cxtm))
  | Ap(Ap(TpAp(TmH(h),a),m1),m2) when h = "5a6af35fb6d6bea477dd0f822b8e01ca0d57cc50dfd41744307bc94597fdaa4a" ->
     Printf.sprintf "(%s = %s)" (fof_trm_str m1 cxtm) (fof_trm_str m2 cxtm)
  | Ap(Ap(TpAp(TmH(h),a),m1),m2) when h = "7966a66a9bb198103c2a540ccd5ebebdff33c10843cc10eebfc98715e142989c" ->
     Printf.sprintf "~ (%s = %s)" (fof_trm_str m1 cxtm) (fof_trm_str m2 cxtm)
  | _ ->
     let (h,sp) = head_spine m [] in
     match h with
     | TmH(h) ->
        begin
          try
            let (x,a) = Hashtbl.find tptp_id_name h in
            if fo_predtp_arity a = List.length sp then
              if a = Prop then
                x
              else
                Printf.sprintf "%s(%s)" x (fof_spine_str sp cxtm "")
            else
              raise NotFO
          with Not_found -> raise NotFO
        end
     | _ -> raise NotFO

let rec th0_stp_str a =
  match a with
  | Set -> "$i"
  | Prop -> "$o"
  | Ar(a,b) -> Printf.sprintf "(%s > %s)" (th0_stp_str a) (th0_stp_str b)
  | _ -> raise (Failure "no poly")
     
let rec th0_str m cxtm =
  match m with
  | DB(i) ->
     let (x,_) = List.nth cxtm i in
     x
  | TmH(h) when h = "5867641425602c707eaecd5be95229f6fd709c9b58d50af108dfe27cb49ac069" ->
     "$true"
  | TmH(h) when h = "5bf697cb0d1cdefbe881504469f6c48cc388994115b82514dfc4fb5e67ac1a87" ->
     "$false"
  | TmH(h) when h = "058f630dd89cad5a22daa56e097e3bdf85ce16ebd3dbf7994e404e2a98800f7f" ->
     "(^ [P:$o] : (~ (P)))"
  | Ap(TmH(h),m1) when h = "058f630dd89cad5a22daa56e097e3bdf85ce16ebd3dbf7994e404e2a98800f7f" ->
     let r = th0_str m1 cxtm in
     if String.length r > 1 && r.[0] = '(' then
       Printf.sprintf "(~ %s)" r
     else
       Printf.sprintf "(~ (%s))" r
  | TmH(h) when h = "87fba1d2da67f06ec37e7ab47c3ef935ef8137209b42e40205afb5afd835b738" ->
     "(^ [P:$o] : (^ [Q:$o] : (P & Q)))"
  | Ap(Ap(TmH(h),m1),m2) when h = "87fba1d2da67f06ec37e7ab47c3ef935ef8137209b42e40205afb5afd835b738" ->
     Printf.sprintf "(%s & %s)" (th0_str m1 cxtm) (th0_str m2 cxtm)
  | TmH(h) when h = "cfe97741543f37f0262568fe55abbab5772999079ff734a49f37ed123e4363d7" ->
     "(^ [P:$o] : (^ [Q:$o] : (P | Q)))"
  | Ap(Ap(TmH(h),m1),m2) when h = "cfe97741543f37f0262568fe55abbab5772999079ff734a49f37ed123e4363d7" ->
     Printf.sprintf "(%s | %s)" (th0_str m1 cxtm) (th0_str m2 cxtm)
  | TmH(h) when h = "9c60bab687728bc4482e12da2b08b8dbc10f5d71f5cab91acec3c00a79b335a3" ->
     "(^ [P:$o] : (^ [Q:$o] : (P <=> Q)))"
  | Ap(Ap(TmH(h),m1),m2) when h = "9c60bab687728bc4482e12da2b08b8dbc10f5d71f5cab91acec3c00a79b335a3" ->
     Printf.sprintf "(%s <=> %s)" (th0_str m1 cxtm) (th0_str m2 cxtm)
  | TmH(h) ->
     let (x,_) = Hashtbl.find tptp_id_name h in
     x
  | Ap(TpAp(TmH(h),a),Lam(_,m1)) when h = "912ad2cdc2d23bb8aa0a5070945f2a90976a948b0e8308917244591f3747f099" ->
     let x = Printf.sprintf "X%d" (List.length cxtm) in
     Printf.sprintf "(? [%s:%s] : %s)" x (th0_stp_str a) (th0_str m1 ((x,a)::cxtm))
  | Ap(TpAp(TmH(h),a),m1) when h = "912ad2cdc2d23bb8aa0a5070945f2a90976a948b0e8308917244591f3747f099" ->
     let x = Printf.sprintf "X%d" (List.length cxtm) in
     Printf.sprintf "(? [%s:%s] : (%s @ %s))" x (th0_stp_str a) (th0_str m1 cxtm) x
  | TpAp(TmH(h),a) when h = "912ad2cdc2d23bb8aa0a5070945f2a90976a948b0e8308917244591f3747f099" ->
     Printf.sprintf "(^ [P:(%s > $o)] : (? [X:%s] : (P @ X)))" (th0_stp_str a) (th0_stp_str a)
  | TpAp(TmH(h),a) when h = "5a6af35fb6d6bea477dd0f822b8e01ca0d57cc50dfd41744307bc94597fdaa4a" ->
     Printf.sprintf "(^ [X:%s] : (^ [Y:%s] : (X = Y)))" (th0_stp_str a) (th0_stp_str a)
  | Ap(Ap(TpAp(TmH(h),a),m1),m2) when h = "5a6af35fb6d6bea477dd0f822b8e01ca0d57cc50dfd41744307bc94597fdaa4a" ->
     Printf.sprintf "(%s = %s)" (th0_str m1 cxtm) (th0_str m2 cxtm)
  | TpAp(TmH(h),a) when h = "7966a66a9bb198103c2a540ccd5ebebdff33c10843cc10eebfc98715e142989c" ->
     Printf.sprintf "(^ [X:%s] : (^ [Y:%s] : (~ (X = Y))))" (th0_stp_str a) (th0_stp_str a)
  | Ap(Ap(TpAp(TmH(h),a),m1),m2) when h = "7966a66a9bb198103c2a540ccd5ebebdff33c10843cc10eebfc98715e142989c" ->
     Printf.sprintf "(~ (%s = %s))" (th0_str m1 cxtm) (th0_str m2 cxtm)
  | Ap(m1,m2) -> Printf.sprintf "(%s @ %s)" (th0_str m1 cxtm) (th0_str m2 cxtm)
  | Imp(m1,m2) -> Printf.sprintf "(%s => %s)" (th0_str m1 cxtm) (th0_str m2 cxtm)
  | Lam(a,m1) ->
     let x = Printf.sprintf "X%d" (List.length cxtm) in
     Printf.sprintf "(^ [%s:%s] : %s)" x (th0_stp_str a) (th0_str m1 ((x,a)::cxtm))
  | All(a,m1) ->
     let x = Printf.sprintf "X%d" (List.length cxtm) in
     Printf.sprintf "(! [%s:%s] : %s)" x (th0_stp_str a) (th0_str m1 ((x,a)::cxtm))
  | _ ->
     raise (Failure (Printf.sprintf "unhandled th0_str case: %s" (tm_to_str m)))

let rec fof_def_str_r a d m cx =
  match a with
  | Set -> Printf.sprintf "(%s = %s)" (fof_trm_str d cx) (fof_trm_str m cx)
  | Prop -> Printf.sprintf "(%s <=> %s)" (fof_prop_str d cx) (fof_prop_str m cx)
  | Ar(Set,a2) ->
     let x = Printf.sprintf "X%d" (List.length cx) in
     Printf.sprintf "(! [%s:$i] : %s)" x (fof_def_str_r a2 (Ap(tmshift 0 1 d,DB(0))) (gen_lam_body m) ((x,Set)::cx))
  | _ -> raise NotFO

let fof_def_str a c m =
  fof_def_str_r a (TmH(c)) m []

let rec th0_def_str a c m =
  let (x,_) = Hashtbl.find tptp_id_name c in
  Printf.sprintf "(%s = %s)" x (th0_str m [])

let tm_deps m =
  let h : (tm,unit) Hashtbl.t = Hashtbl.create 10 in
  let rec tm_deps_h m =
    match m with
    | TmH(_) -> Hashtbl.replace h m ()
    | Prim(_) -> Hashtbl.replace h m ()
    | Ap(m1,m2) -> tm_deps_h m1; tm_deps_h m2
    | Imp(m1,m2) -> tm_deps_h m1; tm_deps_h m2
    | Lam(_,m1) -> tm_deps_h m1
    | All(_,m1) -> tm_deps_h m1
    | _ -> ()
  in
  tm_deps_h m;
  let r = ref [] in
  Hashtbl.iter (fun k () -> r := k::!r) h;
  !r

let logicop : (string,unit) Hashtbl.t = Hashtbl.create 100;;
Hashtbl.add logicop "5867641425602c707eaecd5be95229f6fd709c9b58d50af108dfe27cb49ac069" ();;
Hashtbl.add logicop "5bf697cb0d1cdefbe881504469f6c48cc388994115b82514dfc4fb5e67ac1a87" ();;
Hashtbl.add logicop "058f630dd89cad5a22daa56e097e3bdf85ce16ebd3dbf7994e404e2a98800f7f" ();;
Hashtbl.add logicop "87fba1d2da67f06ec37e7ab47c3ef935ef8137209b42e40205afb5afd835b738" ();;
Hashtbl.add logicop "cfe97741543f37f0262568fe55abbab5772999079ff734a49f37ed123e4363d7" ();;
Hashtbl.add logicop "9c60bab687728bc4482e12da2b08b8dbc10f5d71f5cab91acec3c00a79b335a3" ();;
Hashtbl.add logicop "912ad2cdc2d23bb8aa0a5070945f2a90976a948b0e8308917244591f3747f099" ();;
Hashtbl.add logicop "5a6af35fb6d6bea477dd0f822b8e01ca0d57cc50dfd41744307bc94597fdaa4a" ();;
Hashtbl.add logicop "7966a66a9bb198103c2a540ccd5ebebdff33c10843cc10eebfc98715e142989c" ();;


