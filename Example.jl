using FitSeries

function MyFunction(x)
	r=rand(1)[1] #Random number between 0 and 1
	y=sin(x)+cos(x/pi)+((r-0.5)/10) #Random noise from -0.1:0.1
end

n=100
println("setup test data")
x = range(0,stop=2*pi,length=n) 
y = zeros(n)
for i=1:n
	y[i] = MyFunction(x[i]);     
end

println("fitting the data")
nocoeffs=5
fitType="Chebyshev"
f=FitSeries.fit(x,y,fitType,nocoeffs)

println("evaluating interpolated func")
result = zeros(n)
for i=1:n
	result[i] = f(x[i]);      
end

using Plots
println("plotting")
plot1 = plot()
scatter!(x,y,color = :lightblue,label="InputData")
plot!(x,result,color = :black,label="Fit with $fitType, $nocoeffs coefficients")
yaxis!("y")#, (0,1.5))
xaxis!("x")#, (-180,180))
display(plot1)
#savefig(plot1)