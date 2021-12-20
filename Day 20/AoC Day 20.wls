#!/usr/bin/env wolframscript
(* ::Package:: *)

(*Written December 20th, 2021.*)


(*Import & Setup*)

input = Characters[StringSplit[#]] & /@ 
   StringSplit[
    Import[FileNameJoin[{NotebookDirectory[], "Day20Input.txt"}]], 
    "\n\n"];
input = input /. {"." -> 0, "#" -> 1};
input[[1]] = Flatten[input[[1]]];


(*Parts 1 & 2*)

end = input[[2]];
Do[
 middle = Map[
   input[[1, FromDigits[Join @@ #, 2] + 1]] &,
   Partition[ArrayPad[end, 1, input[[1, -1]]], {3, 3}, {1, 1}, {2, -2},
     input[[1, -1]]],
   {2}];
 end = Map[
   input[[1, FromDigits[Join @@ #, 2] + 1]] &,
   Partition[
    ArrayPad[middle, 1, input[[1, 1]]], {3, 3}, {1, 1}, {2, -2}, 
    input[[1, 1]]],
   {2}];
 If[i == 1, part1 = Total[Total[end]]]
 , {i, 25}]
part2 = Total[Total[end]];
{part1, part2}
