#!/usr/bin/env wolframscript
(* ::Package:: *)

(*Written December 15th, 2021.*)


(*Import & Setup*)

input=StringSplit[Import[FileNameJoin[{NotebookDirectory[],"Day15Input.txt"}]],"\n"];
input=Map[ToExpression,Characters/@input,{2}];


neighbors[inp_, pos_] := Select[{{0, 1}, {1, 0}}, And @@ Thread[{1, 1} <= pos + # <= Dimensions[inp]] &];
toVertex[pos_] := ToString[pos];

createAdjacencyGraph[inp_] :=
 Graph[
  Flatten[Table[
    Table[{toVertex[#] -> toVertex[# + b], toVertex[# + b] -> toVertex[#]}, 
      {b, neighbors[inp, #]}] &@{i,j},
    {i, Dimensions[inp][[1]]}, {j, Dimensions[inp][[2]]}]],
  EdgeWeight -> 
     Flatten[Table[
       Table[{inp[[Sequence @@ (# + b)]], inp[[Sequence @@ #]]}, {b, neighbors[inp, #]}] &@{i, j},
     {i, Dimensions[inp][[1]]}, {j, Dimensions[inp][[2]]}]]]


(*Part 1*)

g = createAdjacencyGraph[input];
GraphDistance[g, toVertex[{1, 1}], toVertex[Dimensions@input]]


(*Part 2*)

newInput = ArrayFlatten[Table[Mod[input + i + j, 9, 1], {i, 0, 4}, {j, 0, 4}]];
g = createAdjacencyGraph[newInput];
GraphDistance[g, toVertex[{1, 1}], toVertex[Dimensions@newInput]]
