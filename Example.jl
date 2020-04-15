using fit

function MyFunction(x)
	r=rand(1)[1]
	y=sin(x)+cos(x/pi)+((r-0.5)/10) #Rand nos from -0.1:0.1
end


println("setup test data")
x = range(0,stop=2*pi,length=n) #points(S,20);# the default grid
y = zeros(n)
for i=1:n
	y[i] = MyFunction(x[i]);      # values at the default grid
end

println("interpolating func")
f=fit(x,y,"Chebyshev",5)

println("evaluating interpolated func")
result = zeros(n)
for i=1:n
	result[i] = f(p[i]);      # values at the default grid
end

println("plotting")
plot1 = plot()
plot!(p,result)
scatter!(p,v)
display(plot1)
