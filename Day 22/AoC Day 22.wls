#!/usr/bin/env wolframscript
(* ::Package:: *)

(*Written December 22nd, 2021.*)


(*Import & Setup*)

input=
Select[#,StringLength[#]>=1&]&/@StringSplit[Import[FileNameJoin[{NotebookDirectory[],"Day22Input.txt"}],"List"],Alternatives[".","=",",","x","y","z"," "]];
input[[;;,2;;]]=ToExpression[input[[;;,2;;]]];


(*Part 1*)

cubes = SparseArray[{1, 1, 1} + 50 + 1 -> 0, {101, 101, 101}];
Do[
  line = Join[{l[[1]]}, Max[Min[#, 51], -51] + 51 & /@ l[[2 ;;]]];
  If[Min[line[[2 ;;]]] == 0 \[Or] Max[line[[2 ;;]]] == 102, 
   Continue[]];
  If[line[[1]] == "on",
   cubes[[
     Sequence @@ (#[[1]] ;; #[[2]] & /@ 
        Partition[line[[2 ;;]], 2])]] = 1,
   cubes[[
     Sequence @@ (#[[1]] ;; #[[2]] & /@ 
        Partition[line[[2 ;;]], 2])]] = 0
   ]
  , {l, input}];
Total[Total[Total[cubes]]]


(*Part 2*)

i = 0;
rectangles = Table[
   i += 1;
   word = line[[1]];
   {i, word, Partition[line[[2 ;;]], 2]}
   , {line, input}];

lim = Length[input];

xRange = Union[Flatten[{0, 1} + # & /@ rectangles[[;; lim, 3, 1]]]];
yRange = Union[Flatten[{0, 1} + # & /@ rectangles[[;; lim, 3, 2]]]];
zRange = Union[Flatten[{0, 1} + # & /@ rectangles[[;; lim, 3, 3]]]];

diffX = Join[Differences[xRange], {1}];
diffY = Join[Differences[yRange], {1}];
diffZ = Join[Differences[zRange], {1}];

xReplace = Thread[xRange -> Range[Length[xRange]]];
yReplace = Thread[yRange -> Range[Length[yRange]]];
zReplace = Thread[zRange -> Range[Length[zRange]]];

sparse = Table[
   0, {x, Length[xRange]}, {y, Length[yRange]}, {z, Length[zRange]}];
AbsoluteTiming[
  Do[
   globalWatch = r[[1]];
   {xMin, xMax} = (r[[3, 1]] + {0, 1} /. xReplace) - {0, 1};
   {yMin, yMax} = (r[[3, 2]] + {0, 1} /. yReplace) - {0, 1};
   {zMin, zMax} = (r[[3, 3]] + {0, 1} /. zReplace) - {0, 1};
   Which[
    r[[2]] == "on",
    sparse[[xMin ;; xMax, yMin ;; yMax, zMin ;; zMax]] = 1,

    r[[2]] == "off",
    sparse[[xMin ;; xMax, yMin ;; yMax, zMin ;; zMax]] = 0];
   , {r, rectangles[[;; lim]]}];

  sum = 0;
  Do[sum += diffX[[x]]*diffY[[y]]*diffZ[[z]]*sparse[[x, y, z]], {x, Length[diffX]}, {y, Length[diffY]}, {z, Length[diffZ]}]
  ];
sum


(*Input File for Rust*)

Export[
  FileNameJoin[{NotebookDirectory[],"Day22TrimmedInput.txt"}],
  StringDelete[ToString[#],Alternatives["{","}",","]]&/@input]
