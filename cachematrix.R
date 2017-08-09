

## creates a "matrix" - list with functions to: 
## set and get the value of the matrix,
## set and get the inverse matrix using solve() - function.
## can cache its inverse matrix

makeCacheMatrix <- function(x = matrix()) {

  s <- NULL
  set <- function(y) {
    x <<- y ##assign a value to an object in a different environment
    s <<- NULL
  }
  get <- function() x
  setsolve <- function(solve) s <<- solve
  getsolve <- function() s
  list(set = set, get = get,
       setsolve = setsolve,
       getsolve = getsolve)
}


## Return a matrix that is the inverse of 'x'

cacheSolve <- function(x, ...) {
       
  ##checks if the solve(x) (inverse matrix) has already been calculated
  s <- x$getsolve()
  if(!is.null(s)) {
    message("getting cached data")
    return(s)
  }
  data <- x$get()
  s <- solve(data, ...)
  x$setsolve(s)
  s
}