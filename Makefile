# Rule to build final report
report.html: render_final_report.R final_report.Rmd \
  output/regression_table.rds output/bar_plot.png output/time_plot.png
	Rscript render_final_report.R
	
# Rule to build linear model
output/regression_table.rds: code/model.R data/course_engagement.csv
	Rscript code/model.R

# Rules to build bar chart
output/bar_plot.png: code/visual.R data/course_engagement.csv
	Rscript code/visual.R
	
# Rule to build graph for engagement over weeks of class
output/time_plot.png: code/engage_time.R data/course_engagement.csv
	Rscript code/engage_time.R

.PHONY: clean
clean:
	rm -f output/*.rds && rm -f report.html

# Package environment synchronization rule
.PHONY: install
install:
	Rscript -e "renv::restore(prompt=FALSE)"