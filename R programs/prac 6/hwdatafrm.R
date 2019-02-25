getwd()
basic  <- read.csv("2_page_s5_file_5.csv")
head(basic)
dataframe19 <- basic[basic$Year == 1960,]
dataframe20 <- basic[basic$Year == 2013,]
dataframe19$Birth.rate <- Life_Expectancy_At_Birth_1960

dataframe20$Birth.rate <- Life_Expectancy_At_Birth_2013


#Visual data 1960
qplot(data=dataframe19, x=Fertility.Rate, y=Birth.rate, color=Region,
      alpha=I(0.6),shape=I(19),main = "Birth Rate vs Fertility Rate")

#Visual data 2013
qplot(data=dataframe20, x=Fertility.Rate, y=Birth.rate, color=Region,
      alpha=I(0.6),shape=I(19),main = "Birth Rate vs Fertility Rate")
