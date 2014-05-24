## The following (makeCacheMatrix and cachSolve) are used to cache the inverse of a matrix so that it can be
## reused rather than recalculated when needed

## makeCacheMatrix creates a set of methods for the matrix - using these you can
## set the value of the matrix
## get the value of the matrix
## set the value of the inverse of the matrix
## get the value of the inverse of the matrix

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setinv <- function(inv) m <<- inv
  getinv <- function() m
  list(set = set, get = get,
       setinv = setinv,
       getinv = getinv)
  

}


## This funtion is used to get the inverse of a matrix, if the inverse has already been determined for this matrix
## it will be returned from a cached location, if it has not be calculated it will determined and it will be stored in the cache and 
## returned to the function caller

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  m <- x$getinv()  #call the getinv method
  if (!is.null(m)) {   #if the retrun is not null we have the inv.  matrix
    message("getting cached inverse")
    return(m)  #return the cached value
  }
  data <- x$get()
  m <- solve(data)
    x$setinv(m)
    m
  
}
