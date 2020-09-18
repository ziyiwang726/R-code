library(stringr)
col_vector <- c("blue", "green")
ggplot(data = new_df, aes(x = Type)) +
  geom_errorbar(aes(ymin = Percentile_0,
                    ymax = Percentile_100),
                width = 0.5,
                position = position_dodge(width = 0.9) ) +
  geom_boxplot(
    stat = "identity",
    aes(
      ymin = Percentile_0,
      lower = Percentile_25,
      middle = Percentile_50,
      upper = Percentile_75,
      ymax = Percentile_100
    )
  ) +
  theme_classic() +
  theme(text = element_text(size = 16), axis.title=element_text(size=16), plot.title = element_text(hjus = 0.5)) +
  labs(x="", y="Sequence abundance", title = "Propionibacterium in nutrition") +
  scale_y_log10()
