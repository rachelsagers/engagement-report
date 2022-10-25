# Rule to build final report
report.html: render_final_report.R final_report.Rmd
	Rscript render_final_report.R
	
# Rule to build linear model
regression_table.rds: model.R
	Rscript: model.R

# Rules to build output from each coder will be added