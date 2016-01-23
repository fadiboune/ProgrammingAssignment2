## cache and return the inverse value of a matrix

## create a special matrix object that can cache its inverse

makeCacheMatrix <- function(x = matrix()) {
      matInv <- NULL
      # cache the value of the matrix
      set <- function(y) {
            x <<- y
            # initialize the inverse value of the matrix
            matInv <<- NULL
      }
      # get the value of the matrix
      get <- function() x
      # set the result of solve in the cache
      setInv <- function(inv) matInv <<- solve(x)
      # get the inverse of the matrix
      getInv <- function() matInv
      list(set = set, get = get,
           setInv = setInv,
           getInv = getInv)
}

## calculate the inverse of the matrix created with makeCacheMatrix

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
      matInv <- x$getInv()
      # if already cached, getting from cache
      if(!is.null(matInv)) {
            message("getting cached data")
            return(matInv)
      }
      data <- x$get()
      matInv <- solve(data, ...)
      x$setInv(matInv)
      # return the inverse matrix
      matInv
}

# results obtained
#
# my_matrix
# 
#       [,1] [,2] [,3] [,4]
#  [1,]    1   -4    9    5
#  [2,]    2    2   10   76
#  [3,]    3   -1   11    1
#  [4,]    4    9   12    9
#
#
# m<- makeCacheMatrix(my_matrix)
# > cacheSolve(m)
#              [,1]        [,2]         [,3]         [,4]
#  [1,] -0.87771503  0.08047350  0.972198089 -0.299956560
#  [2,]  0.07211121 -0.01737619 -0.181581234  0.126846221
#  [3,]  0.24695917 -0.02486968 -0.191138141  0.094048653
#  [4,] -0.01129453  0.01476977  0.004344049 -0.007819288
#> cacheSolve(m)
#getting cached data
#              [,1]        [,2]         [,3]         [,4]
#  [1,] -0.87771503  0.08047350  0.972198089 -0.299956560
#  [2,]  0.07211121 -0.01737619 -0.181581234  0.126846221
#  [3,]  0.24695917 -0.02486968 -0.191138141  0.094048653
#  [4,] -0.01129453  0.01476977  0.004344049 -0.007819288