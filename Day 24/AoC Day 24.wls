#!/usr/bin/env wolframscript
(* ::Package:: *)

(*Written December 24th, 2021.*)

(*Import & Setup*)


input=StringSplit/@StringSplit[Import[FileNameJoin[{NotebookDirectory[],"Day24Input.txt"}]],"\n"];
toExpression[inputText_]:=
  Map[
   If[!IntegerQ[#]\[And]StringMatchQ[#,Alternatives["+","-",""]~~DigitCharacter..],ToExpression[#],#]&,
   inputText,
  {2}];
input=toExpression[input];
custom=SplitBy[input,#[[1]]=="inp"&][[2;;;;2,{4,5,15},3]];


(*Full Emulator*)

(* 99911952827284 is the first solution I got checking randomly with Rust; out of the 168198 possible solutions, it is #4088. *)

command[line_, st_] :=
 Module[{s = st, 
   arg2 = If[Length[line] == 3, 
     If[! StringQ@line[[3]], line[[3]], st[[line[[3]]]]], 0]},
  Which[
   line[[1]] == "inp", s[[line[[2]]]] = s[["inp"]][[1]]; s[["inp"]] = RotateLeft[s[["inp"]]],
   line[[1]] == "add", s[[line[[2]]]] += arg2,
   line[[1]] == "mul", s[[line[[2]]]] *= arg2,
   line[[1]] == "div", s[[line[[2]]]] = IntegerPart[s[[line[[2]]]]/arg2],
   line[[1]] == "mod", s[[line[[2]]]] = Mod[s[[line[[2]]]], arg2],
   line[[1]] == "eql", If[s[[line[[2]]]] == arg2, s[[line[[2]]]] = 1, s[[line[[2]]]] = 0]
   ];
  s]

instructions[inp_, w_] := Module[{state},
  state = 
   Association["w" -> 0, "x" -> 0, "y" -> 0, "z" -> 0, "inp" -> w];
  Do[
   state = command[line, state],
   {line, input}];
  state]


(* ::Subsubsection:: *)
(*Optimized Hybrid Emulator*)


(* ::Text:: *)
(*The idea here:*)
(*	N: A number between 1 and 14; we're going to work from both ends towards the middle, and N is where we'll meet.*)
(*	custom: A variable with the parameters of the input which change from one digit to the next.*)
(*	uniqueZs: The unique values of z possible at each step, starting from the first step and going to step N*)
(*	uniqueZs2: The unique values of z possible at each step, starting from the last step and going to step N.*)
(*	middle: The unique values of z at position N.*)
(*Feed the variable `middle` into Rust, and then we can brute force only the first N digits, where N is Length[uniqueZs].*)
(*Runtime (N = 9):*)
(*	Mathematica: 259 seconds.*)
(*	Rust: 22 seconds.*)
(*	Combined: 281 seconds.*)

component[z_, w_, {d_, a1_, a2_}] :=
  Module[{x, newZ},
   x = Boole[Mod[z, 26] != w - a1];
   newZ = IntegerPart[z/d]*(25*x + 1) + (w + a2)*x];

uniqueZs = {{0}};
Do[
 AppendTo[uniqueZs, 
   Union@Flatten[
     Table[component[z, w, custom[[line]]], {w, 1, 9}, {z, 
       uniqueZs[[-1]]}]]];
 , {line, 9}];

solutions = {{{0, 0}}};
Do[
 temp = ReplaceAll[
   component[z, w, custom[[-line]]], {Mod[z_, 26] :> b, 
    IntegerPart[z_/26] :> a, IntegerPart[z_] :> 26*a + b}];
 AppendTo[solutions,
  Flatten[
   Table[
    {w, a*26 + b} /. # & /@ 
     Solve[temp == zNext \[And] 0 <= b < 26, {a, b}, Integers],
    {zNext, Union[solutions[[-1, ;; , -1]]]}, {w, 1, 9}], 2]];
 , {line, 1, 5}];
uniqueZs2 = Union[#[[;; , -1]]] & /@ solutions;

middle = Intersection[uniqueZs[[-1]], uniqueZs2[[-1]]]

(* ::Subsubsection:: *)
(*Optimized Mathematica Emulator, Slow Solve[]*)


(* ::Text:: *)
(*Same idea, but this time keep I'll keep track of the highest and lowest digit pair which can lead to each z, and combine directly, so that there's no need to iterate through in Rust.*)
(*There's a trailing zero for syntax reasons; it should not be included in the final tally.*)
(*Also, since the number of valid Z values actually goes back down with every `div z 1` command, we can do this all in one pass.*)
(**)
(*Runtime:*)
(*	Mathematica: 817 seconds.*)

component2[z_, w_, {d_, a1_, a2_}] :=
  Module[{x, newZ},
   x = Boole[Mod[z, 26] != w - a1];
   newZ = IntegerPart[z/d]*(25*x + 1) + (w + a2)*x];
   
AbsoluteTiming[
 solutions = {{{{}, 0}}};
 Do[
  eq = ReplaceAll[
    component2[z, w, custom[[-line]]], {Mod[z_, 26] :> b, 
     IntegerPart[z_/26] :> a, IntegerPart[z_] :> 26*a + b}];
  temp = Flatten[
    Table[
     Table[
      {Join[{w}, solutions[[-1, z, 1]]], a*26 + b} /. # & /@ 
       Solve[eq == solutions[[-1, z, 2]] \[And] 0 <= b < 26, {a, b}, 
        Integers], {w, 1, 9}],
     {z, Length[solutions[[-1]]]}], 2];
  AppendTo[
   solutions,
   Union@Flatten[{#[[1]], #[[-1]]} & /@ GatherBy[temp, Last], 1]];
  globalWatch = {line, Length /@ solutions};
  , {line, 1, 14}];
 FromDigits/@solutions[[-1,{-1,1},1]]]
