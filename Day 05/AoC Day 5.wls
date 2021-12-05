#!/usr/bin/env wolframscript
(* ::Package:: *)

(*Written December 5th, 2021.*)

(*Import*)

input=Select[Import[FileNameJoin[{NotebookDirectory[],"Day5Input.txt"}],"List"],StringLength[#]>0&];
input=Map[ToExpression,StringSplit[#,","]&/@StringSplit[input," -> "],{2}];

(*Setup*)

expandSingle[{a_, b_}, len_] := 
  If[a == b, Table[a, len + 1], Range[a, b, Sign[b - a]]];  
expand[pair_List] := 
  Transpose[Table[expandSingle[p, Max[Abs[Differences[pair]]]], {p, pair}]];

ClearAll@grid1; ClearAll@grid2;
grid1[{x_, y_}] := 0; grid2[{x_, y_}] := 0;


(*Parts 1 and 2*)


Do[
 grid2[#] += 1 & /@ expand[line];
 If[
  Min[Abs[line[[1]] - line[[2]]]] == 0,
  grid1[#] += 1 & /@ expand[line]
  ],
 {line, input}]

{Count[DownValues[grid1][[;; , -1]], _?(# > 1 &)] (* Part 1 *),
 Count[DownValues[grid2][[;; , -1]], _?(# > 1 &)] (* Part 2 *)}
