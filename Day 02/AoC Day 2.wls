#!/usr/bin/env wolframscript
(* ::Package:: *)

(* ::Text:: *)
(*Written December 2nd, 2021.*)

(*Input*)

input=Select[Import[FileNameJoin[{NotebookDirectory[],"Day2Input.txt"}],"Table"],Length[#]>0&];

toExpression[inputText_]:=
	Map[
		If[!IntegerQ[#]\[And]StringMatchQ[#,Alternatives["+","-",""]~~DigitCharacter..],ToExpression[#],#]&,
		inputText,
		{Depth[inputText]}]


(*Part 1*)

    state = {0, 0};
    replacement = {"forward" -> {1, 0}, "down" -> {0, 1}, "up" -> {0, -1}};
    Do[state += (i[[1]] /. replacement)*i[[2]], {i, toExpression[input]}];
    state[[1]]*state[[2]]

(*Part 2*)

    state = {0, 0, 0};
    replacement2[aim_] := {"forward" -> {1, aim, 0}, "down" -> {0, 0, 1}, "up" -> {0, 0, -1}};
    Do[state += (i[[1]] /. replacement2[state[[3]]])*i[[2]], {i, toExpression[input]}];
    state[[1]]*state[[2]]
