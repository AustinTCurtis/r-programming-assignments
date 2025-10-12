# Built-in dataset
data("mtcars")

# Peek at the data
head(mtcars)
str(mtcars)

# These are all generics that dispatch methods based on class
print(mtcars)          # Uses print.data.frame
summary(mtcars)        # Uses summary.data.frame

# Derived an object
fit <- lm(mpg ~ hp + wt, data = mtcars)
class(fit)
summary(fit)           # summary.lm
print(fit)             # print.lm

# Created an S3 object
s3_obj <- list(name = "Myself", age = 29, GPA = 3.5)
class(s3_obj) <- "student_s3"

# Defined an S3 print() method
print.student_s3 <- function(x, ...) {
  cat(sprintf("S3 Student: %s (age %d), GPA = %.2f\n", x$name, x$age, x$GPA))
}

# Defined an S3 summary() method
summary.student_s3 <- function(object, ...) {
  out <- list(
    fields = names(object),
    numeric_fields = names(Filter(is.numeric, object)),
    gpa_ok = object$GPA >= 2.0
  )
  class(out) <- "summary.student_s3"
  out
}

# A print method for the *summary* result
print.summary.student_s3 <- function(x, ...) {
  cat("Fields:", paste(x$fields, collapse = ", "), "\n")
  cat("Numeric fields:", paste(x$numeric_fields, collapse = ", "), "\n")
  cat("GPA meets 2.0 threshold?:", x$gpa_ok, "\n")
}

print(s3_obj)      # dispatches to print.student_s3
summary(s3_obj)    # returns summary.student_s3 and then prints via its print() method

# Loaded methods for S4 
library(methods)

# Defined an S4 class
setClass("student_s4",
         slots = c(name = "character", age = "numeric", GPA = "numeric")
)

# Created an S4 object
s4_obj <- new("student_s4", name = "Myself", age = 29, GPA = 3.5)

# For S4, "show" is the standard display generic
setMethod("show", "student_s4", function(object) {
  cat(sprintf("S4 Student: %s (age %d), GPA = %.2f\n",
              object@name, as.integer(object@age), object@GPA))
})

# Define a simple S4 generic and method
setGeneric("student_ok", function(x) standardGeneric("student_ok"))
setMethod("student_ok", "student_s4", function(x) x@GPA >= 2.0)

s4_obj          # triggers show()
student_ok(s4_obj)
