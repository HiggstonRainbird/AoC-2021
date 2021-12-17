#!/usr/bin/env wolframscript
(* ::Package:: *)

(*Written December 17th, 2021.*)


(*Import & Setup*)

inp={{169,206},{-108,-68}};
probeStep[{pos_, v_}] := {pos + v, {v[[1]] - Sign[v[[1]]], v[[2]] - 1}};
withinRange[pos_, inp_] := 
  If[inp[[1, 1]] <= pos[[1]] <= inp[[1, 2]] \[And] 
    inp[[2, 1]] <= pos[[2]] <= inp[[2, 2]], True, False];

minX = Ceiling[x /. Solve[x*(x + 1)/2 == inp[[1, 1]], x][[1]]];
maxX = inp[[1, 2]]; minY = inp[[2, 1]]; maxY = -inp[[2, 2]];

shots = Flatten[Table[
    {{vx, vy},
     NestWhileList[
      probeStep,
      {{0, 0}, {vx, vy}},
      #[[1, 1]] <= inp[[1, 2]] \[And] #[[1, 2]] >= inp[[2, 1]] &]},
    {vx, minX, maxX}, {vy, minY, maxY}], 1];


(*Part 1*)

Max[Flatten[Select[shots, Function[traj, AnyTrue[traj[[2]], withinRange[#[[1]], inp] &]]][[;; , 2, ;; , 1, 2]]]]


(*Part 2*)

Count[shots, _?(Function[traj, AnyTrue[traj[[2]], withinRange[#[[1]], inp] &]])]
