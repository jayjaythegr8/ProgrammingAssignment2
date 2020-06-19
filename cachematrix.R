## functions below compute and cache the inverse of a matrix

## function below takes a square matrix and returns a list
## containing functions to 
##  1. set the matrix
##  2. get the matrix
##  3. set the inverse
##  4. get the inverse

makeCacheMatrix <- function(x = matrix()) {
  inversed <- NULL
  set <- function(y) {
    x <<- y 
    inversed <<- NULL
  }
  get <- function() x
  setinverse <- function(inverse) inversed <<- inverse 
  getinverse <- function() inversed
  list(set = set, get = get, 
       setinverse = setinverse,
       getinverse = getinverse)
}

## function below returns the inverse of the matrix put
## into makeCacheMatrix
## if it has already been calculated it gets the result from
## the cache 
## if not, calculates the inverse using solve() function 

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  inversed <- x$getinverse()
  if(!is.null(inversed)) {
    message("getting cached data")
    return(inversed)
  }
  data <- x$get()
  inversed <- solve(data, ...)
  x$setinverse(inversed)
  inversed
}
