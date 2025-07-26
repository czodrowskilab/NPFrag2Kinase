# NPFrag2Kinase

This repository contains the data and JupyterNotebooks that were used to conduct the analyses 
presented in the publication:

> Anna Santura, Janis Müller, Madita Wolter, Ina-Charlotte Tutzschky, Moritz Ruf, Alexander Metz, Anna Sandner, Stefan Merkl, Gerhard Klebe, Serghei Glinca, Paul Czodrowski,  *Natural Product-Like Fragments Unlock Novel Chemotypes for a Kinase Target – Exploring Options beyond the Flatland*, 
bioRxiv, **2025**, https://doi.org/10.1101/2025.06.11.659015. 
[This content is a preprint and has not undergone peer review yet.]

## Contents
- **Analysis**:     Generated plots and output files.
- **Data**:         Reference datasets used in the publication. 

## Installation 
**Note**: The installation has only been tested on Linux.
1. Clone this repository and change into the directory. <br>
`git clone https://github.com/czodrowskilab/NPFrag2Kinase.git` <br>
`cd NPFrag2Kinase`
2. Create a new conda environment, install the dependencies and activate the environment. <br>
`conda env create -f NPFrag2Kinase_env.yml` <br>
`conda activate NPFrag2Kinase_env` 
3. Link the RDKit's Contrib folder to one of Python's import paths. This is necessary for the calculation of the Natural Product Likeness score. <br> Adjust the path below according to your Python version and environment location: <br> `ln -s <path-to-conda-env>/share/RDKit/Contrib <path-to-conda-env>/lib/python3.9/site-packages/` 

## Python Scripts
The notebooks are numbered in the order they need to be run. Notebooks with the same number prefix are to be executed with equal priority. Each notebook generates output files that are used in one or more subsequent notebooks. This modular structure allows you to start the workflow at any stage, depending on your needs. 
For further information, please also refer to the methods section of the publication.
- **1_DataRetreval_ChEMBL_Oral_Drugs.ipynb** <br>
Compile the reference dataset of approved (clinical phase = 4) oral drugs from the ChEMBL database.\[1\]
- **1_DataRetrieval_KLIFS_Approved_PKIs.ipynb** <br>
Compile the reference dataset of approved (clinical phase = 4) protein kinase inhibitors from the KLIFS database.\[2\]
- **1_DataRetrieval_PDB.ipynb** <br>
Compile the reference dataset of PDB \[3\] ligands binding to protein kinase A.
- **1.1_DataRetrieval_ChEMBL_All_Kinases.ipynb** <br>
Compile the reference dataset of ChEMBL molecules active towards any kinase (pChEMBL value of ≥ 5.0 and/or a ligand efficiency of ≥ 0.3; assay confidence score = 9).
- **1.2_DataRetrieval_ChEMBL_PKA.ipynb** <br>
Compile the reference dataset of ChEMBL molecules active towards protein kinase A, by filtering the ChEMBL All Kinases dataset.
- **2_Data_Preparation_and_Overlap.ipynb** <br>
Standardization and deduplication of the molecular datasets. Check for the overlap between the datasets and for pan-assay interference compounds (PAINS).
- **3_Analysis_COCONUT_NPs_related_to_Fragments.ipynb** <br>
Code related to section *2.2 Prior Knowledge on the Fragments and their Natural Product Parents from Database Mining* of the publication. <br>
Retrieve the natural product parents from the COCONUT database\[4\] and look up what is already knwon about them and the fragments themselves in PubChem\[5\] and ChEMBL.\[1\]
- **3_Analysis_ChemicalSpace_BemisMurckoScaffolds.ipynb** <br>
Code related to section *2.5.1 Identification of Novel Scaffolds/Chemotypes* of the publication. <br>
Generation of Bemis-Murcko scaffold variants and checking if there any unique to the fragments dataset?
- **3_Analysis_ChemicalSpace_Chemotypes.ipynb** <br>
Code related to section *2.5.1 Identification of Novel Scaffolds/Chemotypes* of the publication. <br>
Examination of the in terms of the Tanimoto coefficient most similar reference molecules per fragment.
- **3.0_Analysis_ChemicalSpace_ConformerGeneration.ipynb** <br>
Code related to section *2.5.2 Delineating the Fragment’s Chemical Space through Molecular Descriptors* of the publication. <br>
Generate a single 3D conformer for each fragment and reference molecule, using RDKit's ETKDG algorithm.\[6\]
- **3.1_Analysis_ChemicalSpace_Descriptors_Calculation.ipynb** <br>
Code related to section *2.5.2 Delineating the Fragment’s Chemical Space through Molecular Descriptors* of the publication. <br>
Compute descriptors, either from the molecule's 2D representation, the *in silico*-generated conformer or the protein-bound ligand conformation.
- **3.2_Analysis_ChemicalSpace_Plots.ipynb** <br>
Code related to section *2.5.2 Delineating the Fragment’s Chemical Space through Molecular Descriptors* of the publication. <br>
Visualize descriptor value distributions. 
- **3.3_Analysis_ChemicalSpace_MinMaxValues.ipynb** <br>
Code related to section *2.5.2 Delineating the Fragment’s Chemical Space through Molecular Descriptors* of the publication. <br>
Determine the molecules with the highest/lowest descriptor values for each dataset. 
- **3.4_Analysis_ChemicalSpace_insilico_probound.ipynb** <br>
Code related to section *2.5.2 Delineating the Fragment’s Chemical Space through Molecular Descriptors* of the publication. <br>
Compare the *in silico* generated and protein-bound ligand conformations and the descriptor values computed therefrom.
- **4_Kinase_Conformation.ipynb** <br>
Code related to section *2.4.1 Structural Classification of Protein Kinases and their Ligands* of the publication. <br>
Post-processing of the KinCore\[7\] output, and analyzing the kinase conformations.


## Citation
If you use this code or the datasets in your research, please cite:
https://doi.org/10.1101/2025.06.11.659015


## License
This project is licensed under the MIT License.

## References
\[1\] B. Zdrazil *et al*. The ChEMBL Database in 2023: A Drug Discovery Platform Spanning Multiple
Bioactivity Data Types and Time Periods. *Nucleic Acids Research* **2024**, 52, D1180–D1192. <br>
\[2\] A.J. Kooistra *et al.* KLIFS: A Structural Kinase-Ligand Interaction Database. *Nucleic Acids Research* **2016**, 44, D365–D371. <br>
\[3\] H.M. Berman *et al*. The Protein Data Bank. *Nucleic Acids Research* **2000**, 28, 235–242. <br>
\[4\] V. Chandrasekhar *et al*. COCONUT 2.0: A Comprehensive Overhaul and Curation of the COlleCtion of Open NatUral producTs database. *Nucleic Acids Research* **2024**, 53, D634–D643. <br>
\[5\] S. Kim *et al* PubChem 2025 Update. *Nucleic Acids Research* **2025**, 53, D1516–D1525 <br>
\[6\] G. Landrum *et al.* RDKit: Open-source Cheminformatics. https://www.rdkit.org, version 2024_03_5,
**2024**. <br>
\[7\] V. Modi and R.L. Dunbrack, Kincore: A Web Resource for Structural Classification of Protein Kinases
and their Inhibitors. *Nucleic Acids Research* **2022**, 50, D654–D664. <br>