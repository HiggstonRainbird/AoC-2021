#!/usr/bin/env wolframscript
(* ::Package:: *)

(*Written December 4th, 2021.*)


(* Import *)

input=Select[Import[FileNameJoin[{NotebookDirectory[],"Day4Input.txt"}],"Table"],Length[#]>0&];
calls=ToExpression["{"~~input[[1,1]]~~"}"];
boards=Partition[input[[2;;]],5];


(* Parts 1 & 2 *)

ClearAll@called;called[n_]:=0;
part1={};part2={};

Do[
 called[c]=1;finishList={};
 Do[
  new=Map[called,b,{2}];
  If[Max[Total/@new]==5\[Or]Max[Total[new]]==5,
   If[Length[part1]==0,part1=b];
   part2={c,b};
   AppendTo[finishList,b];
  ],
 {b,boards}];
 boards=Complement[boards,finishList],
{c,calls}]


(* Part 1 *)
part1[[1]]*Total[Complement[Flatten@part1[[2]],calls[[;;Position[calls,part1[[1]]][[1,1]]]]]]


(* Part 2 *)
part2[[1]]*Total[Complement[Flatten@part2[[2]],calls[[;;Position[calls,part2[[1]]][[1,1]]]]]]
