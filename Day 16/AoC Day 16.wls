#!/usr/bin/env wolframscript
(* ::Package:: *)

(*Written December 16th, 2021.*)

(*Import & Setup*)

input=Import[FileNameJoin[{NotebookDirectory[],"Day16Input.txt"}]];*)

replacement = 
  Thread[Thread[
    Join[ToString /@ Range[0, 9], CharacterRange["A", "F"]] -> 
     Table[PadLeft[IntegerDigits[i, 2], 4], {i, 0, 15}]]];
inp = Flatten[List @@ StringReplace[input, replacement]


(*Part 1*)

parsePacket[s_List] :=
 Module[{packet = Association[], pos = 1, length = 0, pLength = 0, 
   tmp, literal, end},
  AssociateTo[packet, "Version" -> FromDigits[s[[pos ;; pos + 2]], 2]];
  pos += 3;

  AssociateTo[packet, "ID" -> FromDigits[s[[pos ;; pos + 2]], 2]];
  pos += 3;

  If[packet["ID"] == 4,
   end = False; literal = {};
   While[! end,
    literal = Join[literal, s[[pos + 1 ;; pos + 4]]];
    If[s[[pos]] == 0, end = True];
    pos += 5;
    ];
   AssociateTo[packet, "Literal" -> FromDigits[literal, 2]];
   Return[{packet, pos}]
   ];

  AssociateTo[packet, "TypeID" -> s[[pos]]];
  pos += 1;

  If[packet["TypeID"] == 0,
   length = FromDigits[s[[pos ;; pos + 14]], 2]; pos += 15; 
   length += pos,
   pLength = FromDigits[s[[pos ;; pos + 10]], 2]; pos += 11;
   ];

  AssociateTo[packet, "Subpackets" -> {}];
  If[packet["TypeID"] == 0,
   While[pos < length,
    tmp = parsePacket[s[[pos ;;]]];
    packet["Subpackets"] = Join[packet["Subpackets"], {tmp[[1]]}];
    pos += tmp[[2]] - 1;
    ];
   Return[{packet, length}],
   While[Length[packet["Subpackets"]] < pLength,
    tmp = parsePacket[s[[pos ;;]]];
    packet["Subpackets"] = Join[packet["Subpackets"], {tmp[[1]]}];
    pos += tmp[[2]] - 1;
    ]
   ];
  Return[{packet, pos}]
  ]

$RecursionLimit = 2048;
fullPacket = parsePacket[inp][[1]];
Cases[fullPacket, KeyValuePattern["Version" -> v_ : Integer] :> v, Infinity] // Total


(*Part 2*)

getValue[p_Association] :=
 Which[
  p["ID"] == 0, Total[getValue /@ p["Subpackets"]],
  p["ID"] == 1, Times @@ (getValue /@ p["Subpackets"]),
  p["ID"] == 2, Min[getValue /@ p["Subpackets"]],
  p["ID"] == 3, Max[getValue /@ p["Subpackets"]],
  p["ID"] == 4, p["Literal"],
  p["ID"] == 5, If[getValue[#[[1]]] > getValue[#[[2]]] &@p["Subpackets"], 1, 0],
  p["ID"] == 6, If[getValue[#[[1]]] < getValue[#[[2]]] &@p["Subpackets"], 1, 0],
  p["ID"] == 7, If[getValue[#[[1]]] == getValue[#[[2]]] &@p["Subpackets"], 1, 0]
  ]
getValue[fullPacket]
