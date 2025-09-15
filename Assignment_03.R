Blogger: https://austincurtis4370.blogspot.com/2025/09/module-3-analyzing-2016-data-poll-data.html
# Define vectors
Name <- c("Jeb", "Donald", "Ted", "Marco", "Carly", "Hillary", "Bernie")
ABC_poll <- c(4, 62, 51, 21, 2, 14, 15)
CBS_poll <- c(12, 75, 43, 19, 1, 21, 19)

# Combine into a data frame
df_polls <- data.frame(Name, ABC_poll, CBS_poll)

# Inspect structure and first rows
str(df_polls)
head(df_polls)

# Summary statistics
mean(df_polls$ABC_poll)
median(df_polls$CBS_poll)
range(df_polls[, c("ABC_poll", "CBS_poll")])

# Add a new column for differences
df_polls$Diff <- df_polls$CBS_poll - df_polls$ABC_poll

# Quick plot
barplot(df_polls$Diff, names.arg = df_polls$Name,
        col = "steelblue", main = "Difference: CBS - ABC Polls",
        ylab = "Difference in Poll %")
