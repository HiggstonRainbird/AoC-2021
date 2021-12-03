#!/usr/bin/env wolframscript
(* ::Package:: *)

(* ::Text:: *)
(*Written December 3rd, 2021.*)

(*Import*)

input=Select[Import[FileNameJoin[{NotebookDirectory[],"Day3Input.txt"}],"Table"],Length[#]>0&];
fullInput=PadLeft[IntegerDigits[#],12]&/@Flatten[input];


(*Part 1*)

FromDigits[#,2]*FromDigits[1-#,2]&@
	(SortBy[Tally[#],Last][[1,1]]&/@Transpose[fullInput])


(*Part 2*)

oxygen=fullInput; carbon=fullInput;
Do[
	most=SortBy[Tally[oxygen[[;;,i]]],Last][[2,1]];
	least=SortBy[Tally[carbon[[;;,i]]],Last][[1,1]];
	If[Length[oxygen]>1,oxygen=Select[oxygen,#[[i]]==most&]];
	If[Length[carbon]>1,carbon=Select[carbon,#[[i]]==least&]];
,{i,12}];
FromDigits[carbon[[1]],2]*FromDigits[oxygen[[1]],2]
