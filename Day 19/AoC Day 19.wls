#!/usr/bin/env wolframscript
(* ::Package:: *)

(*Written December 19th, 2021.*)


(*Import & Setup*)

input=Partition[StringSplit[#,"\n"|","],3]&/@StringSplit[Import[FileNameJoin[{NotebookDirectory[],"Day19Input.txt"}]],"--- scanner "~~DigitCharacter..~~" ---\n"];
input=Map[ToExpression,input,{2}];

orientationList = Flatten[Table[{i, j, k}, {i, {-1, 1}}, {j, {-1, 1}}, {k, {-1, 1}}], 2];
allOrientations[beacon_] := 
  Flatten[Table[
    o*beacon[[#]] & /@ Permutations[Range[3]], {o, orientationList}], 
   1];
overlaps[beaconList_] := Module[{b = {}, tmp},
   Do[
    tmp = SortBy[beaconList, #[[dim]]*p &][[;; 12]];
    Do[AppendTo[b, Sort[o]], {o, Transpose[allOrientations /@ tmp]}],
    {dim, 1, 3}, {p, {-1, 1}}];
   b];
overlaps2[beaconList_] := 
  Select[overlaps[beaconList], SubsetQ[beaconList, #] &];

offsetQ[beaconList1_, beaconList2_] :=
  Module[{testList, firstMatch},
   testList = Flatten[Table[{o1, o2},
      {o1, overlaps2[beaconList1]},
      {o2, overlaps[beaconList2]}], 1];
   firstMatch = 
    Select[testList, Length[DeleteDuplicates[#[[1]] - #[[2]]]] == 1 &];
   
   If[Length[firstMatch] == 1,
    firstMatch[[1, 1, 1]] - firstMatch[[1, 2, 1]],
    None]
   ];


(*Part 1*)

scanners = Association[1 -> <|"Offset" -> {0, 0, 0}, "Beacons" -> input[[1]]|>];
toScan = Range[2, Length[input]];
allBeacons = input[[1]];

keepGoing = True;
While[keepGoing,
  keepGoing = False;
  Do[
   offset = offsetQ[scanners[old]["Beacons"], input[[new]]];
   
   If[offset =!= None,
    newBeacons = MinimalBy[
       Map[# + offset &, 
        Transpose[allOrientations /@ input[[new]]], {2}],
       Length[Union[#, allBeacons]] &][[1]];
    allBeacons = Union[allBeacons, newBeacons];
    AssociateTo[scanners, 
     new -> <|"Offset" -> offset, "Beacons" -> newBeacons|>];
    toScan = DeleteCases[toScan, new];
    keepGoing = True;
    Break[];
    ], {new, toScan}, {old, Keys[scanners]}];
  ];
Length[allBeacons]


(*Part 2*)

Max[Total[Abs[#[[1]]-#[[2]]]]&/@Subsets[scanners[#]["Offset"]&/@Keys[scanners],{2}]]
