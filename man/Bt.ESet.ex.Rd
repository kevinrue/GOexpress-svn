\name{Bt.ESet.ex}

\alias{Bt.logCPM}
\alias{Bt.pheno}

\docType{data}

\title{
Normalised log2-transformed counts per million from an RNAseq experiment.
}

\description{
An example gene-by-sample matrix of normalised log2-transformed CPM.
The matrix contains a subset of log2-CPM values
from an \emph{in vitro} stimulation of
bovine macrophages with different mycobacterial strains.
}

\usage{
data(Bt.logCPM)
data(Bt.pheno)
}

\value{
\code{matrix} of read counts for 7,784 genes (rows)
measured in 65 samples (columns).
\itemize{
    \item{\code{rownames} are Ensembl gene identifiers of the
    \emph{Bos taurus} species.}
    \item{\code{colnames} are samples identifiers.}
}
}

\details{
Gene expression was measured in poly-A purified strand-specific RNA libraries
using the RNA-Sequencing Illumina(R) HiSeq(R) 2000 platform as paired-end 2 x
90 nucleotide reads. Raw reads from pooled RNA libraries were first
deconvoluted according to sample-specific nucleotide barcodes. Read pairs
containing adapter sequence in either read mate were discarded, and similarly
read pairs of low overall quality in either mate were also discarded.
Paired-end reads from each filtered individual library were aligned to the
\emph{Bos taurus} reference genome (\emph{B. taurus} UMD3.1.71 genome release)
using the STAR aligner software. For each library, raw counts for each gene
based on sense strand data were obtained using the featureCounts software from
the Subread package. The featureCounts parameters were set to unambiguously
assign uniquely aligned paired-end reads in a stranded manner to the exons of
genes within the \emph{Bos taurus} reference genome annotation (\emph{B.
taurus} UMD3.1.71 genome annotation). The gene count outputs were further
processed using the edgeR Bioconductor package.

The gene expression quantitation pipeline within the edgeR package was
customised to: (1) filter out all bovine rRNA genes; (2) filter out genes
displaying expression levels below the minimally-set threshold of one count
per million [CPM] in at least ten individual libraries (number of biological
replicates); (3) calculate normalisation factors for each library using the
trimmed mean of M-values method; (4) log2-transform CPM values based on the
normalised library size.

To generate a reasonably small data subset, we retained:
\itemize{
    \item{5 animals (\emph{i.e.}, biological replicates) per experimental group
    (the full experimental design includes 10 animals per group)}
    \item{Gene features expressed on average above 10 counts per million (CPM)
    across all samples.}
}
}

\source{
DOI: 10.1186/1471-2164-14-230
}

\examples{
# Load the data
data(Bt.logCPM)
data(Bt.pheno)

# Dimensions (rows, columns)
dim(Bt.logCPM)
dim(Bt.pheno)

# Subset of first 5 features and 5 samples
Bt.logCPM[1:5, 1:5]

# Combine into an ExpressionSet
Bt.eset <- ExpressionSet(Bt.logCPM, AnnotatedDataFrame(Bt.pheno))
}

\keyword{datasets}
\keyword{GOexpress}
