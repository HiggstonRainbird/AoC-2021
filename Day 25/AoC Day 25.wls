#!/usr/bin/env wolframscript
(* ::Package:: *)

(*Written December 25th, 2021.*)

input=Characters/@StringSplit[Import[FileNameJoin[{NotebookDirectory[],"Day25Input.txt"}]],"\n"];
ClearAll@seen;
down[inp_] := RotateLeft[Map[# == "." &, inp, {2}]];
right[inp_] := RotateLeft /@ Map[# == "." &, inp, {2}];
Do[
 seen[hot] = input;
 newInput = input;
 
 r = right[input];
 Do[If[input[[i, j]] == ">" \[And] r[[i, j]], newInput[[i, j]] = "."; 
   newInput[[i, Mod[j + 1, Length[input[[i]]], 1]]] = ">"],
  {i, 1, Length[input]}, {j, 1, Length[input[[i]]]}];
 
 input = newInput;
 d = down[input];
 Do[If[input[[i, j]] == "v" \[And] d[[i, j]], newInput[[i, j]] = "."; 
   newInput[[Mod[i + 1, Length[input], 1], j]] = "v"],
  {i, 1, Length[input]}, {j, 1, Length[input[[i]]]}];
 
 input = newInput;
 If[seen[count] === input, Return[count + 1];],
 {count, 0, 100000}]
