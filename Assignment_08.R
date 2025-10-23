#Import DataSet
student6 <- read.csv(file.choose(), header = TRUE, stringsAsFactors = FALSE)

#Check Data
head(student6)
str(student6)

#Run "plyr"
library(plyr)

#Compute mean Grade by Sex
gender_mean <- ddply(
  student6,
  "Sex",
  summarise,
  GradeAverage = mean(Grade, na.rm = TRUE)
)

gender_mean

#Write means to a text file
write.table(
  gender_mean,
  file = "gender_mean.txt",
  sep = "\t",
  row.names = FALSE
)

#Check File
file.exists("gender_mean.txt")

#Filter names containing “i” or “I”
i_students <- subset(
  student6,
  grepl("i", Name, ignore.case = TRUE)
)

head(i_students)

#Export filtered names only
write.csv(
  i_students$Name,
  file = "i_students.csv",
  row.names = FALSE,
  quote = FALSE
)

#Export full filtered DataSet
write.csv(
  i_students,
  file = "i_students_full.csv",
  row.names = FALSE
)

#Verify all outputs exist in directory
file.exists("gender_mean.txt")
file.exists("i_students.csv")
file.exists("i_students_full.csv")