#!/bin/bash

# Change to the Kincore-standalone directory
cd /data/sw/Kincore-standalone

# Set the directories, where the input .pdb files are stored
PDB_dir=/uni-mainz.de/groups/09/AKCzodrowski/exchange/anna/drylab/PKA/anna_pka_project-1/Data/PDB/pdb_files/
CF_dir=/uni-mainz.de/groups/09/AKCzodrowski/exchange/anna/drylab/PKA/anna_pka_project-1/Data/CrystalsFirst_Crystal_Structures/Manipulated_Same_Chain/

# Set the output directory and the filename with a timestamp
output_dir=/uni-mainz.de/groups/09/AKCzodrowski/exchange/anna/drylab/PKA/anna_pka_project-1/Analysis/Kinase_Conformation/
output_file="kincore_results_$(date +%Y-%m-%d_%H-%M-%S).tsv"

# Iterate over each .pdb file in the directories
for file in "$PDB_dir"*.pdb "$CF_dir"*.pdb; do
    # Run the kinase_state.py script with the filename and True as arguments
    # Append the output to the kincore_results.txt file (>>) in the output directory
    python kinase_state.py "$file" True >> "$output_dir$output_file"
done

# Remove any newly created files with the extensions .fasta or hmmer.txt from the input directories
find "$PDB_dir" "$CF_dir" -type f \( -name "*.fasta" -o -name "*.hmmer.txt" \) -delete

# Modify the output_file
# 1. Remove the dir substring
sed -i "s|$PDB_dir||g" "$output_dir$output_file"
sed -i "s|$CF_dir||g" "$output_dir$output_file"
# 2. Delete the odd lines (except the first on), as the info stored is redundant
# awk 'NR==1 || NR%2==0' "$output_dir$output_file" > temp_file && mv temp_file "$output_dir$output_file"
# 3. Replace any single/multiple space characters by a tab
sed -i 's/ \+/\t/g' "$output_dir$output_file"

# The format of the  output file corresponds to .tsv
