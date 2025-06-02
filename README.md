READ ME

#######################################################

   Source Code and data for the manuscript           
   "Identification of changes in gene expression",   
   by L. Ameis and K. Moellenhoff.                   
   arXiv:2407.14630                                  
#######################################################

For questions, comments or details please contact L. Ameis at the Univeristy of Cologne: 
lucia.ameis@uni-koeln.de

This code as it is has been written on R version 4.3.2.

The code is grouped into multiple .R files. All can be run via the master.R file or individually. 
Please always start with setting the working directory to the folder containing the master.R file.

Tables and plots are automatically stored in the folder 'plots_tables'.

The case study data set is publicly available at the SRA database with reference number PRJNA953810. 
The pre-processing was done using Salmon and tximeta.

Here, only the code is provided. In order to run the code, the data has to be preprocessed first.
For intermediate results and the preprocessed data see: TBA

In the .R file 'Guided_Application.R', code is prepared to help researchers apply the method to their
own data.
