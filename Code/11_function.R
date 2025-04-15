# Code to build your own functions

somma <- function(x,y) {
  z=x+y
  return(z)
  }

# Ex: make a new function called difference

diff <- function(x,y) {
  z=x-y
  return(z)
  }

# fare funzione che costruisca un multiframe

mf <- function(nrow,ncol) {
  par(mfrow=c(nrow,ncol))
  }

positivo <- function(x) {
  if(x>0) {
    print("Questo numero è positivissimo, don't you know it? :P")
    }
  else if(x<0) {
    print("Questo numero è negativo, CAPRAA!")
    }
    else {
      print("I misteri della matematica generano un buco nero, mi dispiace hai perso!")
    }
}
