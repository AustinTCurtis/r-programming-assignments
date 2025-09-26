# Create matrices
A <- matrix(1:100,  nrow = 10)   # 10 x 10
B <- matrix(1:1000, nrow = 10)   # 10 x 100

#Inspect Dimension
cat("dim(A): ", paste(dim(A), collapse = " x "), "\n")  # expected 10 x 10
cat("dim(B): ", paste(dim(B), collapse = " x "), "\n")  # expected 10 x 100

is_square <- function(M) { d <- dim(M); d[1] == d[2] }
cat("Is A square? ", is_square(A), "\n")
cat("Is B square? ", is_square(B), "\n")

#Compute Inverses/Determinants
# For A
detA <- det(A)              # determinant
invA <- tryCatch(solve(A),  # inverse
                 error = function(e) e)

# For B
detB <- tryCatch(det(B), 
                 error = function(e) e)

invB <- tryCatch(solve(B), 
                 error = function(e) e)

#Print results 
cat("det(A):\n"); print(detA)
cat("\ninvA:\n"); print(invA)

cat("\nAttempt det(B):\n"); print(detB)
cat("\nAttempt inv(B):\n"); print(invB)