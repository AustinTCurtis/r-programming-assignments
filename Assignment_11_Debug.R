# Helper for Tukey rule (Q1 - 1.5*IQR, Q3 + 1.5*IQR)
tukey.outlier <- function(v) {
  qs  <- stats::quantile(v, c(0.25, 0.75), na.rm = TRUE)
  iqr <- diff(qs)
  (v < qs[1] - 1.5 * iqr) | (v > qs[2] + 1.5 * iqr)
}

# Original (buggy) function
tukey_multiple <- function(x) {
  outliers <- array(TRUE, dim = dim(x))
  for (j in 1:ncol(x)) {
    outliers[, j] <- outliers[, j] && tukey.outlier(x[, j])  # <-- BUG: '&&'
  }
  outlier.vec <- vector("logical", length = nrow(x))
  for (i in 1:nrow(x)) {
    outlier.vec[i] <- all(outliers[i, ])
  }
  return(outlier.vec)
}

# Test data + run (now correctly placed AFTER the function is defined)
set.seed(123)
test_mat <- matrix(rnorm(50), nrow = 10)
tukey_multiple(test_mat)

corrected_tukey <- function(x) {
  # Optional defensive checks
  if (!is.matrix(x)) stop("`x` must be a matrix.")
  if (!is.numeric(x)) stop("`x` must be a numeric matrix (no character/factor columns).")
  if (ncol(x) == 0L || nrow(x) == 0L) stop("`x` must have at least 1 row and 1 column.")
  
  outliers <- array(TRUE, dim = dim(x))
  for (j in seq_len(ncol(x))) {
    outliers[, j] <- outliers[, j] & tukey.outlier(x[, j])  # <-- FIX: '&'
  }
  outlier.vec <- logical(nrow(x))
  for (i in seq_len(nrow(x))) {
    outlier.vec[i] <- all(outliers[i, ])
  }
  outlier.vec
}

corrected_tukey(test_mat)