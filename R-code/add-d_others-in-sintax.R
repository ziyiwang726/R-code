test <- read.delim2("/media/owner/84c287d9-53c7-4145-bf8c-f22aebb71a84/Ziyi-16s/out-3/sintax-otu.csv", header = FALSE, sep = "\t")

dim(test)
# [1] 1324861       4
colnames(test)<- c("number", "blast_res", "symbol", "predictions")
# test<- as.matrix(test)
head(test)
# sum(is.na(test[,"predictions"]))
test[] <- lapply(test, as.character)
test[grepl("10.7429",test[,"number"]),"number"]

sum((test[,"predictions"])=="")
test.rows<- which((test[,"predictions"])=="")


test[(test[,"predictions"]==""), "predictions"] <- c("d:others")


write.table(test,file= "/media/owner/84c287d9-53c7-4145-bf8c-f22aebb71a84/Ziyi-16s/out-3/syntaxed.csv", col.names=FALSE,row.names=FALSE,sep="\t",quote=FALSE)

#test
test[test.rows,"predictions"]
