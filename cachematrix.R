## The main goal of the following functions is to cache the matrix inversion result 
## so that the time-consuming computing process can be saved.  

## makeCacheMatrix function is intended to define some other functions,
##it creates a special "matrix" object that can cache its inverse.

    makeCacheMatrix <- function(x = matrix()) {
       m <- NULL
      set <- function(y) {
      x <<- y
      m <<- NULL
  }
     get <- function() x
    setinversion <- function(inversion) m <<- inversion
    getinversion <- function() m
    list(set = set, get = get,
       setinversion = setinversion,
       getinversion = getinversion)
}


## This function computes the inverse of the special "matrix" returned by makeCacheMatrix above. 
##If the inverse has already been calculated (and the matrix has not changed), 
##then the cachesolve should retrieve the inverse from the cache.

    cacheSolve <- function(x, ...) {
      m <- x$getinversion()
      if(!is.null(m)) {
          message("getting cached data")
          return(m)
      }
    data <- x$get()
     m <- solve(data, ...)
    x$setinversion(m)
     m
    ## Return a matrix that is the inverse of 'x'
}
