# Rule to build final report
report.html: render_final_report.R final_report.Rmd
	Rscript render_final_report.R
	
# Rule to build linear model
regression_table.rds: code/model.R
	Rscript: code/model.R

# Rules to build output from each coder will be added
output/bar_plot.png: code/visual.R
	Rscript code/visual.R
	
# Rule to build engagment over weeks
output/plot_1.png: code/engage_time.R
	Rscript code/engage_time.R