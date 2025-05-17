#!/bin/bash

# Script to create Mathematica notebooks for each metric in various coordinate systems

# Array of coordinate systems from basic to advanced
coordinates=(
    "cartesian"
    "spherical"
    "cylindrical"
    "plane-polar"
    "prolate-spheroidal"
    "oblate-spheroidal"
    "parabolic"
    "toroidal"
    "bipolar"
    "bispherical"
    "conical"
    "paraboloidal"
    "elliptic-cylindrical"
    "confocal-ellipsoidal"
    "eddington-finkelstein"
    "kruskal-szekeres"
    "painleve-gullstrand"
    "lemaitre"
    "novikov"
    "isotropic"
    "harmonic"
    "gaussian-normal"
    "fermi-normal"
    "regge-wheeler"
    "bondi"
    "newman-penrose"
    "conformal"
    "comoving"
    "synchronous"
    "proper-distance"
    "weyl-canonical"
    "gaussian-null"
    "light-cone"
    "null"
    "rindler"
    "boyer-lindquist"
    "kerr-schild"
    "jacobi-elliptic"
    "poincare-half-space"
    "poincare-disk"
    "twistor"
    "horocyclic"
    "geodesic-polar"
    "curvature"
    "isothermal"
    "complex"
    "milne"
    "static-patch"
    "global-patch"
    "penrose"
    "kaluza-klein"
    "horospheric"
    "szekeres-szafron"
    "tetrad-frames"
    "newman-unti"
    "bms"
    "york-time"
    "double-null"
    "advanced-retarded-time"
    "hyperspherical"
)

# Function to create Mathematica notebook template
create_notebook() {
    local metric_name=$1
    local coord_name=$2
    local folder_name=$3
    local notebook_path="${folder_name}/${metric_name}-in-${coord_name}.nb"
    
    # Create the notebook content with a minimal template
    cat > "$notebook_path" << EOL
(* ::Package:: *)

(* ::Title:: *)
(*${metric_name} Metric in ${coord_name} Coordinates*)

(* ::Subtitle:: *)
(*GRCoordX Project - Exact Solutions in General Relativity*)

(* ::Text:: *)
(*This notebook analyzes the ${metric_name} metric transformed into ${coord_name} coordinates.*)

(* ::Section:: *)
(*Setup and Package Loading*)

<< xAct\`xTensor\`
<< xAct\`xCoba\`
(* Optional: << xAct\`xTras\` *)

(* ::Section:: *)
(*Manifold and Coordinate System Definition*)

DefManifold[M, 4, {a, b, c, d, e, f}]
(*Define appropriate charts for original and transformed coordinates*)

(* ::Section:: *)
(*Original Metric Definition*)

(*Define the ${metric_name} metric in its standard form*)

(* ::Section:: *)
(*Coordinate Transformation Definition*)

(*Define the explicit transformation from standard to ${coord_name} coordinates*)

(* ::Section:: *)
(*Jacobian Computation*)

(*Compute the Jacobian of the transformation*)

(* ::Section:: *)
(*Metric Transformation*)

(*Transform the metric using the Jacobian*)

(* ::Section:: *)
(*Verification and Simplification*)

(*Verify and simplify the transformed metric*)

(* ::Section:: *)
(*Metric Analysis*)

(* ::Subsection:: *)
(*Metric Signature*)

(* ::Subsection:: *)
(*Determinant*)

(* ::Subsection:: *)
(*Curvature Scalars*)

(* ::Subsection:: *)
(*Coordinate Ranges and Singularities*)

(* ::Subsection:: *)
(*Horizon Conditions*)

(* ::Subsection:: *)
(*Killing Vector Fields*)

(* ::Subsection:: *)
(*Light Cone Structure*)

(* ::Subsection:: *)
(*Jacobian Invertibility*)

(* ::Section:: *)
(*Visualization (Optional)*)

(*Plot coordinate surfaces or other visualizations*)

(* ::Section:: *)
(*Conclusions*)

(*Summarize findings about the ${metric_name} metric in ${coord_name} coordinates*)
EOL

    echo "Created: $notebook_path"
}

# Main execution

# List of folders (extract from your list)
folders=(
    "1-minkowski"
    "2-schwarzschild"
    "3-kerr"
    "4-desitter"
    "5-anti-de-sitter"
    "6-reissner-nordstrom"
    "7-kerr-newman"
    "8-flrw"
    "9-taub-nut"
    "10-bianchi"
    "11-goedel"
    "12-vaidya"
    "13-kasner"
    "14-pp-wave"
    "15-petrov-type-d"
    "16-btz-black-hole"
    "17-c"
    "18-weyl"
    "19-lewis-papapetrou"
    "20-majumdar-papapetrou"
    "21-bonnor-metzner-sachs"
    "22-ernst"
    "23-melvin"
    "24-lemaitre-tolman-bondi"
    "25-szekeres"
    "26-robinson-trautman"
    "27-kundt"
    "28-myers-perry"
    "29-lifshitz"
    "30-alcubierre"
    "31-plebanski-demianski"
    "32-einstein-rosen-wave"
    "33-van-stockum"
    "34-tomimatsu-sato"
    "35-belinskii-khalatnikov-lifshitz"
    "36-kantowski-sachs-cosmology"
    "37-mcvittie"
    "38-kinnersley-walker"
)

# Extract proper metric names from folder names
declare -A metric_names
metric_names["1-minkowski"]="Minkowski"
metric_names["2-schwarzschild"]="Schwarzschild"
metric_names["3-kerr"]="Kerr"
metric_names["4-desitter"]="DeSitter"
metric_names["5-anti-de-sitter"]="AntiDeSitter"
metric_names["6-reissner-nordstrom"]="ReissnerNordstrom"
metric_names["7-kerr-newman"]="KerrNewman"
metric_names["8-flrw"]="FLRW"
metric_names["9-taub-nut"]="TaubNUT"
metric_names["10-bianchi"]="Bianchi"
metric_names["11-goedel"]="Goedel"
metric_names["12-vaidya"]="Vaidya"
metric_names["13-kasner"]="Kasner"
metric_names["14-pp-wave"]="PPWave"
metric_names["15-petrov-type-d"]="PetrovTypeD"
metric_names["16-btz-black-hole"]="BTZBlackHole"
metric_names["17-c"]="CMetric"
metric_names["18-weyl"]="Weyl"
metric_names["19-lewis-papapetrou"]="LewisPapapetrou"
metric_names["20-majumdar-papapetrou"]="MajumdarPapapetrou"
metric_names["21-bonnor-metzner-sachs"]="BonnorMetznerSachs"
metric_names["22-ernst"]="Ernst"
metric_names["23-melvin"]="Melvin"
metric_names["24-lemaitre-tolman-bondi"]="LemaitreTolmanBondi"
metric_names["25-szekeres"]="Szekeres"
metric_names["26-robinson-trautman"]="RobinsonTrautman"
metric_names["27-kundt"]="Kundt"
metric_names["28-myers-perry"]="MyersPerry"
metric_names["29-lifshitz"]="Lifshitz"
metric_names["30-alcubierre"]="Alcubierre"
metric_names["31-plebanski-demianski"]="PlebanskiDemianski"
metric_names["32-einstein-rosen-wave"]="EinsteinRosenWave"
metric_names["33-van-stockum"]="VanStockum"
metric_names["34-tomimatsu-sato"]="TomimatsuSato"
metric_names["35-belinskii-khalatnikov-lifshitz"]="BKL"
metric_names["36-kantowski-sachs-cosmology"]="KantowskiSachs"
metric_names["37-mcvittie"]="McVittie"
metric_names["38-kinnersley-walker"]="KinnersleyWalker"

# Create notebooks for each metric and coordinate system
for folder in "${folders[@]}"; do
    # Get metric name
    metric=${metric_names[$folder]}
    
    # Check if folder exists, if not create it
    if [ ! -d "$folder" ]; then
        mkdir -p "$folder"
        echo "Created folder: $folder"
    fi
    
    # Filter out incompatible coordinate systems based on metric properties
    # This is a simplified example - would need more logic for real implementation
    compatible_coords=()
    
    case "$folder" in
        "1-minkowski")
            # Minkowski is compatible with most coordinate systems
            compatible_coords=("${coordinates[@]}")
            ;;
        "3-kerr" | "7-kerr-newman")
            # Kerr-related metrics are especially suited for Boyer-Lindquist, Kerr-Schild
            # and some advanced coordinates but might be incompatible with simpler ones
            for coord in "${coordinates[@]}"; do
                if [[ "$coord" != "spherical" && "$coord" != "plane-polar" ]]; then
                    compatible_coords+=("$coord")
                fi
            done
            # Specifically add Boyer-Lindquist as it's fundamental for Kerr
            compatible_coords+=("boyer-lindquist")
            ;;
        "8-flrw")
            # FLRW especially suited for comoving, conformal coordinates
            for coord in "${coordinates[@]}"; do
                if [[ "$coord" == "spherical" || "$coord" == "cartesian" || 
                      "$coord" == "comoving" || "$coord" == "conformal" || 
                      "$coord" == "synchronous" ]]; then
                    compatible_coords+=("$coord")
                fi
            done
            ;;
        *)
            # For other metrics, use a subset of coordinates for demonstration
            # In real implementation, this would be more carefully chosen
            compatible_coords=("cartesian" "spherical" "cylindrical" "toroidal" "isotropic" "harmonic")
            ;;
    esac
    
    # Create notebooks for each compatible coordinate system
    for coord in "${compatible_coords[@]}"; do
        create_notebook "$metric" "$coord" "$folder"
    done
done

echo "Notebook creation complete!"
