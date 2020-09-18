##ggplot multiple lineplots

##One step
require(ggplot2)
plate <- data_of_slagemv1_infected_sclerotinia_and_botrytis_
s <- ggline(plate, x = "Time", y = "Lesion", add = "mean_se", color = "Treatment", palette = c("#808080", "#000000")) + stat_compare_means(aes(group = Treatment), label = "p.signif", label.y = c(0.8, 1.08, 1.68, 1.83), size = 5) + expand_limits(y=c(0, 2)) + ylab("Diameters (cm)") + theme(axis.title.x=element_blank(), legend.title = element_blank())

###############################
##multiple steps
s <- ggline(plate, x = "Time", y = "Lesion", add = "mean_se", color = "Treatment", palette = "grey")

##Add p value sign
s <- s + stat_compare_means(aes(group = Treatment), label = "p.signif" ) + expand_limits(y=c(0, 10))

##Add x- and y-axis lable on ggplot
s <- s + ylab("Diameters (cm)")

##Remove xlab title
s <- s + theme(axis.title.x=element_blank())

##Remove legend title
s <- s + theme(legend.title = element_blank())
