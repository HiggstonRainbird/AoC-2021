#!/usr/bin/env wolframscript
(* ::Package:: *)

(*Written December 8th, 2021.*)


(* ::Input:: *)

input = Select[Import[FileNameJoin[{NotebookDirectory[], "Day8Input.txt"}], "Table"], Length[#] > 0 &];
input = Join[#[[;; 10]], #[[12 ;;]]] & /@ input;

stringSort[s_] := StringJoin[Sort[Characters[s]]];
rules = {"abcefg" -> 0, "cf" -> 1, "acdeg" -> 2, "acdfg" -> 3, 
   "bcdf" -> 4, "abdfg" -> 5, "abdefg" -> 6, "acf" -> 7, 
   "abcdefg" -> 8, "abcdfg" -> 9};
sorted = rules[[;; , 1]];

(*Part 1*)

Count[Flatten[input[[;; , -4 ;;]]], _?(MemberQ[{2, 4, 3, 7}, StringLength[#]] &)]


(*Part 2 Brute Force*)

allPossibilities = Thread[CharacterRange["A", "G"] -> #] & /@ Permutations[CharacterRange["a", "g"]];
Table[
  FromDigits[
   Select[
      Table[
       StringJoin[Sort[Characters[#]]] & /@ 
        StringReplace[
         ToUpperCase[StringJoin@Sort[Characters[#]]] & /@ 
          Flatten[line], r],
       {r, allPossibilities}],
      Length[Complement[sorted, #]] == 0 &][[1, -4 ;;]] /. reverse]
  , {line, input}] // Total

(*Part 2 Short-Circuited BFS*)

allPossibilities = Thread[CharacterRange["A", "G"] -> #] & /@ Permutations[CharacterRange["a", "g"]];
whittle[test_] :=
  Module[{poss = allPossibilities, upper = ToUpperCase[stringSort[#]] & /@ test},
   Do[
    poss = Select[poss, MemberQ[sorted, stringSort[StringReplace[t, #]]] &],
    {t, SortBy[upper, StringLength]}];
   FromDigits[stringSort /@ StringReplace[upper[[-4 ;;]], poss[[1]]] /. rules]];
Total[whittle /@ input]

(*Part 2 Frequency Analysis*)

This methodology (getting signatures via character frequencies) is NOT guaranteed to be unique.

frequency = #[[1]] -> #[[2]] & /@ Tally[Flatten[Characters /@ sorted]];
sigReplacement = 
  Sort[Characters[#[[1]]] /. frequency] -> #[[2]] & /@ rules;

convertLine[line_] :=
  Module[{tempFreq},
   tempFreq = #[[1]] -> #[[2]] & /@ 
     Tally[Flatten[Characters /@ line[[;; 10]]]];
   FromDigits[
    Sort[Characters[#] /. tempFreq] /. sigReplacement & /@ 
     line[[11 ;;]]]
   ];
Total[convertLine /@ input]
