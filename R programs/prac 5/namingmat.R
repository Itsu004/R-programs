#Named vectors
Charlie <- 1:5
Charlie

#give names
names(Charlie) <- c("a","b","c","d","e")
Charlie
Charlie["d"]
Charlie[4]

#clear names
names(Charlie)<-NULL


#------------

#naming Matrix Diementions 1
temp.vec <- rep(c("a","B","zZ"),each=3)
temp.vec

Bravo <- matrix(temp.vec,3,3)
Bravo

rownames(Bravo) <- c("How","are","You")
Bravo

colnames(Bravo) <- c("X","y","Z")
Bravo

Bravo["are","y"] <- 0
Bravo

rownames(Bravo)<-NULL
