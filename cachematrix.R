## These functions written in partial fulfillment of Coursera Data Science: R Programming 
## Week 3 Assignment; GitHub user: Saiham06

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
  ## This function creates a special "matrix" object that can cache its inverse
  j<- NULL
  set<- function(y){
    x<<- y
    j<<- NULL
  }
  get<- function()x
  setInverse<- function(inverse) j<<- inverse
  getInverse<- function()j
  list(set = set, get = get, setInverse = setInverse, getInverse = getInverse)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  j<-x$getInverse()
  if(!is.null(j)) {
    message("Getting Cached data")
    return(j)
  }
  mat<- x$get()
  j<- solve(x, ...)
  x$setInverse(j)
  j
}

