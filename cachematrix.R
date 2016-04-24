## Put comments here that give an overall description of what your
## functions do

## FUN:"makeCacheMatrix"
## makeCacheMatrix takes a square matrix, calculates its inverse using 
## the built-in function "solve", stores it in variable "inv"

## FUN: "cacheSolve"
## cacheSolve takes a square matrix, check if its inverse is cached, or
## calculate its inverse using "solve" funchtion


## cache inverse for given matrix
makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL
  set <- function(y) {
    x <<- y
    inv <<- NULL
  }
  get <- function() x
  setinverse <- function(solve) m <<- solve
  getinverse <- function() inv

  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}


## provide inverse of given matrix, first check cache, then calculate
cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  inv <- x$getinverse()
  ## check if exists
  if(!is.null(inv)) {
    message("getting cached data")
    return(inv)
  }
  
  ## calculate
  data <- x$get()
  inv <- solve(data, ...)
  x$setinverse(inv)
  inv
}
