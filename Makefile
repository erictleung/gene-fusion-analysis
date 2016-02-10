# Perform analysis and generate report
report/cosmic_fusion_extraction.html : report/cosmic_fusion_extraction.Rmd \
	data/CosmicFusionExport_v69_310514.csv
	Rscript -e "rmarkdown::render('report/cosmic_fusion_extraction.Rmd')"

# Convert .tsv file to .csv file
data/CosmicFusionExport_v69_310514.csv : raw-data/CosmicFusionExport_v69_310514.tsv
	tr '\t' ',' < $< > $@

.PHONY : clean

# Remove analysis and report
clean :
	rm report/cosmic_fusion_extraction.html
