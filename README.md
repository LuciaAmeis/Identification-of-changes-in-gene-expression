#######################################################

Source Code and data for the manuscript
"Identification of changes in gene expression",
by L. Ameis and K. Moellenhoff.
arXiv:2407.14630
#######################################################

For questions, comments or details please contact L. Ameis at the Univeristy of Cologne: lucia.ameis@uni-koeln.de

The code is grouped into multiple .R files. All can be run via the master.R file or individually, after running the 
library in the master.R file. Please always start with setting the working directory to the folder containing the master.R 
file, e.g. by altering line 152 in the master.R file.
A complete description of the contents of the individual .R files can be found in the master.R file.

Tables and plots are automatically stored in the folder 'plots_tables'and align with the numbering in the manuscript. 
Figures B, C, E, and G are presented jointly in Figure 4 of the main text and are repeated as individual figures in 
the supplement for better visibility. As written, the code will result in a horizontal orientation of the legends 
(as in Figure 4). Comment out lines 5496, 5402, 5305 and 5178 in plots_generation_WDM_all.R to generate vertical oriented 
legends, as presented in Figures B, C, E, and G.

The case study data set is publicly available at the SRA database with reference number PRJNA953810. The pre-processing was 
done using Salmon and tximeta as described in the DESeq2 Vignette. Details on the preprocessing afterwards can be found in 
the file "/data_preparation/data_preparation_WDM.R".
Save the results of tximeta in "./data/RNASeq_high_fat_gene_level_summary.RData".

In the .R file 'Guided_Application.R', code is prepared to help researchers apply the method to their own data.

Here, only the code is provided. In order to run the case study, the data has to be preprocessed first. For 
intermediate results see: https://zenodo.org/records/18931148

WARNING: Please note that some of the code has a long runtime. Therefore, the code as presented is written such
that intermediate results are automatically loaded.
Precisely:
- The intermediate results for the SIMULATION STUDY are loaded from a subfolder 'intermediate'. We recommend
  re-running the full simulation on a server. To reduce the number of simulation runs, change the number Nsim
   in line 51 in "/simulation/simulation_scenarios_WDM_all.R".
- The calculation of CONFIDENCE INTERVALS takes multiple hours. A prepared .RData file containing the results
  is loaded. Alternativly, the number of bootstrap runs can be reduced by altering the value of B3 in 
    line 7 in the file "/case_study/case_study_bsplines_ci_WDM.R",
    line 7 in the file "/case_study/case_study_ci_WDM.R",
    line 175 in the file "/case_study/case_study_aging_WDM.R"
  This will influence the validity of the results negativly.
- The preparation step of the GO analysis takes a long time. Therefore, the code is written such that
  intermediate results are loaded automatically. The number of genes taken into consideration can be reduced to reduce
  the runtim by altering
    line 180 in the file "/case_study/case_study_GO_WDM.R"
  However, this will alter the results.
- Reproducing all the plots at once can take a long time. However, most plots can be run individually in the
  plots_generation.R file.

The code was run on a commercially available 12 core Laptop with 16GB RAM (except for the simulation study, 
witch was run on a HPC-cluster).
Running the code without loading intermediate resuls will take:
- simulation_intermediate_WDM_all.R: multiple days, possibly a week if all simulation scenarios are run (should
  be run on a server)
- case_study_bsplines_ci_WDM.R: one or two days 
- case_study_ci_WDM.R:  one or two days
- case_study_aging_WDM.R: a day  
- case_study_GO_WDM.R: two to three days
- plot_generation_WDM_all.R: a few hours
All other subfiles will take a few minutes or less.

The code has been written mostly on R version 4.3.2. Analysis conducted in Section 4.1. was added using R Version  
4.5.0. The Simulation study and the preparation step of the analysis presented in Section 4.2. were run on a server
with R version 4.3.1.
Running all of the code on R Version 4.5.0. should not influence most of the results. The only exception is the GO
analysis conducted for the case study. Precisely, the use of the function topGO, since the results depend on the
annotation of gene to GO groups. These fluctuate between versions due to advancements in research. The important
influence here is the version of Bioconductor. The version of Bioconductor version compatible with R version 4.3.x is 3.18.
However, while using newer versions will most likely influence the specific results, this will not influence the massage 
presented in the paper, since the goal was only to demonstrate a combination of the methods.

For details on the sessionInfo() see the master_WDM.R file.

R version 4.5.0 seems to produce problems when used in combination with DESeq2 version 1.48.0. 
Running the line 142 in the master_WDM.R file should solve the problem.

REGARDING PARALLELIZATION:
Parallelization on Windows was utilized generating the results. The following packages were used:
parallel,foreach,doParallel,doSNOW
Users may want to adapt to their own setup (e.g. FORK instead of PSOCK). The cluster is generted in lines 145-149 in the 
master.R file. Precisely, find  type="PSOCK" in line 148. The cluster is registered in line 66 in base_add_bsplines_WDM.R 
and in line 267 in base_WDM.R, and stopped in lines 79 and 283, respectively.
