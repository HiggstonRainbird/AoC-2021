#!/usr/bin/env wolframscript
(* ::Package:: *)

(*Written December 13th, 2021.*)

(*Import & Setup*)

toExpression[inputText_]:=
	Map[
		If[!IntegerQ[#]\[And]StringMatchQ[#,Alternatives["+","-",""]~~DigitCharacter..],ToExpression[#],#]&,
		inputText,
		{2}]

input = StringSplit[Import[FileNameJoin[{NotebookDirectory[], "Day13Input.txt"}]], "\n"];
dots = toExpression@StringSplit[Select[input, StringContainsQ[","]], ","];
folds = toExpression@StringSplit[Select[input, StringContainsQ["fold"]], " " | "="][[;; , -2 ;;]];
maxX = Select[folds, #[[1]] == "x" &][[1, 2]]*2 + 1;
maxY = Select[folds, #[[1]] == "y" &][[1, 2]]*2 + 1;

(*Parts 1 & 2*)

array = Transpose[SparseArray[# + 1 -> 1 & /@ dots, {maxX, maxY}]];

Do[
  If[folds[[f, 1]] == "y",
   array = array[[;; folds[[f, 2]]]] + Reverse@array[[folds[[f, 2]] + 2 ;;]],
   array = array[[;; , ;; folds[[f, 2]]]] + SparseArray[Reverse /@ array[[;; , folds[[f, 2]] + 2 ;;]]]];
  If[f == 1, Print[Length[array["NonzeroValues"]]]];
  , {f, Length[folds]}];
ArrayPlot[array]
