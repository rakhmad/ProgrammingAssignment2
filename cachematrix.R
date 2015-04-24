## Matrix inversion is usually a costly computation and there may be 
## some benefit to caching the inverse of a matrix rather than compute 
## it repeatedly

## makeCacheMatrix creates a list containing a function to
## 1. set the value of the matrix
## 2. get the value of the matrix
## 3. set the inverse value of the matrix
## 4. get the inverse value of the matrix
makeCacheMatrix <- function(x = matrix()) {
	m <- NULL
	set <- function(y) {
		x <<- y
		m <<- NULL
	}
	get <- function() x
	setinverse <- function(solve) m <<- solve
	getinverse <- function() m
	list(set = set, get = get,
		 setinverse = setinverse, 
		 getinverse = getinverse)

}

## The following function returns the inverse value of the matrix
## First it will check whether inverse value has been computed. 
## If so, then it will get the result from cache and compute nothing.
## If not, then it computes and then stores the value using setinverse
## function.

cacheSolve <- function(x, ...) {
	## Search for inverse value in cache
	m <- x$getinverse()
	if(!is.null(m)) {
		## Cached value is found
		message("Retrieve from cache...")
		return m
	}
	data <- x$get()
	m <- solve(data, ...)
	x$setinverse(m)
	m
}
