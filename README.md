# Gene Fusion Network Analysis

This directory contains the cleaning of gene fusion data from the [Catalogue of
Somatic Mutations in Cancer (COMSIC)][1] and basic statistical and network analysis
on the resulting data.

[1]: http://cancer.sanger.ac.uk/cosmic

## System Specifications

Tested on Mac OS X 10.10.5 Yosemite.

- make
- R 3.2.3
    - [stringr 1.0.0][stringr]
    - [igraph 1.0.1][igraph]
    - [rmarkdown 0.9.2][rmarkdown]
    - [knitr 1.12.3][knitr]

[stringr]: https://cran.r-project.org/web/packages/stringr/index.html
[igraph]: https://cran.r-project.org/web/packages/igraph/index.html
[rmarkdown]: https://cran.r-project.org/web/packages/rmarkdown/index.html
[knitr]: https://cran.r-project.org/web/packages/knitr/

## Download, Run Analysis, and Generate Report

```shell
$ git clone git@github.com:erictleung/gene-fusion-analysis.git
$ cd gene-fusion-analysis
$ make
```

## Written Scripts

- `report/cosmic_fusion_extraction.Rmd`
    - Cleans COSMIC data
    - Writes file `results/newDescription.txt` with the gene fusion data
    - Takes in Ensembl and functional interaction network data for analysis
    - Performs simple statistics and basic network statistics

## Notes on Downloaded Files

- `raw-data/FIsInGene_121013_with_annotations.txt`
    - Description:
        - This is the functional interaction network file from the Reactome
          website.  The file will be used so that the gene fusions can be
          overlaid on top to calculate metrics that will categorize the
          cancerous gene fusions.
        - “Functional interactions (FIs) derived from Reactome, and other
          pathway and interaction databases.” We downloaded the Version 2013.
    - Source: http://www.reactome.org/pages/download-data/
- `bin/ensembl_GRCh37_BioMart_2014.08.29.pl`
    - Description:
        - This is a Perl script that Ensembl automatically generated, based on
          the parameters I set:
            - Associated Gene name
            - Ensembl Transcript ID
            - 5' UTR Start
            - 5' UTR End
            - Exon Chr Start (bp)
            - Exon Chr End (bp)
            - 3' UTR Start
            - 3' UTR End
            - Strand (directionality)
            - Exon Rank in Transcript (which exon number it is)
    - Downloads: `raw-data/ensembl_GRCh37_BioMart_2014.08.29.csv`
    - Source: http://grch37.ensembl.org/biomart/martview/
- `raw-data/CosmicFusionExport_v69_310514.tsv`
    - Description:
        - "All gene fusion mutation data from the current release in a tab
          separated file."
    - Source: cancer.sanger.ac.uk/cancergenome/projects/cosmic/download

## NOTE: Error in COMIC Data

If you try and compile and run the `cosmic_fusion_extraction.Rmd` analysis, it
will not fail but it will be if you start with the raw data. The reason being is
that the COSMIC gene fusion data set (`CosmicFusionExport_v69_310514.tsv`) is
missing an open bracket on Line 11620.

The converted `.csv` version of the data (`CosmicFusionExport_v69_310514.csv`)
included in this analysis is manually edited so that the `.Rmd` analysis file
will run correctly.

## Related Literature

- Wu, Chia-Chin, et al. ["Identification of cancer fusion drivers using network
  fusion centrality."][wu] Bioinformatics 29.9 (2013): 1174-1181.
- Wang, Xiao-Song, et al. ["An integrative approach to reveal driver gene
  fusions from paired-end sequencing data in cancer."][wang] Nature
  biotechnology 27.11 (2009): 1005-1011.

[wu]: http://www.nature.com/nbt/journal/v27/n11/abs/nbt.1584.html
[wang]: https://bioinformatics.oxfordjournals.org/content/29/9/1174.full

## Analysis Directory Structure

```
.
├── Makefile
├── README.md
├── bin
│   └── ensembl_GRCh37_BioMart_2014.08.29.pl
├── data
│   └── CosmicFusionExport_v69_310514.csv
├── raw-data
│   ├── CosmicFusionExport_v69_310514.tsv
│   ├── FIsInGene_121013_with_annotations.txt
│   └── ensembl_GRCh37_2014.08.29.csv
├── report
│   ├── cosmic_fusion_extraction.Rmd
│   └── cosmic_fusion_extraction.html
└── results
    └── newDescription.txt

5 directories, 10 files
```
