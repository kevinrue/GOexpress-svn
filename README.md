GOexpress
=======

Visualise microarray and RNAseq data with gene ontology annotations.

# Software status

| Platforms |  OS  | R CMD check | Coverage<sup>1</sup> | 
|:----------------:|:----------------:|:----------------:|:----------------:|
| Travis CI<sup>2</sup> | Linux | [![Travis-CI Build Status](https://travis-ci.org/kevinrue/GOexpress-svn.svg?branch=master)](https://travis-ci.org/kevinrue/GOexpress-svn) | [![Coverage Status](https://img.shields.io/codecov/c/github/kevinrue/GOexpress-svn/master.svg)](https://codecov.io/gh/kevinrue/GOexpress-svn) |
| Bioc _devel_ ([3.5](http://bioconductor.org/packages/3.5/bioc/html/GOexpress.html)) | Multiple | [![BioC-devel Build Status](http://bioconductor.org/shields/build/devel/bioc/GOexpress.svg)](http://bioconductor.org/checkResults/devel/bioc-LATEST/GOexpress) | [![BioC-devel Coverage status](http://bioconductor.org/shields/coverage/devel/GOexpress.svg)](http://bioconductor.org/developers/how-to/unitTesting-guidelines/#coverage) |
| Bioc _release_ ([3.4](http://bioconductor.org/packages/release/bioc/html/TVTB.html)) | Multiple | [![BioC-release Build Status](http://bioconductor.org/shields/build/release/bioc/GOexpress.svg)](http://bioconductor.org/checkResults/release/bioc-LATEST/GOexpress) | [![BioC-release Coverage status](http://bioconductor.org/shields/coverage/release/GOexpress.svg)](http://bioconductor.org/developers/how-to/unitTesting-guidelines/#coverage) |

<sup>1</sup>Latest _successful_ build;
<sup>2</sup>Bleeding edge original GitHub [repository](https://github.com/kevinrue/GOexpress).

# Overview

## Inputs

`GOexpress` was designed for the analysis of omics data sets
that examine the expression level of features annotated into
functionally related categories (*e.g.*, Gene Ontology).

The package requires three types of inputs:

* A `matrix` of expression values
* A `data.frame` of phenotype information
* A `data.frame` of two columns that provides a bidirectional mapping
    between features and categories
    
The first two (expression and phenotype)
are expected in any object that inherits from
the `ExpressionSet` class
([Biobase](https://bioconductor.org/packages/Biobase) package).

The latter must be supplied as a `GOMap`, a class
implemented in `GOexpress` to store mapping between
feature identifiers (*e.g.*, Ensembl gene ID), and categories
(*e.g.*, Gene Ontology) as a simple `data.frame`.


## Analysis

`GOexpress` estimate the capacity of features and GO categories
to cluster groups of samples according to an experimental factor present
in the `phenoData` slot.

Currently, the following methods are supported:

* `oneway.test`
* `randomForest`

## Downstream

An array of methods are implemented to examine and visualise data
at each step of the analysis.

In particular:

* Comparative expression profile of features between phenotype levels
  (`smoothFeature`, `ggfy`)
* Heat map summary view of expression in annotated GO categories
  (*coming back soon*)
* Hierarchical clustering of samples using annotated GO categories
  (*coming back soon*)
