#!/usr/bin/env wolframscript
(* ::Package:: *)

(* ::Text:: *)
(*Written December 18th, 2021.*)


(* ::Subsubsection:: *)
(*Import & Setup*)


(* ::Input:: *)
(*input=ToExpression/@StringReplace[StringSplit[Import[FileNameJoin[{NotebookDirectory[],"Day18Input.txt"}]],"\n"],{"["->"{","]"->"}"}];*)


(* ::Input:: *)
(*input=ToExpression/@StringReplace[StringSplit[Import[FileNameJoin[{NotebookDirectory[],"Day18SampleInput.txt"}]],"\n"],{"["->"{","]"->"}"}];*)


(* ::Subsubsection:: *)
(*Part 1*)


(* ::Input:: *)
(*nextStep[s_]:=*)
(*Module[{*)
(*string=s,*)
(*integerPositions,*)
(*left,leftRegular,right,rightRegular,*)
(*reg,pos},*)
(*integerPositions=Position[string,_Integer,Infinity,Heads->False];*)
(**)
(*pos=FirstPosition[integerPositions,_?(Length[#]==5&),{None},Infinity,Heads->False][[1]];*)
(*If[pos=!=None,*)
(*left=Sequence@@integerPositions[[pos]];*)
(*right=Sequence@@(integerPositions[[pos]]+{0,0,0,0,1});*)
(*leftRegular=If[pos-1>=1,pos-1,None];*)
(*rightRegular=If[pos+2<=Length[integerPositions],pos+2,None];*)
(**)
(*If[leftRegular=!=None,string=MapAt[#+string[[left]]&,string,integerPositions[[leftRegular]]]];*)
(*If[rightRegular=!=None,string=MapAt[#+string[[right]]&,string,integerPositions[[rightRegular]]]];*)
(*string=MapAt[0&,string,integerPositions[[pos,;;-2]]];*)
(*Return[string,Module];*)
(*];*)
(**)
(*pos=FirstPosition[integerPositions,_?(Extract[string,#]>=10&),{None},Infinity,Heads->False][[1]];*)
(*If[pos=!=None,*)
(*string=MapAt[{Floor[#/2],Ceiling[#/2]}&,string,integerPositions[[pos]]];*)
(*Return[string,Module];*)
(*];*)
(**)
(*Return[string,Module];*)
(*];*)
(**)
(*fullReduce[s_]:=FixedPoint[nextStep,s];*)
(*ClearAll@magnitude;*)
(*magnitude[n_]:=If[Head[n]===Integer,n,magnitude[n[[1]]]*3+magnitude[n[[2]]]*2]*)


(* ::Input:: *)
(*magnitude@Fold[fullReduce[{#1,#2}]&,input]*)


(* ::Subsubsection:: *)
(*Part 2*)


(* ::Input:: *)
(*Max[{magnitude[fullReduce@#],magnitude[fullReduce@Reverse[#]]}&/@Subsets[input,{2}]]*)
