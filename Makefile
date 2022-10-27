# Rule to build final report
report.html: render_final_report.R final_report.Rmd
	Rscript render_final_report.R

# Rules to build output from each coder will be added

output/bar_plot.png: code/visual.R

	Rscript code/visual.R