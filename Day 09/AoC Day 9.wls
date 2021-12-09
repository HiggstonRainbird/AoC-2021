#!/usr/bin/env wolframscript
(* ::Package:: *)

(*Written December 9th, 2021.*)

(*Import & Setup*)

input=Select[Import[FileNameJoin[{NotebookDirectory[],"Day9Input.txt"}],"Table"],Length[#]>0&];
input=PadLeft[IntegerDigits[#],100]&/@Flatten[input];

neighbors[list_,i_,j_]:=
Select[
  {i,j}+#&/@{{-1,0},{1,0},{0,-1},{0,1}},
  1<=#[[1]]<=Length[list]\[And]1<=#[[2]]<=Length[list[[i]]]&];


(*Part 1*)

Total[
 input[[Sequence @@ #]] & /@
   Select[
    Flatten[Table[{i, j}, {i, Length[input]}, {j, Length[input[[i]]]}], 1],
    input[[Sequence @@ #]] < 
      Min[input[[Sequence @@ #]] & /@ neighbors[input, Sequence @@ #]] 
    &] + 1]

(*Part 2*)

g = Flatten[Table[
     If[input[[i, j]] == 9,
      Nothing,
      ToString[{i, j}] \[UndirectedEdge] ToString[#] & /@
       Select[
        neighbors[input, i, j],
        input[[Sequence @@ #]] < input[[i, j]] &]],
     {i, 100},
     {j, 100}], 2];
Times @@ Sort[Length /@ ConnectedComponents[g]][[-3 ;;]]
