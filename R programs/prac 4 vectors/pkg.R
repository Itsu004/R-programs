

library(ggplot2)
qplot(data=diamonds,carat,price,color =clarity,facets = .~clarity)
