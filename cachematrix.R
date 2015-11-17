## This combination of functions will gather the inverse of a matrix.
## If stored in cache, the function will use cache data
## If not stored in cache, function will compute inverse

## This function will complete the following:
## 1. set the value of the matrix
## 2. get the value of the matrix
## 3. set the value of the inverse of matrix
## 4. get the value of the inverse of matrix

makeCacheMatrix <- function(x = matrix()) {
 i <- NULL ## placeholder for inverse value
 
 set <- function(y){
   x <<- y ## set matrix 'x' to 'y'
   i <<- NULL ## set 'i' to NULL
 }
 
  get <- function() x ## returns x
  setinverse <- function(inverse) i <<- inverse ## sets i to inverse
  getinverse <- function() i ## returns i
  
  list(set = set, get = get,setinverse = setinverse,getinverse = getinverse) ## set vector to pass functions defined above
}


## This function will first check if i is stored in cache. 
## If stored in cache, it will use cached data
## If not stored in cache, it will recalculate

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  
  i <- x$getinverse()    ## sets i from cache
  if(!is.null(i)) {
    message("getting cached data") ## if i is cached, get cached data
    return(i) ## return cached data
  }

  data <- x$get()       ## get the data from matrix x
  i <- solve(data, ...) ## inverse computing
  x$setinverse(i)       ## set i to the inverse of x
  i                     ## return i
}
