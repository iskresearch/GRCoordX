(* ::Package:: *)

(* ::Title:: *)
(*Einstein Atlas*)


(* ::Subtitle:: *)
(*A comprehensive database of spacetime solutions and their properties*)


(* ::Chapter:: *)
(*Initializations*)


BeginPackage["EinsteinAtlas`", {"xAct`xTensor`", "xAct`xCoba`", "xAct`xPerm`"}];


Print["Einstein-Atlas"]
LoadSpacetime::usage = "SpacetimeLoad[name, chart, manifold]: Automatically generates a metric in that chart for a given manifold."
ChartsFor::usage = "ChartsFor[name]: returns a list of all possible charts for a given spacetime name."

(* General Information regarding the package *) 
AllSpacetimes::usage = "AllSpacetimes[]: returns a list of all available spacetimes."
AllCharts::usage = "AllChart[]: returns a list of all available charts."

(* Generation of Catalogs *)
GenerateCatalogFor::usage = "GenerateCatalogFor[name]: generates a complete catalog for a given spacetime."


(* ::Chapter:: *)
(*Dataset Query*)


(* ::Text:: *)
(*We use a method of passively adding metrics and evaluations so that unnecessary computations do not occur. For this we would use a data set of json files to keep  *)


(* ::Chapter:: *)
(*Loading Spacetimes*)
