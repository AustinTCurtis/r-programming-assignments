# PART 1: Define two 2x2 matrices A and B
A <- matrix(c(2, 0, 1, 3), ncol = 2)
B <- matrix(c(5, 2, 4, -1), ncol = 2)

# Display A and B
A
B

# Matrix addition
A_plus_B <- A + B
A_plus_B

# Matrix subtraction
A_minus_B <- A - B
A_minus_B


# PART 2: Create a 4x4 diagonal matrix with diagonal entries 4, 1, 2, 3
D <- diag(c(4, 1, 2, 3))

# Display the diagonal matrix
D

# PART 3: Create a 5x5 custom matrix programmatically

# Step 1: diagonal entries all equal to 3
base <- diag(3, 5)

# Step 2: first column filled with 2s
base[, 1] <- 2

# Step 3: first row filled with 1s except the [1,1] position which should be 3
base[1, ] <- 1
base[1, 1] <- 3

# Step 4: fix the first column's [1,1] back to 3 (already set)
base