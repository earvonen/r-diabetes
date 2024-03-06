#install.packages("randomForest")
#install.packages(c("ModelMetrics", "plyr", "pROC", "reshape2"))
install.packages(c("Rcpp", "RcppTOML", "reticulate", "tfruns", "tfautograph", "readr"))
install.packages("keras")
#install.packages("caret")

library(reticulate)
install_python(version = "3.9")
use_virtualenv("r-reticulate", required=TRUE)
