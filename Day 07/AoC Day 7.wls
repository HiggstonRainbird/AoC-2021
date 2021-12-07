#!/usr/bin/env wolframscript
(* ::Package:: *)

(* ::Text:: *)
(*Written December 7th, 2021.*)

(*Import & Setup*)

input=Select[Import[FileNameJoin[{NotebookDirectory[],"Day7Input.txt"}],"List"],StringLength[#]>0&];
input=ToExpression/@StringSplit[input," -> "|","][[1]];


(*Part 1*)

Table[Abs[input-i]//Total,{i,Union[input]}]//Min


(*Part 2*)

Table[#*(#+1)/2&/@Abs[input-i]//Total,{i,Union[input]}]//Min
