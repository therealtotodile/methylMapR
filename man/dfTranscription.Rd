% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/dfTranscription.R
\name{dfTranscription}
\alias{dfTranscription}
\title{dfTranscription}
\usage{
dfTranscription(transcriptionData, locusTag)
}
\arguments{
\item{transcriptionData}{A transcriptional dataset that contains the transcript, and relative abundance (.csv)}

\item{locusTag}{A string that contains the first portion of the locus tag that is shared by all tags. It is used for searching for the locus tag column -- example: "KPHS" or "b0" or "PA"}
}
\value{
A dataframe of transcripts and abundance
}
\description{
Load in transcriptomics data, .csv
}
