##ggplot multiple boxplots - grouped

require(ggplot2)
p <- ggplot(data = Soybean_Soybean_I_millet_inoculated_with_WT_S_Sclerotiorum, aes(x=Day, y=Lesion)) + geom_boxplot(aes(fill=Treatment))

##Add p value on ggplot
install.packages("ggpubr")
library(ggpubr)
library(magrittr)

p <- p + stat_compare_means(aes(group = Treatment), label = "p.format")

##Add x- and y-axis lable on ggplot
p <- p + ylab("Lesion (cm)") + ggtitle("Title")

##Change color
library(RColorBrewer)
p <- p + scale_fill_brewer(palette="Greys")

##Change background
p + theme_classic() + labs(subtitle="Classic Theme")


######################################

##ggplot multiple boxplots - ungrouped
p <- ggboxplot(dataname, x = "Treatment", y = "Mark") + 
    stat_compare_means(method = "t.test", label = "p.signif", size = 5, label.y = 5.5, ref.group = "LU21")




