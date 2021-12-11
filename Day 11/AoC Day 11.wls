#!/usr/bin/env wolframscript
(* ::Package:: *)

(* Written December 11th, 2021. *)

(*Import & Setup*)

input = IntegerDigits/@ToExpression/@StringSplit[Import[FileNameJoin[{NotebookDirectory[],"Day11Input.txt"}]]];

newState[state_List] := Partition[state, {3, 3}, {1, 1}, {2, -2}, {}];

step[{count_, i_, inp_}] :=  
  Module[{hasFlashed = inp*0 + 1, toIncrease, new = inp + 1, nines},
   nines = Position[new, _?(# > 9 &)];
   
   While[Length[nines] > 0,
	hasFlashed = MapAt[0 &, hasFlashed, nines];
	toIncrease = Map[Count[#, _?(# > 9 &), 2] &, newState[new], {2}];
	new = (new + toIncrease)*hasFlashed;
	nines = Position[new, _?(# > 9 &)];
	];
   {count + Total[Total[1 - hasFlashed]], i + 1, new}
  ];

NestWhile[step, {0, 0, input}, Total[Total[#[[3]]]] != 0 &][[2]]


(*Part 1*)

Nest[step, {0, 0, input}, 100][[1]]


(*Part 2*)

NestWhile[step, {0, 0, input}, Total[Total[#[[3]]]] != 0 &][[2]]
