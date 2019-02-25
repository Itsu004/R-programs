


myplot <- function(demo,x=1:10){
Data <- demo[x,,drop=F]
matplot(t(Data),type = "b",pch = 15:18, col = c(1:4,6))
legend("bottomleft", inset = 0.01, legend = Players[x], col = c(1:4,6), pch = 15:18,horiz = F)
}

myplot(Games)
