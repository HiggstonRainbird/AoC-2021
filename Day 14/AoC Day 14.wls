#!/usr/bin/env wolframscript
(* ::Package:: *)

(*Written December 14th, 2021.*)

(*Import & Setup*)

input=StringSplit[Import[FileNameJoin[{NotebookDirectory[],"Day14Input.txt"}]],"\n"];
start = input[[1]];
rules = #[[1]] -> Characters[#[[1]]][[1]] ~~ #[[2]] & /@ StringSplit[input[[3 ;;]], " -> "];
rules2 = #[[1]] -> {Characters[#[[1]]][[1]] ~~ #[[2]], #[[2]] ~~ Characters[#[[1]]][[2]]} & /@ 
   StringSplit[input[[3 ;;]], " -> "];
tallyGather[tallies_List] := {#[[1, 1]], Total[#[[;; , 2]]]} & /@ GatherBy[Flatten[tallies, 1], First]


(*Part 1*)

SortBy[Tally[
  Characters[
   Nest[StringJoin[(StringJoin /@ 
         Partition[Characters[#], 2, 1, {1, -2}, {}] /. rules)] &, 
    start, 10]]], Last]


(*Part 2*)

tallies = ({StringJoin[#[[1]]], #[[2]]} & /@ Tally[Partition[Characters[start], 2, 1, {1, -2}, {}]])[[;; -2]];
Do[
  tallies = tallyGather[
    Table[{{#[[1]], t[[2]]}, {#[[2]], t[[2]]}} &@(t[[1]] /. 
        rules2), {t, tallies}]], 
  {i, 40}];
SortBy[
 tallyGather[
  Join[{{Characters[#[[1]]][[1]], #[[2]]}} & /@ tallies,
   {{{StringTake[start, -1], 1}}}]],
 Last]
