setwd("D:\\R programs\\prac 7")
getwd()

movies <- read.csv("2_page_s6_file_2.csv")
head(movies)
colnames(movies) <- c("Film", "Genre" , "CriticRating", "AudienceRating", "BudgetMillions", "Year")
head(movies)
tail(movies)
str(movies)
summary(movies)


movies$year <- factor(movies$Year)
summary(movies)
str(movies)



#------------------Aesthetics
library(ggplot2)

ggplot(data=movies, aes(x=CriticRating, y=AudienceRating))

#add geometry
ggplot(data=movies, aes(x=CriticRating, y=AudienceRating))+ 
  geom_point()

#add color
ggplot(data=movies, aes(x=CriticRating, y=AudienceRating,
                        color=Genre)) +
geom_point()
  
#add size
ggplot(data=movies, aes(x=CriticRating, y=AudienceRating,
                        color=Genre, size=Genre)) +
  geom_point()  
  
#add size - better way
ggplot(data=movies, aes(x=CriticRating, y=AudienceRating,
                        color=Genre, size=BudgetMillions)) +
  geom_point()  
#>>> This is #1 (We will improve it)

#-------------------Plotting with layers

p <- ggplot(data=movies, aes(x=CriticRating, y=AudienceRating,
                             color=Genre, size=BudgetMillions))

#point
p + geom_point()

#lines
p + geom_line()

#multiple layers
p + geom_point() + geom_line()
p + geom_line() + geom_point()


#---------------Overriding Aesthetics

q <- ggplot(data=movies,aes(x=CriticRating, y = AudienceRating,
                            color=Genre, size=BudgetMillions))

#add geom layer
q + geom_point()

#Overriding aes
#ex1
q + geom_point(aes(size=CriticRating))

#ex2
q + geom_point(aes(color=BudgetMillions))

#q remains the same
q + geom_point()

#ex3
q + geom_point(aes(x=BudgetMillions)) +
  xlab("Budget Millions $$$")
#>>> 2nd chart


#ex4
p + geom_line() + geom_point()
#reduce line size
p + geom_line(size=1) + geom_point()

#---------------Mapping vs Setting

r <- ggplot(data=movies,aes(x=CriticRating, y = AudienceRating))
r + geom_point()

#Add color
#1. Mapping (What we have done so far)
r + geom_point(aes(color = Genre))
#2. Setting
r + geom_point(color="DarkGreen")
#ERROR
#r + geom_point(aes(color = "DarkGreen"))

#1. Mapping
r + geom_point(aes(size = BudgetMillions))
#2. Setting
r + geom_point(size =10)
#ERROR
#r + geom_point(aes(size=10))


#---------------Histograms and density charts

s <- ggplot(data=movies, aes(x=BudgetMillions))
s + geom_histogram(binwidth = 10)

#add color
#setting the color
s + geom_histogram(binwidth = 10,fill="green")
#mapping the color
s + geom_histogram(binwidth = 10,aes(fill=Genre))
#add a border
s + geom_histogram(binwidth = 10, aes(fill=Genre),
                   color="Black")
#>>> 3rd chart (We will improve it)

#Sometimes you may need density charts:
s + geom_density(aes(fill=Genre))
s + geom_density(aes(fill=Genre),position = "stack")


#------------ Staring layer tips

t <- ggplot(data=movies,aes(x=AudienceRating))
t + geom_histogram(binwidth = 10, 
                   fill="White",color="Blue")

#another way:
t <- ggplot(data=movies)
t + geom_histogram(binwidth = 10,
                   aes(x=AudienceRating),
                   fill="White", color="Blue")

#>>> 4th chart
t + geom_histogram(binwidth = 10,
                   aes(x=CriticRating),
                   fill="White", color="Blue")

#>>> 5th Chart

#skeleton plot
t <- ggplot()


#-----------------Statistical Transformation

?geom_smooth()

u <- ggplot(data = movies, aes(x=CriticRating, y=AudienceRating,
                               color=Genre))
u + geom_point() + geom_smooth(fill=NA)

#boxplots
u <- ggplot(data=movies, aes(x=Genre, y=AudienceRating,
                             color=Genre))
u + geom_boxplot()
u + geom_boxplot(size=1.2)
u + geom_boxplot(size=1.2) + geom_point()
#tip/hack
u + geom_boxplot(size=1.2) + geom_jitter()
#another way
u + geom_jitter() + geom_boxplot(size=1.2,alpha=0.5)
#>>> 6th chart


#challenge
u2 <- ggplot(data=movies, aes(x=Genre, y=CriticRating,
                             color=Genre))
u2 + geom_jitter() + geom_boxplot(size=1.2,alpha=0.5)

#----------------Using Facets

v <- ggplot(data=movies,aes(x=BudgetMillions))
v + geom_histogram(binwidth = 10,aes(fill=Genre),
                   color="black")

#facets
v + geom_histogram(binwidth = 10,aes(fill=Genre),
                   color="black") +
  facet_grid(Genre~., scales="free")

#scatterplots
w <- ggplot(data = movies, aes(x=CriticRating, y=AudienceRating,
                               color=Genre))
w + geom_point(size=3)

#facets
w + geom_point(size=3)+
  facet_grid(Genre~.)

w + geom_point(size=3)+
  facet_grid(.~Year)

w + geom_point(size=3)+
  facet_grid(Genre~Year)

w + geom_point(size=3)+
  facet_grid(Genre~Year)+
  geom_smooth()

w + geom_point(aes(size=BudgetMillions))+
geom_smooth()+
  facet_grid(Genre~Year)
#>>> 1 (But still will improve)

#------------------Coordinates

#Today:
#limits
#zoom

m <- ggplot(data = movies, aes(x=CriticRating,y=AudienceRating,
                               size=BudgetMillions, color=Genre))
m + geom_point()

m + geom_point() +
  xlim(50,100)+
 ylim(50,100)


#won't work well always
n <- ggplot(data=movies, aes(x=BudgetMillions))
n + geom_histogram(binwidth = 10,aes(fill=Genre),
                   color="Black")

n + geom_histogram(binwidth = 10,aes(fill=Genre),
                   color="Black") +
  ylim(0,50)

#instead zoom
n + geom_histogram(binwidth = 10,aes(fill=Genre),
                   color="Black") +
  coord_cartesian(ylim = c(0,50))


#improve #1:
w + geom_point(aes(size=BudgetMillions))+
  geom_smooth()+
  facet_grid(Genre~Year) +
  coord_cartesian(ylim=c(0,100))


#--------- Theme
o <- ggplot(data=movies, aes(x=BudgetMillions))
h <-o + geom_histogram(binwidth = 10, aes(fill=Genre),
                   color="Black")


#add axes label
h + xlab("Money Axis") +
    ylab("Number of Movies")

#label formatting
h + xlab("Money Axis") +
  ylab("Number of Movies") +
  theme(axis.title.x = element_text(color="DarkGreen", size=30),
        axis.title.y = element_text(color="Red",size=30))

#tick mark formatting
h + xlab("Money Axis") +
  ylab("Number of Movies") +
  theme(axis.title.x = element_text(color="DarkGreen", size=30),
        axis.title.y = element_text(color="Red",size=30),
        axis.text.x = element_text(size = 20),
        axis.text.y = element_text(size=20))


#legend formatting
h + xlab("Money Axis") +
  ylab("Number of Movies") +
  theme(axis.title.x = element_text(color="DarkGreen", size=30),
        axis.title.y = element_text(color="Red",size=30),
        axis.text.x = element_text(size = 20),
        axis.text.y = element_text(size=20),
        legend.title = element_text(size = 30),
        legend.text = element_text(size=20),
        legend.position = c(1,1),
        legend.justification = c(1,1))




#title
h + xlab("Money Axis") +
  ylab("Number of Movies") +
  ggtitle("Movie Budget Distribution")+
  theme(axis.title.x = element_text(color="DarkGreen", size=30),
        axis.title.y = element_text(color="Red",size=30),
        axis.text.x = element_text(size = 20),
        axis.text.y = element_text(size=20),
        legend.title = element_text(size = 30),
        legend.text = element_text(size=20),
        legend.position = c(1,1),
        legend.justification = c(1,1),
        
        plot.title = element_text(color="DarkBlue",
                                  size = 40, family="Arial"))
