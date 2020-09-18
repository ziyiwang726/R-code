path <- "/media/owner/7ef86942-96a5-48a7-a325-6c5e1aec7408/Ziyi/t-tests/"
my.data <- read.delim2("/home/owner/Downloads/genus-sintax-summary.csv", header = TRUE, sep = "\t",stringsAsFactors = FALSE)
head(my.data)
colnames(my.data) <- gsub("X", "", colnames(my.data))
colnames(my.data)
head(my.data[, 1:11])
head(my.data[,12:21])
group1<- my.data[, 1:11]
colnames(group1) <- c("bacteria", "2", "3", "9", "10", "11", "13", "16", "20", "21", "22")
group2 <- my.data[,12:21]
group2$bacteria <- group1$bacteria
colnames(group2) <- c( "1", "7", "8", "15", "18", "19", "23", "24", "25", "27", "bacteria")
group2 <- group2[,c("bacteria" , "1", "7", "8", "15", "18", "19", "23", "24", "25", "27")]
group2[1:11,1:11]

row.names(group1)<- group1$bacteria
group1 <- group1[-1]
group1 <- t(group1)
group1[1:10,1:10]
group1 <- as.data.frame(group1)
# class(group1$Gp6)
indx <- sapply(group1, is.factor)
group1[indx] <- lapply(group1[indx], function(x) as.numeric(as.character(x)))

row.names(group2)<- group2$bacteria
group2 <- group2[-1]
group2 <- t(group2)
group2[1:10,1:10]
group2 <- as.data.frame(group2)
indx <- sapply(group2, is.factor)
group2[indx] <- lapply(group2[indx], function(x) as.numeric(as.character(x)))

# t.test(group1[87], group2[87])

my.samples <- colnames(group1)

library("ggplot2")
library("ggpubr")
library(data.table)
for (i in 1:length(comparisions)){
  print (paste0("Working on: ", gsub("[[:punct:]]", "_",my.samples[i])))
# test.res <-t.test(group1[i], group2[i])
group.a.1 <- cbind("group1",group1[i])
colnames(group.a.1) <- c("group", my.samples[i])
group.a.2 <- cbind("group2",group2[i])
colnames(group.a.2) <- c("group", my.samples[i])
df <- rbind(group.a.1,group.a.2)
my_comparisons <- c("group1", "group2")
melted.df <- melt(df, id=1)
bp <- ggboxplot(melted.df, x = "group", y = "value",
                color = "variable", palette = c("black", "black"),xlab ="Groups", ylab = "Diameter (cm)")+ 
  stat_compare_means(comparisons = my_comparisons)+ # Add pairwise comparisons p-value
  stat_compare_means(label.y = max(melted.df$value)+0.5, method = "t.test") +
  theme_bw()+
  theme(text = element_text(size=14))+
  guides(color=guide_legend("Comparison"))

bp <- bp + theme(text = element_text(size=12),
                 axis.text.x = element_text(angle=0, hjust=1), legend.position = "none", axis.title.x = element_blank()) +
  labs(title = paste0("Comparison of: ", my.samples[i]), x = "Groups", y = "Values", color = "Legend Title\n")
  # labs(y = "Values")
bp

ggsave(
  file = paste0(path, gsub("[[:punct:]]", "_",my.samples[i]),".svg"),
  plot = bp,
  dpi = 150,
  width = 4,
  height = 4,
  units = "in"
)
}
