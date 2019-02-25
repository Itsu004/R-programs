
read.csv()

#Method 1: Select the file manually
stats <- read.csv((file.choose()))
stats

#Method 2: Set WD and Read Data
getwd()
#Windows:
setwd("D:\\R programs\\prac 6")
#Mac:
setwd("/Users/<username>/Desktop/<folder>")
getwd()
rm(stats)
stats <- read.csv("2_page_s5_file_2.csv")
stats

#-----------------------Exploring data
stats
nrow(stats)
ncol(stats)
head(stats, n=10)
tail(stats, n=8)
str(stats)
summary(stats)

#-----------------------Using the $ sign
stats
head(stats)
stats[3,3]
stats[3,"Birth.rate"]
stats$Internet.users[2]
c <-levels(stats$Income.Group)



#-----------------------Basic Operations with a DF
stats[1:10,]  #subsetting
stats[3:9,]
stats[c(4,100),]
#Remember how the [] work:
is.data.frame(stats[1,])
is.data.frame(stats[,1,drop=F])

#multiply columns
head(stats)
stats$Birth.rate *stats$Internet.users
stats$Birth.rate +stats$Internet.users
stats$Country.Name - stats$Country.Code
#add columns
head(stats)
stats$Mtcalc <-stats$Birth.rate *stats$Internet.users
#test of knowledge
stats$xyz <- 1:5
stats
#remove a column
stats$xyz <- NULL
stats$Mtcalc <- NULL

#-----------------------Filtering Data Frames
head(stats)
filter <-stats$Internet.users < 2
stats[filter,]

stats[stats$Birth.rate > 40 & stats$Internet.users < 2,]
stats[stats$Income.Group == "High income",]


stats[stats$Country.Code == "MLT",]


#---------------------Introduction to qplot
?qplot
qplot(data=stats,x=Internet.users)
qplot(data = stats, x=Income.Group,y=Birth.rate)
qplot(data = stats, x=Income.Group,y=Birth.rate,size=I(3),color=I(2))
qplot(data = stats, x=Income.Group,y=Birth.rate,geom = "boxplot")


#---------------------Visualizing what you need
qplot(data = stats,x=Internet.users,y=Birth.rate)
qplot(data = stats,x=Internet.users,y=Birth.rate,size=I(4))
qplot(data = stats,x=Internet.users,y=Birth.rate,size=I(4),color=Income.Group)

#---------------------Creating data frame

mydf <-data.frame(Countries_2012_Dataset,Codes_2012_Dataset,Regions_2012_Dataset)
head(mydf)
#colnames(mydf)<- c("Country","Code","Region")
rm(mydf)
mydf <-data.frame(Country=Countries_2012_Dataset,Code=Codes_2012_Dataset,Region=Regions_2012_Dataset)
#mydf <-cbind.data.frame(Countries_2012_Dataset,Codes_2012_Dataset,Regions_2012_Dataset)


#---------------------Merging data frame

head(stats,n=10)
head(mydf,n=10)

stats$Region <- mydf$Regions_2012_Dataset[stats$Country.Code == mydf$Codes_2012_Dataset]

#Or Kirill one
merged <-merge(stats,mydf, by.x ="Country.Code", by.y = "Codes_2012_Dataset")

#some duplicate cols remove
merged$Country <- NULL


#---------------------Visualizing new date frame
#1.Shapes
qplot(data = stats,x=Internet.users,y=Birth.rate,size=I(4),color=Region,shape=I(17))

#2.transparency
qplot(data = stats,x=Internet.users,y=Birth.rate,size=I(4),color=Region,shape=I(19),
              alpha=I(0.6))
#3.Title
qplot(data = stats,x=Internet.users,y=Birth.rate,size=I(4),color=Region,shape=I(19),
      alpha=I(0.6), main = "Birth Rate vs Internet Users")
