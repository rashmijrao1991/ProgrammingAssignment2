## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {

}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
}

## makeCacheMatrix: This function creates a special "matrix" object that can cache its inverse.
# <<- operator is used to assign a value to an object in an 
#     environment that is different from the current environment
makeCacheMatrix <- function(x = matrix()) {
  invmat<-NULL
  set <- function(y) {
    x <<- y
    invmat <<- NULL
  }
  get<- function(x) {
    x
  }
  setinverse<-function(y){
    invmat<<-y
  }
  getinverse<-function() {
    invmat
  }
  list(set=set,get=get,setinverse=setinverse,getinverse=getinverse)
  
}


## cacheSolve: This function computes the inverse of the special "matrix" returned
# by makeCacheMatrix above. If the inverse has already been calculated 
# (and the matrix has not changed), then the cachesolve should retrieve the inverse from the cache.


cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  # x is an object of makeCacheMatrix
  invmat<-x$getinverse()
  if(!is.null(invmat)){
    message("Cached inverse matrix")
    return(invmat)
  }
  data<- x$get()
  invmat <- solve(data, ...)
  x$setinverse(invmat)
  invmat
  
}

#to check
#x1 <- diag(5,3)
#CachedMarix <- makeCacheMatrix(x1)
#cacheSolve(CachedMarix)


