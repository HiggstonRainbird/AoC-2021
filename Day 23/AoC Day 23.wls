#!/usr/bin/env wolframscript
(* ::Package:: *)

(*Written December 23rd, 2021.*)


(*Part 1*)

depth = 2;
costs = Association["A" -> 1, "B" -> 10, "C" -> 100, "D" -> 1000];
destinations = 
  Association["A" -> {{3, 1}, {3, 2}}, 
   "B" -> {{5, 1}, {5, 2}}, 
   "C" -> {{7, 1}, {7, 2}}, 
   "D" -> {{9, 1}, {9, 2}}];
hallway = {{1, 0}, {2, 0}, {4, 0}, {6, 0}, {8, 0}, {10, 0}, {11, 0}};
ClearAll@trip;
trip[pos1_, pos2_] := trip[pos1, pos2] =
  DeleteDuplicates[Join[
     Table[{pos1[[1]], j}, {j, pos1[[2]], 0, -1}],
     Table[{i, 0}, {i, pos1[[1]], pos2[[1]], 
       Sign[pos2[[1]] - pos1[[1]]]}],
     Table[{pos2[[1]], j}, {j, 0, pos2[[2]], 1}]]][[
   2 ;;]];(* Note: this does not work when moving within the same \
well.*)

ClearAll@cost;
cost[amph_, pos1_, pos2_] := 
  cost[amph, pos1, pos2] = 
   If[pos1 == pos2, 0, costs[amph]*Length[trip[pos1, pos2]]];

filledPositions[s_] := Flatten[Values[s[["Positions"]]], 1];
well[s_, amph_] := Table[
   If[# =!= 0, {#[[1, 1]], s[["Positions", #[[1, 1]], #[[2]], 2]]}, 
      Nothing] &@
    FirstPosition[s[["Positions"]], d, 0, Heads -> False],
   {d, destinations[[amph]]}];

isEmpty[s_, dest_, amph_] :=
  Module[{w = well[s, amph]},
   Which[
    MemberQ[filledPositions[s], dest], Return[False, Module],
    Length[w] == 0 \[And] dest[[2]] == depth, Return[True, Module],
    Length[w] == 0 \[And] dest[[2]] != depth, Return[False, Module],
    DeleteDuplicates[w[[;; , 1]]] === {amph} \[And] 
     w[[;; , 2]] === Range[dest[[2]] + 1, depth], Return[True, Module],
    True, Return[False, Module]
    ]];

validMoves[s_, amph_, pos_] :=
  
  Module[{valid = {}, w = well[s, amph]},
   If[MemberQ[destinations[[amph]], pos] \[And] 
     DeleteDuplicates[w[[;; , 1]]] === {amph}, Return[{}, Module]];
   valid = Select[
     destinations[[amph]],
     ! IntersectingQ[filledPositions[s], trip[pos, #]] \[And]
       isEmpty[s, #, amph] &];
   If[
    ! MemberQ[hallway, pos],
    valid =
      Union[valid,
       Select[hallway,
        ! IntersectingQ[filledPositions[s], trip[pos, #]] &]];
    ];
   valid
   ];

nextStates[s_] :=
  Module[{valid = {}, newState},
   Flatten[
    Table[
     valid = validMoves[s, amph, s[["Positions", amph, i]]];
     Table[
      newState = s;
      newState[["Cost"]] += cost[amph, s[["Positions", amph, i]], v];
      AssociateTo[newState[["Positions"]], 
       amph -> Sort@Join[Delete[s[["Positions", amph]], i], {v}]]
      , {v, valid}]
     , {amph, Keys[s[["Positions"]]]}, {i, 1, depth}], 2]
   ];

costGather[states_List] := 
  SortBy[#, #[[1]][["Cost"]]][[1]] & /@ GatherBy[states, #[[2]] &];
minimumCost[s_] := Total@Table[
    Min[Total /@ 
      Table[cost[amph, pos1, pos2], {pos2, 
        destinations[[amph]]}, {pos1, s[["Positions", amph]]}]],
    {amph, Keys[s[["Positions"]]]}];

state =
  {Association[
    "Cost" -> 0,
    "Positions" -> <|"A" -> {{5, 4}, {7, 4}}, 
      "B" -> {{3, 4}, {9, 1}}, 
      "C" -> {{5, 1}, {9, 4}}, 
      "D" -> {{3, 1}, {7, 1}}|>]};

lowest = \[Infinity];
t = AbsoluteTime[];
Do[
  state = costGather[Flatten[nextStates /@ state, 1]];
  Do[If[s[["Positions"]] === destinations,
    lowest = Min[s[["Cost"]], lowest]], 
    {s, state}];
  If[Length[state] == 0, Break[]];
  globalWatch = {i, Length[state], lowest, AbsoluteTime[] - t};
  Print[globalWatch], {i, 1000}];
lowest


(* ::Subsubsection:: *)
(*Part 2*)

depth = 4;
costs = Association["A" -> 1, "B" -> 10, "C" -> 100, "D" -> 1000];
destinations = 
  Association["A" -> {{3, 1}, {3, 2}, {3, 3}, {3, 4}}, 
   "B" -> {{5, 1}, {5, 2}, {5, 3}, {5, 4}}, 
   "C" -> {{7, 1}, {7, 2}, {7, 3}, {7, 4}}, 
   "D" -> {{9, 1}, {9, 2}, {9, 3}, {9, 4}}];
hallway = {{1, 0}, {2, 0}, {4, 0}, {6, 0}, {8, 0}, {10, 0}, {11, 0}};
ClearAll@trip;
trip[pos1_, pos2_] := trip[pos1, pos2] =
  DeleteDuplicates[Join[
     Table[{pos1[[1]], j}, {j, pos1[[2]], 0, -1}],
     Table[{i, 0}, {i, pos1[[1]], pos2[[1]], 
       Sign[pos2[[1]] - pos1[[1]]]}],
     Table[{pos2[[1]], j}, {j, 0, pos2[[2]], 1}]]][[
   2 ;;]];(* Note: this does not work when moving within the same \
well.*)

ClearAll@cost;
cost[amph_, pos1_, pos2_] := 
  cost[amph, pos1, pos2] = 
   If[pos1 == pos2, 0, costs[amph]*Length[trip[pos1, pos2]]];

filledPositions[s_] := Flatten[Values[s[["Positions"]]], 1];
well[s_, amph_] := Table[
   If[# =!= 0, {#[[1, 1]], s[["Positions", #[[1, 1]], #[[2]], 2]]}, 
      Nothing] &@
    FirstPosition[s[["Positions"]], d, 0, Heads -> False],
   {d, destinations[[amph]]}];

isEmpty[s_, dest_, amph_] :=
  Module[{w = well[s, amph]},
   Which[
    MemberQ[filledPositions[s], dest], Return[False, Module],
    Length[w] == 0 \[And] dest[[2]] == depth, Return[True, Module],
    Length[w] == 0 \[And] dest[[2]] != depth, Return[False, Module],
    DeleteDuplicates[w[[;; , 1]]] === {amph} \[And] 
     w[[;; , 2]] === Range[dest[[2]] + 1, depth], Return[True, Module],
    True, Return[False, Module]
    ]];

validMoves[s_, amph_, pos_] :=
  
  Module[{valid = {}, w = well[s, amph]},
   If[MemberQ[destinations[[amph]], pos] \[And] 
     DeleteDuplicates[w[[;; , 1]]] === {amph}, Return[{}, Module]];
   valid = Select[
     destinations[[amph]],
     ! IntersectingQ[filledPositions[s], trip[pos, #]] \[And]
       isEmpty[s, #, amph] &];
   If[
    ! MemberQ[hallway, pos],
    valid =
      Union[valid,
       Select[hallway,
        ! IntersectingQ[filledPositions[s], trip[pos, #]] &]];
    ];
   valid
   ];

nextStates[s_] :=
  Module[{valid = {}, newState},
   Flatten[
    Table[
     valid = validMoves[s, amph, s[["Positions", amph, i]]];
     Table[
      newState = s;
      newState[["Cost"]] += cost[amph, s[["Positions", amph, i]], v];
      AssociateTo[newState[["Positions"]], 
       amph -> Sort@Join[Delete[s[["Positions", amph]], i], {v}]]
      , {v, valid}]
     , {amph, Keys[s[["Positions"]]]}, {i, 1, depth}], 2]
   ];

costGather[states_List] := 
  SortBy[#, #[[1]][["Cost"]]][[1]] & /@ GatherBy[states, #[[2]] &];
minimumCost[s_] := Total@Table[
    Min[Total /@ 
      Table[cost[amph, pos1, pos2], {pos2, 
        destinations[[amph]]}, {pos1, s[["Positions", amph]]}]],
    {amph, Keys[s[["Positions"]]]}];

state =
  {Association[
    "Cost" -> 0,
    "Positions" -> <|"A" -> {{5, 4}, {7, 4}, {7, 3}, {9, 2}}, 
      "B" -> {{3, 4}, {9, 1}, {5, 3}, {7, 2}}, 
      "C" -> {{5, 1}, {9, 4}, {5, 2}, {9, 3}}, 
      "D" -> {{3, 1}, {7, 1}, {3, 2}, {3, 3}}|>]};

lowest = \[Infinity];
t = AbsoluteTime[];
Do[
  state = costGather[Flatten[nextStates /@ state, 1]];
  Do[If[s[["Positions"]] === destinations,
    lowest = Min[s[["Cost"]], lowest]], 
    {s, state}];
  If[Length[state] == 0, Break[]];
  globalWatch = {i, Length[state], lowest, AbsoluteTime[] - t};
  Print[globalWatch], {i, 1000}];
lowest
