


Games
rownames(Games)
colnames(Games)
Games["LeBronJames","2012"]

FieldGoals

round(FieldGoals/Games,1)


round(MinutesPlayed/Games)
round(FieldGoals/FieldGoalAttempts,2)








d1 <- rep(1:3,each = 3)
da1 <-matrix(d1,3,3)
d2 <- rep(5:7,times = 3)
da2 <- matrix(d2,3,3)
dm <- da1+da2
