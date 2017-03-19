GOexpress
=======

Visualise microarray and RNAseq data with gene ontology annotations.

# Software status

| Platforms |  OS  | R CMD check | Coverage<sup>1</sup> | 
|:----------------:|:----------------:|:----------------:|:----------------:|
| Travis CI<sup>2</sup> | Linux | [![Travis-CI Build Status](https://travis-ci.org/kevinrue/GOexpress.svg?branch=master)](https://travis-ci.org/kevinrue/GOexpress) | [![Coverage Status](https://img.shields.io/codecov/c/github/kevinrue/GOexpress/master.svg)](https://codecov.io/gh/kevinrue/GOexpress) |
| Bioc _devel_ ([3.5](http://bioconductor.org/packages/3.5/bioc/html/GOexpress.html)) | Multiple | [![BioC-devel Build Status](http://bioconductor.org/shields/build/devel/bioc/GOexpress.svg)](http://bioconductor.org/checkResults/devel/bioc-LATEST/GOexpress) | [![BioC-devel Coverage status](http://bioconductor.org/shields/coverage/devel/GOexpress.svg)](http://bioconductor.org/developers/how-to/unitTesting-guidelines/#coverage) |
| Bioc _release_ ([3.4](http://bioconductor.org/packages/release/bioc/html/TVTB.html)) | Multiple | [![BioC-release Build Status](http://bioconductor.org/shields/build/release/bioc/GOexpress.svg)](http://bioconductor.org/checkResults/release/bioc-LATEST/GOexpress) | [![BioC-release Coverage status](http://bioconductor.org/shields/coverage/release/GOexpress.svg)](http://bioconductor.org/developers/how-to/unitTesting-guidelines/#coverage) |

<sup>1</sup>Latest _successful_ build;
<sup>2</sup>Bleeding edge original GitHub [repository](https://github.com/kevinrue/GOexpress).

# OVERVIEW

This package was designed for the analysis of bioinformatics
data based on gene expression measurements. It requires two input
values:

1. an ExpressionSet containing assayData and phenoData. The assayData slot
should be a gene-by-sample matrix providing the expression level
of genes (rows) in each sample (columns). Row names are expected to be
either Ensembl gene identifiers or probeset identifiers present in
microarrays present in the Ensembl BioMart dataset queried. The phenoData slot
should be an AnnotatedDataFrame from the Biobase package providing phenotypic
information about the samples. Row names are samples, at least one of
the columns must be a grouping factor with two or more levels (factor
in the actual meaning of the R language).
2. the name of the grouping factor to investigate, which must be a
valid column name in the phenoData.

The analysis scores all Gene Ontology (GO) terms represented
in the gene annotations  provided, or semi-automatically retrieved from the
current Ensembl annotation release, using the biomaRt package. In the default
approach, the random forest framework is used to evaluate the ability of each
gene feature in the ExpressionSet to cluster groups of samples according
to a known experimental factor. Notably, genes
associated with the GO term in the annotations but absent from the dataset
are assigned a score of 0 and a rank equal to the number of gene features in
the ExpressionSet plus one. GO terms are scored and ranked on the average rank
(alternatively, score) of all associated genes (including those absent from
the ExpressionSet).

Functions are provided to investigate and visualise the results of
the above analysis. The score table can be filtered for GO terms passing
given thresholds. The distribution of scores can be visualised. The
quantiles of scores can be obtained. The genes associated with a
given GO term can be listed, with or without descriptive information.
Hierarchical clustering of the samples can be performed based on the
expression levels of genes associated with a given GO term. Heatmaps
accompanied by hierarchical clustering of samples and genes can be
drawn. The expression profile of genes can be plotted
against any factor while grouping samples on another factor. The 
univariate effect of all factors can be visualised on the expression
level of genes associated with a GO term. The counts of overlapping genes
between multiple GO terms can be visualised in a Venn diagram. The result
variable of the analysis can be re-ordered according to gene rank or
score.


# FEATURES

* Support expression data based on Ensembl gene identifiers and
microarray probeset identifiers.

* Suppots custom annotations for gene identifiers not automatically supported.

* GO_analyse() scores all Gene Ontology (GO) terms represented in
the dataset based on the estimated average ability of their associated
genes to cluster samples according to a predefined grouping factor. It
also returns the table used to map genes to GO terms, the table
summarising the statistics for each gene, and finally the essential parameters
of the analysis performed, for reproducibility. Additional information
specific to each statistical framework are included in the output object.

* pValue_GO() computes permutation-based P-values assessing the significance
of GO term ranking, which may subsequently be used for filtering.

* subset_scores() filters output of GO_analyse() for GO terms passing
desired filters and returns a list formatted identically to the 
output of GO_analyse() with the filtered information.

* hist_scores() plots the distribution of GO term scores in the
output of GO_analyse() or subset_scores().

* quantiles_scores() returns the quantile values corresponding
to defined percentiles.

* list_genes() returns the list of feature identifiers associated
with a given GO term.

* table_genes() returns a table of information about the feature
identifiers associated with a given GO term.

* cluster_GO() plots a hierarchical clustering of the samples
based on the expression levels of genes associated with a given
GO term.

* heatmap_GO() plots a heatmap with hierarchical clustering of the samples
and genes based on the expression levels of genes associated with a given GO
term.

* expression_plot() plots the expression profile corresponding to a feature
identifier, given valid variable name for the X-axis and a grouping factor for
the Y-axis.

* expression_plot_symbol() plots the expression profile corresponding to
feature identifier(s) annotated to a gene symbol, given valid variable name
for the X-axis and a grouping factor for the Y-axis.

* expression_profiles() plots the individual expression profile of given
sample series while colouring-coding each series according to its group; a
more detailed alternative to expression_plot().

* expression_profiles_symbol() plots the individual expression profile of
given sample series while colouring-coding each series according to its
group; a more detailed alternative to expression_plot_symbol().

* plot_design() plots the univariate effect of each level of each
factor available in the phenoData on the expression levels
of genes associated with a GO term.

* overlap_GO() calls VennDiagram to plot the counts of overlapping genes
between 2-5 GO terms. This can either display to screen or print to directly
to file.

* rerank() allows to reorder the ranked tables of GO terms and
genes either by increasing (average) rank or decreasing (average)
score.

* subEset() allows to subset an ExpressionSet to only the samples with
a particular set of values in given columns of their phenotypic data (e.g.
only samples from "2H" and "6H" in their "Time" information).

* An example of the main input and output objects is included with the
package.

* A User's Guide is included, and presents a typical workflow using the
included example input objects.
