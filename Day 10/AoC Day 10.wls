#!/usr/bin/env wolframscript
(* ::Package:: *)

(*Written December 10th, 2021.*)


(*Import & Setup*)

input=Characters/@Select[Import[FileNameJoin[{NotebookDirectory[],"Day10Input.txt"}],"List"],StringLength[#]>0&];

matches = 
  Join[#, Reverse /@ #] &@{"(" -> ")", "{" -> "}", "[" -> "]", "<" -> ">"};
first = matches[[;; 4, 1]]; last = matches[[5 ;;, 1]];
parenMatches[input_List] :=
 Module[{posList = {}, ds = CreateDataStructure["Stack"], char},
  Do[
   char = input[[pos]];
   If[
    MemberQ[first, char], ds["Push", char],
    If[ds["Peek"] == (char /. matches), ds["Pop"], 
     Return[char, Module]]],
   {pos, Length[input]}];
  While[! ds["EmptyQ"], AppendTo[posList, ds["Pop"] /. matches]];
  Return[posList, Module]]


(*Part 1*)

part1Rules = {")" -> 3, "]" -> 57, "}" -> 1197, ">" -> 25137, x_List -> 0};
Total[(parenMatches[#] /. part1Rules & /@ input)]

    
(*Part 2*)

part2Rules = {")" -> 1, "]" -> 2, "}" -> 3, ">" -> 4};
Sort[FromDigits[# /. part2Rules, 5] & /@ 
 Select[parenPositions /@ input, Head[#] === List &]] // Median
