#Blog Link: https://austincurtis4370.blogspot.com/2025/09/module-4-visualizing-and-interpreting.html
# Define numeric vectors
Frequency     <- c(0.6, 0.3, 0.4, 0.4, 0.2, 0.6, 0.3, 0.4, 0.9, 0.2)
BloodPressure <- c(103, 87, 32, 42, 59, 109, 78, 205, 135, 176)

# Convert categorical strings to numeric codes
# First assessment: bad=1, good=0
FirstAssess   <- c(1, 1, 1, 1, 0, 0, 0, 0, NA, 1)

# Second assessment: low=0, high=1
SecondAssess  <- c(0, 0, 1, 1, 0, 0, 1, 1, 1, 1)

# Final decision: low=0, high=1
FinalDecision <- c(0, 1, 0, 1, 0, 1, 0, 1, 1, 1)

# Create data frame
df_hosp <- data.frame(
  Frequency, BloodPressure, FirstAssess,
  SecondAssess, FinalDecision,
  stringsAsFactors = FALSE
)

# Inspect data
summary(df_hosp)

# Handle missing values (drop rows with NA)
df_hosp <- na.omit(df_hosp)

# Check cleaned data
print(df_hosp)

# Set up plotting window: 3 rows, 1 column
par(mfrow = c(3,1))

# Boxplot 1: First MD Assessment
boxplot(
  BloodPressure ~ FirstAssess,
  data = df_hosp,
  names = c("Good", "Bad"),
  ylab = "Blood Pressure",
  main = "BP by First MD Assessment",
  col = c("lightblue", "salmon")
)

# Boxplot 2: Second MD Assessment
boxplot(
  BloodPressure ~ SecondAssess,
  data = df_hosp,
  names = c("Low", "High"),
  ylab = "Blood Pressure",
  main = "BP by Second MD Assessment",
  col = c("lightgreen", "orange")
)

# Boxplot 3: Final Decision
boxplot(
  BloodPressure ~ FinalDecision,
  data = df_hosp,
  names = c("Low", "High"),
  ylab = "Blood Pressure",
  main = "BP by Final Decision",
  col = c("lightgray", "lightpink")
)

# Reset plotting window to default
par(mfrow = c(1,1))

# Histogram of Visit Frequency
hist(
  df_hosp$Frequency,
  breaks = seq(0, 1, by = 0.1),   # bins from 0.0 to 1.0 in steps of 0.1
  col = "skyblue",                # fill color
  border = "white",               # clean bin edges
  xlab = "Visit Frequency",
  ylab = "Count",
  main = "Histogram of Visit Frequency"
)

# Histogram of Blood Pressure
hist(
  df_hosp$BloodPressure,
  breaks = 8,                     # split BP into 8 bins
  col = "lightgreen",
  border = "white",
  xlab = "Blood Pressure",
  ylab = "Count",
  main = "Histogram of Blood Pressure"
)
