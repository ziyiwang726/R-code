## R Programming
# Reading (Input) Data
df <- read.table('file.txt')
df <- read.csv('file.csv')
load('file.Rdata')

# Writing (Output) Data
write.table(df, 'file.txt')
write.csv(df, 'file.csv')
save(df, file = 'file.Rdata')

# For loop
for (i in mydata) {
  j <- i + 10    
  print(j)
}

# While loop
i = 1
while(i < 5){
  print(i)
  i <- i + 1
}

# If statement
if (i < 3) {
print('Yes')
} else {
  print('No')
}

# Function
function_name <- function(x){
  squared <- x*x
  return(squared)
}





