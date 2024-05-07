setup <- function() {
  # Load necessary packages
  library(methylMapR)
  
  # Create or load objects needed for testing
  dfMotif <- methylMapR::dfMotif("C:\\Users\\cmorrissey\\OneDrive - Illumina, Inc\\Desktop\\Bioinformatics\\sethuraman\\sethuraman\\ecoli\\GSM1711631_Escherichia_coli_K12_MG1655_Tet.motifs.gff")
  #Load modifications.csv
  dfIPD <- methylMapR::dfIPD("C:\\Users\\cmorrissey\\OneDrive - Illumina, Inc\\Desktop\\Bioinformatics\\sethuraman\\sethuraman\\ecoli\\GSM1711630_Escherichia_coli_K12_MG1655_native.modifications.csv")
  #Load annotated genes, .tsv
  dfCDS <- methylMapR::dfCDS("C:\\Users\\cmorrissey\\OneDrive - Illumina, Inc\\Desktop\\Bioinformatics\\sethuraman\\sethuraman\\ecoli\\ecoliGenes.tsv")
  #Load transcription data, .csv
  dfTranscription <- methylMapR::dfTranscription("C:\\Users\\cmorrissey\\OneDrive - Illumina, Inc\\Desktop\\Bioinformatics\\sethuraman\\sethuraman\\ecoli\\Dataset_S5 The dataset of gene expression (TPM)_useme.csv", "b0" )
  #Load transcription factor binding site data
  dfTFBS <- methylMapR::dfTFBS("C:\\Users\\cmorrissey\\OneDrive - Illumina, Inc\\Desktop\\Bioinformatics\\sethuraman\\sethuraman\\ecoli\\GSM5696090_17251_MglB_MHS_i5006_DY330_rep1.gff")
  #Shrink data size for demo
  dfIPD <- dfIPD[1:40000,]
  dfMotif <- dfMotif[1:700,]
  dfTFBS <- dfTFBS[1:40000,]
  
  # Return objects or environment setup
  #list(data = my_data)
}

teardown <- function(env) {
  # Remove temporary objects or reset environment
  rm(list = ls())
}