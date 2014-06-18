## Combined these two functions will create a special "matrix" object 
##and compute and cache the inverse of a matrix

## makeCacheMatrix will create a list with functions to:
##set the value of the matrix, 
##get the value of a matrix, 
##set the value of the inverse of the matrix and, 
##get the value of th inverse of the matrix

makeCacheMatrix <- function(x = matrix()) {
Imatrix<-NULL
set<-function(y){
  x<<-y
  Imatrix<<-NULL
}
get<-function()x
SetInverse<-function(solve)Imatrix<<-solve
GetInverse<-function()Imatrix
list(set=set,get=get,SetInverse=SetInverse,GetInverse=GetInverse)
}


## CacheSolve computes the inverse of the matrix returned by makeCacheMatrix. 
## if the inverse has already be calculated and is unchanged it will simply return the cached inverse

cacheSolve <- function(x, ...) {
Imatrix<-x$GetInverse()
if(!is.null(Imatrix)){
  message("retrieving cached inverse")
  return(Imatrix)
}
message("calculating inverse of matrix")
matrix<-x$get()
Imatrix<-solve(matrix)
x$SetInverse(Imatrix)
Imatrix
}
