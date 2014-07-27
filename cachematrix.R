## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

#makeCacheMatrix: This function creates a special "matrix" object that can cache its inverse
makeCacheMatrix <- function(x = matrix()) {
    inv <- NULL

    set <- function(matrix) {
        
        if (!identical(x,matrix)) {
            message("Clear containing env as matrix has changed)")
            x <<- matrix
            inv <<- NULL          
        }

    }
    
    get <- function() {
        x        
    }
    
    setInv <- function(matrix) {
        message("save in containing function environment (aka cache)")
        inv <<- matrix
    }
    

    getInv <- function() {
        inv
    }
    
    
    list(set = set, 
         get = get,
         setInv = setInv,
         getInv = getInv)
    
    
}


## Write a short comment describing this function
#This function computes the inverse of the special "matrix" returned by makeCacheMatrix above. 
#If the inverse has already been calculated (and the matrix has not changed), 
#then the cachesolve should retrieve the inverse from the cache.
cacheSolve <- function(x, ...) {
    inv <- x$getInv()
    
    if( !is.null(inv) ) {
        message("getting cached inverse")
        return( inv )
    }
    
    message("computing inverse")
    inv <- solve(x$get(), ...)
    x$setInv(inv)
    
    inv
    
}
