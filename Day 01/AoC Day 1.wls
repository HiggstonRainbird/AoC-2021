#!/usr/bin/env wolframscript
(* ::Package:: *)

(* ::Text:: *)
(*Written December 1st, 2021.*)


(*Import*)

input=Import[FileNameJoin[{NotebookDirectory[],"Day1Input.txt"}],"List"];

(*Part 1*)

Count[Differences[input],_?(#>0&)]

(*Part 2*)

Count[Differences[Total/@Partition[input,3,1]],_?(#>0&)]
