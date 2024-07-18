#############
####Start####
#############
#Library
library(tximeta)
library(DESeq2)
library(ashr) # For shrinkage of "only due to noise" large log2FCs
library(tidyr)
library(tibble)
library(DT) # for nice tables
library(drc)
library(matrixStats)
library(DoseFinding)
library(parallel)
library(foreach)
library(doParallel)
library(dplyr)
library(doSNOW)
library(reshape)
library(ggplot2)
library(topGO) # for gene set enrichment / GO analysis
library(patchwork)
library(writexl)


#Paralelization
n.cores<-parallel::detectCores()-1
my.cluster<-parallel::makeCluster(
  n.cores,
  type="PSOCK"
)

#Set Workingdirectory (Please change before running)
setwd("Please set")



###################
####Preparation####
###################
#Here all functions needed for the analysis and simulation are defined. Pleas
#always run first.
source("./base/base_WDM.R")


#Here we prepare the data set for analysis and basis of the simulation study
#The genes Cd163, Fam83a and Dpb are extracted from the data set
source("./data_preparation/data_preparation_WDM.R")

#Simulation scenarios
source("./simulation/simulation_scenarios_WDM_all.R")

#Simulation intermediate results
#Of note, since the simulation runs take a lot of time, the code was written 
#such that saved working directories are loaded
#To re-run the results remove the saved working directories from the sub folder
#'intermediate_results'
source("./simulation/simulation_intermediate_WDM_alt.R")

###############
####Results####
###############
#Simulation results
source("./simulation/simulation_results")

#Case study example genes Fam83a and Cd163
source("./case_study/case_study_WDM.R")

#CIs for the case study (WARNING: RUNS A LONG TIME)
#Please load the prepared Work Space
#source("./case_study/case_study_ci_WDM.R")
load("./case_study/case_study_ci_WDM.RData")

#Case study aging
#Part of this code runs a long time. Therefore, the code as is is written such 
#that a prepared .RData file is loaded instead of the most time consuming part of the
#code. 
source("./case_study/case_study_aging_WDM.R")

#Case study GO analysis
#Part of this code runs a long time. Therefore, the code as is is written such 
#that a prepared .RData file is loaded instead of the most time consuming part of the
#code. 
source("./case_study/case_study_GO_WDM.R")

#Plot generation
source("./plot_generation/plot_generation_WDM.R")
