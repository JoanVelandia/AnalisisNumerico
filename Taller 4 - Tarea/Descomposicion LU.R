luA = function(A){ 
  n = nrow(A) 
  LU = A 
  for(j in 1:(n-1)){
    # columna j 
    for(i in (j+1): n){ # filas i > j
      LU[i,j]=LU[i,j]/LU[j,j] # Construye de L 
      for(k in (j+1):n){ # Eliminaci?n filas i >j. Pivote LU[j,j] 
        LU[i,k] = LU[i,k] - LU[i,j]*LU[j,k] # Construye U 
      } 
    } 
  } 
  return(LU) 
} 

solvelu = function(LU, b)
{
  n = nrow(LU)
  sol = rep(NA, times = n)
  sol[1] = b[1] 
  
  for (i in 2:n)
  {
    s = 0
    
    for (j in 1:(i-1))
    {
      s = s + LU[i,j]*sol[j]
    }
    
    sol[i] = b[i]-s
  }
  
  sol[n] = sol[n]/LU[n,n]
  
  for(i in (n-1):1)
  {
    s = 0
    
    for (j in (i+1):n)
    {
      s = s + LU[i,j]*sol[j]
    }
    
    sol[i] = (sol[i]-s)/LU[i,i]
  }
  
  return(sol)
}

A = matrix(c(3.5,4.2,0.5,1/3), nrow=2, byrow=TRUE) 
b = c(1.3, 7/4) 
# Descomposición LU de A 
LU = luA(A)

print(LU)

print(solvelu(LU,b)) 

