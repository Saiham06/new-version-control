makeVector<- function(x= numeric()) {
  m<- NULL
  set<- function(y){
    x<<- y
    m<<- NULL
  }
  get<- function()x
  setmean<- function(mean) m<<- mean
  getmean<- function()m
  list(set = set, get= get, setmean= setmean, getmean= getmean)
}
catchemean<- function(x, ...) {
  m<- x$getmean()
  if(!is.null(m)) {
    message("getting catche data")
    return(m)
  }
  data<- x$get()
  m<- mean(data, ...)
  x$setmean(m)
  m
}
makeCatheMatrix<- function(x = matrix()){
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
catcheSolve<- function(x, ...){
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
