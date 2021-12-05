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
  Transpose[Table[expandSingle[t, Max[Abs[Differences[tuple]]]], {t, tuple // Transpose}]];


(*Part 1*)

part1 = Count[
           Tally[Flatten[expand /@ Select[input, Min[Abs[Differences[#]]] == 0 &], 1]],
           _?(#[[2]] > 1 &)];

(*Part 2*)

part2 = Count[Tally[Flatten[expand /@ input, 1]], _?(#[[2]] > 1 &)];
