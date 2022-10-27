# Rule to build final report
report.html: render_final_report.R final_report.Rmd
	Rscript render_final_report.R
	
# Rule to build linear model
regression_table.rds: code/model.R
	Rscript: code/model.R

# Rules to build bar chart
output/bar_plot.png: code/visual.R
	Rscript code/visual.R
	
# Rule to build graph for engagement over weeks of class
output/time_plot.png: code/engage_time.R
	Rscript code/engage_time.R