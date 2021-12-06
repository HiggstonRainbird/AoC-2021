#!/usr/bin/env wolframscript
(* ::Package:: *)

(*Written December 6th, 2021.*)

(*Import & Setup*)

input=Select[Import[FileNameJoin[{NotebookDirectory[],"Day6Input.txt"}],"List"],StringLength[#]>0&];
input=toExpression@StringSplit[input," -> "|","][[1]];

tallyGather[tallies_List] := {#[[1, 1]], Total[#[[;; , 2]]]} & /@ GatherBy[Flatten[tallies, 1], First];


(*Parts 1 & 2*)

Total[Nest[
 tallyGather[If[#[[1]] == 0, {{6, #[[2]]}, {8, #[[2]]}}, {# - {1,0}}] & /@ #] &,
  Tally[input],
  #][[;; , -1]]] & /@ {80, 256}
