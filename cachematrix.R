## This is Programming Assignment 2 for the R Progrmming Coursera class demonstrating Lexical Scoping

## Function makeCacheMatrix creates a vector of functionss that
## - Set the value of a matrix
## - Gets the value of the matrix
## - Calculates the inverse of said matrix
## - Gets the inverse of said matrix

makeCacheMatrix <- function(X = matrix()) {
  M <- NULL
  set <- function(Y){
    X <<- Y
    M <<- NULL
  }
  get <- function() X
  setSolve <- function(solve) M <<- solve
  getSolve <- function() M
  list(set = set, get = get, setSolve = setSolve, getSolve=getSolve)
}


## Function cacheSolve calcultes the inverse of the matric created with
## makeCacheMatrix.  If the inverse has already been calculated, it
## retrives it from cache.  Otherwise it calculates it via the setSolve 
## function.

## Note : the native R function solve(A) (see help(solve) for more info)
## is used to calculate the inverse of a matrix A

cacheSolve <- function(X, ...) {
        ## Return a matrix that is the inverse of 'x'
  M <- X$getSolve()
  if(!is.null(M)){
    message("getting cached data")
    return (M)
  }
  data <- X$get()
  M <- solve(data, ...)
  X$setSolve(M)
  M
}
