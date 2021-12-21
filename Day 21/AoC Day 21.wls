#!/usr/bin/env wolframscript
(* ::Package:: *)

(*Written December 21st, 2021.*)

(*Import & Setup*)

input=Import[FileNameJoin[{NotebookDirectory[],"Day21Input.txt"}],"Table"][[;;,-1]];


(*Part 1*)

nextState1[s_] :=
  {s[[2]], 
   Mod[s[[1]] + Total[s[[5]] + Range[3]], 10, 1],
   s[[4]], s[[3]] + Mod[s[[1]] + Total[s[[5]] + Range[3]], 10, 1],
   s[[5]] + 3};
#[[3]]*#[[5]] &@NestWhile[
  nextState1,
  Join[input, {0, 0, 0}],
  #[[4]] < 1000 &]


(*Part 2*)

tallyGather[tallies_List] := {#[[1, 1]], Total[#[[;; , 2]]]} & /@ 
   GatherBy[Flatten[tallies, 1], First];
nextState2[s_] :=
  Flatten[Table[{{
      s[[1, 2]], Mod[s[[1, 1]] + d1 + d2 + d3, 10, 1],
      s[[1, 4]], s[[1, 3]] + Mod[s[[1, 1]] + d1 + d2 + d3, 10, 1]},
     s[[2]]},
    {d1, 1, 3}, {d2, 1, 3}, {d3, 1, 3}], 2];
state = {{{8, 6, 0, 0}, 1}};
count = {0, 0};

Do[
  state = tallyGather[nextState2 /@ state];
  count[[Mod[i, 2, 1]]] += 
   Total@Select[state, #[[1, 4]] >= 21 &][[;; , 2]];
  state = Select[state, #[[1, 4]] < 21 &];
  , {i, 3^3*2}];
count // Max
