## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

# This function creates a special "matrix" object that can cache its inverse.
makeCacheMatrix <- function(x = matrix()) { # define argument with default "matrix
  inv <- NULL # initialize inv as NULL, holds inverse matrix
  set <- function(y){ #define the new function
    x <<- y # stores the value in the environment
    inv <<- NULL  # if there is a new matrix, reset inv to NULL
  }
  get <- function() {x} # define the get fucntion
  setInverse <- function(inverse) {inv <<- inverse} # assigns value of inv in parent environment
  getInverse <- function() {inv} # gets the value of inv
  list(set = set, get = get, setInverse = setInverse, getInverse = getInverse) # you need this in order to use the $
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  inv <- x$getInverse()
  if(!is.null(inv)){
    message("getting cached data")
    return(inv)
  }
  mat <- x$get()
  inv <- solve(mat, ...)
  x$setInverse(inv)
  inv
}
