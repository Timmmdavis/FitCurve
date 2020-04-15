function fit(x,y,fitType,nocoeffs)
#Designed to be like MATLAB's fit function
#x - vector of points 
#y - point's value at x created by some unknown function
#fitType - string with the type of fit (Taylor,Chebyshev or Fourier)
#nocoeffs - number of coefficients, make sure this is less than the number of points: length(x)


n = length(x) #number of points
m = nocoeffs;
if "$fitType"=="Taylor" 
	S = Taylor(minimum(x)..maximum(x));
elseif "$fitType"=="Chebyshev"
	S = Chebyshev(minimum(x)..maximum(x));
elseif "$fitType"=="Fourier"
	S = Fourier(minimum(x)..maximum(x));
end
V = Array{Float64}(undef,n,m);
for k = 1:m
	V[:,k] = Fun(S,[zeros(k-1);1]).(x)
end
f = Fun(S,V\y);

#returns f where evaluating this: y_approx=f[x]
return f

end