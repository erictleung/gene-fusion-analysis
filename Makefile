# Perform analysis and generate report
report/cosmic_fusion_extraction.html : report/cosmic_fusion_extraction.Rmd \
	data/CosmicFusionExport_v69_310514.csv \
	raw-data/ensembl_GRCh37_2014.08.29.csv \
	raw-data/FIsInGene_121013_with_annotations.txt
	Rscript -e "rmarkdown::render('report/cosmic_fusion_extraction.Rmd')"

# Convert .tsv file to .csv file
data/CosmicFusionExport_v69_310514.csv : raw-data/CosmicFusionExport_v69_310514.tsv
	mkdir data
	tr '\t' ',' < $< > $@

# Unzip Ensembl GRCh37 Human Genome
raw-data/ensembl_GRCh37_2014.08.29.csv : raw-data/ensembl_GRCh37_2014.08.29.zip
	unzip raw-data/ensembl_GRCh37_2014.08.29.zip

.PHONY : clean

# Remove analysis and report
clean :
	rm report/cosmic_fusion_extraction.html
